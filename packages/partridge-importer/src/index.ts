if (module.hot) {
  module.hot.accept()
}

require('./env-check')
import {RunArgv, RunContext, RunReport, CommonEntityUnion} from './__types__'
import {getClient} from './http-client'
import {config, Feed} from 'partridge-config'
import {logger, LogOptions, DumpableError} from 'partridge-logging'
import feedImplementations from './feeds'
import {createBench} from 'org-common/perf'
import uuid from 'uuid/v4'
import {createEntityContext} from './entity-context'
import {getConnection, Queue} from 'partridge-models'
import {Connection} from 'typeorm'
import {
  GCloudEventFunctionWithCallback,
  GCloudPubSubCallback,
  GCloudPubSubContext,
  GCloudPubSubMessage,
} from '../../typings/google-cloud'

export * from './__types__'

let connection: Connection

/**
 * Is bootstrapped by the Functions Framework - http://tinyurl.com/yyvnv7dv
 * It will be triggered as a result of PubSub Triggers - https://goo.gl/XtAJSw
 * Google NodeJS PubSub client library - https://goo.gl/xEtF8r
 * Parameters - https://tinyurl.com/y63ghyff
 */
export const importer: GCloudEventFunctionWithCallback<RunReport | void> = async (
  pubSubData,
  pubSubContext,
  pubSubCallback
) => {
  let report: RunReport
  let ctx = null // tslint:disable-line

  try {
    ctx = setupContext(pubSubData, pubSubContext, pubSubCallback) as RunContext
    if (typeof ctx === 'undefined') return doCallback(pubSubCallback, 1)

    connection = await getConnection()
    await feedImplementations[ctx.options.feed]!.feedImporter(ctx)
    report = createReport(ctx)
    await persist(ctx)
  } catch (err) {
    const reportDumpable = ctx ? [createReport(ctx, 'FAILURE')] : []
    if (err instanceof DumpableError) {
      return handleError(err, 'Unrecoverable error', pubSubCallback, {
        ...err.dumpables,
        report: reportDumpable,
      })
    }
    return handleError(err, 'Unrecoverable error', pubSubCallback, {report: reportDumpable})
  }

  // enable logs to flush - https://goo.gl/ejpvB2
  ctx.logger.log('info', 'Feed Import Completed', {runtime_label: 'IMPORTER', dumpables: {runReport: [report]}})
  doCallback(pubSubCallback)
  return report
}

const persist = (ctx: RunContext) => {
  const entityNames = ['category1', 'category2', 'category3', 'event', 'market', 'outcome', 'marketCollection']

  const models = entityNames.reduce((acc: Queue[], entityName) => {
    const ents: CommonEntityUnion[] = ctx.entities[`${entityName}s`]()
    return acc.concat(
      ents.map(ent => {
        const model = new Queue()
        const {import_tmp, ...persistableProperties} = ent
        ent.crunch_tmp.suggest_rename_rules = ctx.options.suggestRenameRules
        model.data = persistableProperties
        return model
      })
    )
  }, [])

  if (!models.length) {
    ctx.logger.log('info', 'No common entities found for db insertion', {runtime_label: 'IMPORTER'})
    return Promise.resolve()
  }

  const repo = connection.getRepository(Queue)
  return repo.insert(models)
}

function createReport(ctx: RunContext, result: RunReport['result'] = 'SUCCESS'): RunReport {
  return {
    benchmark: ctx.benchmarker.stop(),
    runOptions: ctx.options,
    entities: ctx.entities,
    result,
    asFormat: (logLevel: LogLevel): Omit<RunReport, 'asFormat'> => ({
      benchmark: ctx.benchmarker.asFormat(logLevel),
      runOptions: ctx.options,
      entities: ctx.entities.asFormat(logLevel),
      result,
    }),
  }
}

export function setupContext(
  pubSubMessage: GCloudPubSubMessage,
  pubSubContext: GCloudPubSubContext,
  pubSubCallback: GCloudPubSubCallback
): RunContext | void {
  const argv: RunArgv = JSON.parse(Buffer.from(pubSubMessage.data || '', 'base64').toString())

  // we're assuming all messages via whatever topic this is subscribed to
  // will have a RunArgv message.data field (no attributes either)
  if (typeof argv.feed === 'undefined' || !config.feeds[argv.feed]) {
    const message = 'Unexpected pubSub message received'
    return handleError(new Error(message), message, pubSubCallback, {
      pubSubMessage: [{...pubSubMessage, data: argv}],
      argv: [argv],
    })
  }

  const feedName = argv.feed
  const feedConfig = config.feeds[feedName] as Feed
  const benchmarker = createBench()
  benchmarker.start()
  return {
    benchmarker,
    client: getClient(feedConfig),
    entities: createEntityContext(),
    logger,
    options: {
      runId: uuid(),
      pubSubContext,
      ...feedConfig,
      ...argv,
      suggestRenameRules: argv.suggestRenameRules || false,
    },
  }
}

const handleError = (
  error: Error,
  _message: string,
  pubSubCallback: GCloudPubSubCallback,
  dumpables: LogOptions['dumpables'] = {}
) => {
  logger.log('error', error, {runtime_label: 'IMPORTER', dumpables})
  return doCallback(pubSubCallback, 1)
}

const doCallback = (pubSubCallback: GCloudPubSubCallback, code = 0) => {
  return pubSubCallback(code)
}
