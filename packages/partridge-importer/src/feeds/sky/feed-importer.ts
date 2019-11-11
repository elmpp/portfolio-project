/**
 * Implementation proper for Sky
 *
 *  - the feed does not offer any clue to the "type" of the event other than if it's an outright.
 *  This means we're unable to discern `MATCH_2_TEAMS` and thus home/away outcomes. For this reason
 *  this feed will be entirely `CONCRETE_CREATE`
 *
 */

import _ from 'lodash'
import {
  FeedImporter,
  RunContext,
  RawEntity,
  Category1CommonEntity,
  Category3CommonEntity,
  EventCommonEntity,
  CommonEntityUnion,
  EventType,
  EntityName,
  CrunchAction,
  MarketCommonEntity,
  OutcomeCommonEntity,
} from '../../__types__'
import {FeedSupplierName} from 'partridge-config'
import {query} from 'jsonpath'
import {validateArray as validator} from '../../json-schema/validator'
import {numberToString} from 'org-common/util'
import {reduceMarketCollections, doJsonpath, doRequest} from '../shared'
import {EventBettingStatus, Status} from 'partridge-models'
import {AxiosResponse} from 'axios'
import Big from 'big.js'

const authQueryParam = (url: string): string => {
  return url + (url.indexOf('?') >= 0 ? '&' : '?') + 'api_user=test'
}

const uris = {
  category1s: authQueryParam('sportsapi/v2/a-z'),
  // category2s: 'oxi/pub?template=getClasses',
  // category3s: 'oxi/pub?template=getTypes&class=%s',
  // events: 'oxi/pub?template=getEvents&class=%s',
  // event: 'oxi/pub?template=getEventDetails&event=%s',
  // markets: 'oxi/pub?template=getEventDetails&event=%s',
  // outcomes: 'oxi/pub?template=getEventDetails&event=%s',
  // marketCollections: '/oxi/pub?template=getEventCollections&event=%s',
}

type JsonPathRuleFunc = (obj: any) => (args: any) => any[]
type JsonPathRule = string | JsonPathRuleFunc

// jsonpath docs (Stefan Goessner jsonpath variant) - https://goo.gl/ED7N5o
const jsonpaths: Dictionary<JsonPathRule> = {
  category1s: '$..event_classes.*',
  // category2s: '$..elements[?(@.name=="response")].elements[?(@.name=="class")].attributes',
  category3s: '$..elements[?(@.name=="response")].elements[?(@.name=="class")].elements[?(@.name=="type")].attributes',
  events:
    '$..elements[?(@.name=="response")].elements[?(@.name=="class")].elements[?(@.name=="type")].elements[?(@.name=="event")].attributes',
  event: '$..elements[?(@.name=="response")].elements[?(@.name=="event")].attributes',
  markets: '$..elements[?(@.name=="response")].elements[?(@.name=="event")].elements[?(@.name=="market")].attributes',
  outcomes: (obj: any) => (marketIndex: number) => {
    const markets = query(
      obj,
      '$..elements[?(@.name=="response")].elements[?(@.name=="event")].elements[?(@.name=="market")]'
    )
    return query(markets[marketIndex], '$.elements[?(@.name=="outcome")].attributes')
  },
  marketCollections:
    '$..elements[?(@.name=="response")].elements[?(@.name=="event")].elements[?(@.name=="collection")].attributes',
  marketCollectionsMarkets: (obj: any) => (collectionIndex: number) => {
    const collections = query(
      obj,
      '$..elements[?(@.name=="response")].elements[?(@.name=="event")].elements[?(@.name=="collection")]'
    )
    return query(collections[collectionIndex], '$.elements[?(@.name=="market")].attributes')
  },
}

export const feedImporter: FeedImporter = async (ctx: RunContext) => {
  await category1s(ctx)

  reduceMarketCollections(ctx)

  // return {} as RunReport
}

const category1s = async (ctx: RunContext) => {
  const {
    data: category1sJson,
    config: {url},
  } = await doRequest(uris.category1s, ctx)

  const category1sRaw = doJsonpath(category1sJson, jsonpaths.category1s)
  const category1sCommon = filterEntities(
    EntityName.category1,
    category1sRaw.map(
      (raw: RawEntity): Category1CommonEntity => {
        return {
          meta: {
            run_id: ctx.options.runId,
            url: url!,
            name: raw.name,
            id: numberToString(raw.id),
            feed_supplier: FeedSupplierName.sky,
          },
          associations: {},
          fields: {
            processed: {
              display_order: 0,
            },
          },
          import_tmp: {
            url: raw.url,
          },
          crunch_tmp: {
            unique_append: '',
            action: CrunchAction.create_concrete, // PLEASE NOTE ONLY CORAL WILL BE ABLE TO CREATE CATEGORY1 (the unique_prepend must be consistent during db processing)
          },
          type: EntityName.category1,
        }
      }
    ),
    ctx
  )

  if (ctx.options.validateSchema) {
    await validator(category1sCommon)
  }

  ctx.entities.category1s(category1sCommon)

  await category2s(ctx)
}

