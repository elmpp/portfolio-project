import {Config, config, FeedSupplierName} from 'partridge-config'
import {objectSetPaths} from 'org-common/util'
import {RunArgv} from '../__types__'
import {logger, Logger} from 'partridge-logging'

const mockFeedImplementations: {coral: FeedImplementation} = {
  coral: {
    feedImporter: jest.fn(),
  },
}
const mockConfig: Config = objectSetPaths<Config>(config, [['feeds.coral.url', 'http://testdomain:8888']])
const benchStart = jest.fn()
const benchStop = jest.fn()
const benchCreate = jest.fn(() => ({start: benchStart, stop: benchStop}))

const noop = () => {} // tslint:disable-line

jest.doMock('../feeds', () => mockFeedImplementations)
jest.doMock('partridge-config', () => ({config: mockConfig}))
jest.mock('partridge-models')
jest.mock('../http-client.ts', () => ({getClient: jest.fn(() => '__CLIENT')}))
jest.mock('uuid/v4', () => jest.fn(() => '__UUID'))
jest.doMock('org-common/perf', () => ({createBench: benchCreate}))
jest.spyOn(logger, 'log').mockImplementation((noop as any) as Logger['log'])
const mockLoggerLog: jest.Mock<Logger['log']> = logger.log as any
jest.spyOn(process, 'exit').mockImplementation(noop as any)

import {importer, setupContext} from '..'
import {FeedImplementation} from '../feeds'

describe('importer', () => {
  let pubSubCallback: jest.Mock<Callback>
  let pubSubMessage: PubSubMessage
  let pubSubContext: PubSubContext
  let runArgv: RunArgv

  beforeEach(() => {
    runArgv = {
      feed: FeedSupplierName.coral,
    }
    pubSubMessage = {
      data: Buffer.from(JSON.stringify(runArgv)).toString('base64'),
      messageId: 'random-message-id',
      publishTime: '2014-10-02T15:01:23.045123456Z',
    }
    pubSubContext = {
      eventId: '70172329041928',
      eventType: 'google.pubsub.topic.publish',
      resource: 'dunnowhatthisis',
      timestamp: '2018-04-09T07:56:12.975Z', // ISO 8601
    }
    pubSubCallback = jest.fn()
  })

  afterEach(() => {
    jest.clearAllMocks()
  })

  it('sets up context correctly', async () => {
    const context = setupContext(pubSubMessage, pubSubContext, pubSubCallback)

    if (!context) return

    expect(context.options).toEqual(expect.objectContaining(runArgv))
    expect(context.options.pubSubContext).toEqual(pubSubContext)
    expect(context.options.runId).toEqual('__UUID')
    expect(context.client).toEqual('__CLIENT')
    expect(benchCreate).toHaveBeenCalled()
    expect(benchStart).toHaveBeenCalled()
  })

  it('integrates according to google cloud functions', async () => {
    await importer(pubSubMessage, pubSubContext, pubSubCallback)

    expect(mockFeedImplementations.coral.feedImporter).toHaveBeenCalled()
    // expect(pubSubCallback).toHaveBeenCalled() // tough to test with the event callback
  })

  it('throws, logs and calls back with error if argv incomplete', async () => {
    const pubSubMessageInvalid = {
      ...pubSubMessage,
      data: Buffer.from(JSON.stringify({})).toString('base64'), // no runArgv in data
    }

    await importer(pubSubMessageInvalid, pubSubContext, pubSubCallback)

    expect(pubSubCallback.mock.calls[0][0]).not.toEqual(0)

    expect(mockLoggerLog).toHaveBeenCalled()
    const lastLogCall: any = mockLoggerLog.mock.calls.pop()
    expect(lastLogCall[0]).toEqual('error')
    expect(typeof lastLogCall[1]).toBe('object')
    expect(lastLogCall[2].dumpables).toHaveProperty('argv')
    expect(lastLogCall[2].dumpables.argv).toEqual([{}])
    expect(lastLogCall[2].dumpables).toHaveProperty('pubSubMessage')
    expect(lastLogCall[2].dumpables.pubSubMessage[0]).toHaveProperty('data')
    expect(lastLogCall[2].dumpables.pubSubMessage[0].data).toEqual({}) // decoded data was added to pubSubMessage
    expect(pubSubCallback).toHaveBeenLastCalledWith(1) // should bomb itself out
  })
})