// sky has no concept of category2
const category2s = async (ctx: RunContext) => {
  ctx.entities.category2s([])

  await category3s(ctx)
}

const category3s = async (ctx: RunContext) => {
  const category1sCommon = ctx.entities.category1s()
  const category3sCommon = filterEntities(
    EntityName.category3,
    await category1sCommon.reduce(async (acc, category1Common: Category1CommonEntity) => {
      const accumulator = await acc // https://goo.gl/NYLCGw
      let category3sJson: any
      let url: string
      let category3sResponse: AxiosResponse

      try {
        category3sResponse = await doRequest(authQueryParam(category1Common.import_tmp.url), ctx)
        category3sJson = category3sResponse.data
        url = category3sResponse.config.url!
      } catch (err) {
        // will be logged by http-client anyway
        return Promise.resolve(accumulator)
      }

      _.mapValues(category3sJson.events, (raw: RawEntity, category3RawId: string) => {
        accumulator.push({
          meta: {
            run_id: ctx.options.runId,
            url,
            name: raw.name,
            id: numberToString(category3RawId),
            feed_supplier: FeedSupplierName.sky,
          },
          associations: {
            [EntityName.category2]: [], // leaving empty as this category3 action will be non-create anyway
          },
          fields: {
            processed: {
              display_order: 0,
            },
          },
          import_tmp: {
            events: raw.events,
            category1: category1Common,
          },
          crunch_tmp: {
            unique_append: ` ${category1Common.meta.name}`,
            action: CrunchAction.create_concrete,
          },
          type: EntityName.category3,
        })
      })

      return Promise.resolve(accumulator)
    }, Promise.resolve([] as Category3CommonEntity[])),
    ctx
  )

  if (ctx.options.validateSchema) {
    await validator(category3sCommon)
  }

  ctx.entities.category3s(category3sCommon)

  await category3sCommon.reduce((promise, category3Common) => {
    return promise.then(() => {
      ctx.entities.category1(category3Common.import_tmp.category1)
      ctx.entities.category3(category3Common)
      return events(ctx).then(() => {
        ctx.logger.log('debug', 'c3.', {runtime_label: 'IMPORTER', dumpables: {snapshot: [ctx.benchmarker.snapshot()]}})
      })
    })
  }, Promise.resolve())
}

const events = async (ctx: RunContext) => {
  const category1Common = ctx.entities.category1()
  const category3Common = ctx.entities.category3()
  const tmpEventIndices = Object.keys(category3Common.import_tmp.events)

  const eventsCommon = filterEntities(
    EntityName.event,
    await tmpEventIndices.reduce(async (acc, index: any) => {
      const accumulator = await acc
      const raw: RawEntity = category3Common.import_tmp.events[index]

      const {
        data: eventJson,
        config: {url},
      } = await doRequest(authQueryParam(raw.url), ctx)

      const eventDate = new Date(raw.start_time)

      accumulator.push({
        meta: {
          run_id: ctx.options.runId,
          url: url!,
          name: eventJson.desc,
          id: numberToString(eventJson.ev_id),
          feed_supplier: FeedSupplierName.sky,
        },
        associations: {
          [EntityName.category3]: [category3Common.meta],
        },
        fields: {
          processed: {
            event_date: eventDate,
            type: eventJson.outright || false ? EventType.outright : EventType.match_2_teams, // defaulting to 2_teams as this is CONCRETE_CREATE only
            display_order: 0,
          },
          concrete: {
            displayed: true,
            status: eventJson.suspended || false ? Status.active : Status.suspended,
            url: undefined,
          },
        },
        import_tmp: {
          events: raw.events,
          markets: eventJson.markets,
        },
        crunch_tmp: {
          unique_append: ` ${eventDate.toISOString().slice(0, 10)} ${category1Common.meta.name}`,
          action: CrunchAction.create_concrete,
        },
        type: EntityName.event,
      })

      return Promise.resolve(accumulator)
    }, Promise.resolve([] as EventCommonEntity[])),
    ctx
  )

  if (ctx.options.validateSchema) {
    await validator(eventsCommon)
  }

  ctx.entities.events(eventsCommon)

  await eventsCommon.reduce((promise, eventCommon: EventCommonEntity) => {
    return promise.then(async () => {
      ctx.entities.event(eventCommon)
      return marketsAndOutcomes(ctx)
    })
  }, Promise.resolve())
}

const marketsAndOutcomes = async (ctx: RunContext) => {
  const eventCommon = ctx.entities.event()
  const markets = eventCommon.import_tmp.markets

  const marketsCommon = filterEntities(
    EntityName.market,
    Object.keys(markets).reduce((acc: MarketCommonEntity[], index: string) => {
      const raw: RawEntity = markets[index]

      acc.push({
        meta: {
          run_id: ctx.options.runId,
          url: eventCommon.meta.url,
          name: raw.name,
          id: numberToString(raw.ev_mkt_id),
          feed_supplier: FeedSupplierName.sky,
        },
        associations: {
          [EntityName.event]: [eventCommon.meta],
        },
        fields: {
          processed: {},
          concrete: {
            bet_in_play: !!raw.bet_in_run,
            bet_till: eventCommon.fields.processed.event_date,
            betting_status: EventBettingStatus.priced,
            cashout_available: false,
            display_order: 0,
            eachway_available: typeof raw.eachWay !== 'undefined',
            first_four_available: false,
            forecast_available: false,
            guaranteed_price_available: false,
            place_available: false,
            quinella_available: false,
            status: raw.suspended || false ? Status.suspended : Status.active,
            tricast_available: false,
            url: undefined,
          },
        },
        import_tmp: {
          outcomes: raw.outcomes,
        },
        crunch_tmp: {
          unique_append: ` ${ctx.entities.category1().meta.name}`,
          action: CrunchAction.create_concrete,
        },
        type: EntityName.market,
      })

      return acc
    }, []),
    ctx
  )

  if (ctx.options.validateSchema) {
    await validator(marketsCommon)
  }

  ctx.entities.markets(marketsCommon)

  const outcomesCommon = filterEntities(
    EntityName.market,
    marketsCommon.reduce((acc: OutcomeCommonEntity[], marketCommon: MarketCommonEntity) => {
      Object.keys(marketCommon.import_tmp.outcomes).forEach(index => {
        const raw: RawEntity = marketCommon.import_tmp.outcomes[index]
        acc.push({
          meta: {
            run_id: ctx.options.runId,
            url: eventCommon.meta.url,
            name: raw.desc,
            id: numberToString(raw.ev_oc_id),
            feed_supplier: FeedSupplierName.sky,
          },
          associations: {
            [EntityName.market]: [marketCommon.meta],
          },
          fields: {
            processed: {},
            concrete: {
              odds: raw.has_lp ? `${raw.lp_num}/${raw.lp_den}` : undefined,
              odds_decimal: raw.has_lp ? Big(raw.lp_num).div(Big(raw.lp_den)) : undefined,
              runner_number: raw.runner_num ? parseInt(raw.runner_num) : undefined,
              handicap: undefined,
              live_price_available: !!raw.has_lp || false,
              starting_price_available: !!raw.has_sp || false,
              status: raw.suspended || false ? Status.suspended : Status.active,
              display_order: 0,
            },
          },
          crunch_tmp: {
            unique_append: ` ${ctx.entities.category1().meta.name}`,
            action: CrunchAction.create_concrete,
          },
          type: EntityName.outcome,
        })
      })

      return acc
    }, []),
    ctx
  )

  if (ctx.options.validateSchema) {
    await validator(outcomesCommon)
  }

  ctx.entities.outcomes(outcomesCommon)
}

const filterEntities = <T extends CommonEntityUnion>(entityName: EntityName, entities: T[], ctx: RunContext): T[] => {
  const logIfNotComplete = (entityName: EntityName, filtered: T[], entities: T[]) => {
    if (filtered.length) {
      ctx.logger.log('verbose', `Filtered ${entityName}. ${filtered.length}/${entities.length}`, {
        runtime_label: 'IMPORTER',
      })
    }
  }

  switch (entityName) {
    case EntityName.category1:
      const filteredCategory1 = entities.filter(
        category1Common => ['Football'].indexOf(category1Common.meta.name) !== -1
      )
      logIfNotComplete(entityName, filteredCategory1, entities)
      return filteredCategory1
    case EntityName.category3:
      const filteredCategory3 = entities.filter(
        category3Common => ['Champions League'].indexOf(category3Common.meta.name) !== -1
      )
      logIfNotComplete(entityName, filteredCategory3, entities)
      return filteredCategory3
    // case EntityName.event:
    //   const filteredEvent = entities.filter(
    //     eventCommon =>
    //       ['fa cup 5th round specials', 'brighton v derby'].indexOf(eventCommon.meta.name.toLowerCase()) !== -1
    //   )
    //   logIfNotComplete(entityName, filteredEvent, entities)
    //   return filteredEvent
    // case EntityName.category2:
    // case EntityName.market:
    // case EntityName.outcome:
    default:
  }

  // ctx.logger.log('verbose', `Processing ${entityName}. Length: ${entities.length}`)
  return entities
}

// const toBool = (val?: string): boolean => (typeof val === 'string' && val.toLowerCase() === 'y' ? true : false)
