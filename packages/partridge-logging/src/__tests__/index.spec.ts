import winston from 'winston'
import {Config} from 'partridge-config'
const {Logger: mockLogger} = jest.requireMock('../logger')
const {LoggingWinston: mockStackDriver} = jest.requireMock('@google-cloud/logging-winston')

const mockStackDriverInstance = {__LOGGING_WINSTON: undefined}
const mockCreateLogger = jest
  .spyOn(winston, 'createLogger')
  .mockImplementation(() => (({on: jest.fn()} as any) as winston.Logger))

jest.mock('../logger', () => ({
  // Works and lets you check for constructor calls:
  Logger: jest.fn().mockImplementation(() => ({})),
}))
jest.mock('@google-cloud/logging-winston', () => ({
  LoggingWinston: jest.fn().mockImplementation(() => mockStackDriverInstance),
}))
jest.mock('org-common/util')

describe('partridge-logging-index', () => {
  const mockConfig = (LOGGING_STACKDRIVER_ENABLE: boolean = true, LOGGING_CONSOLE_ENABLE: boolean = true) => {
    const mockConfig: Partial<Config> = {
      environment: {
        GCP_PROJECT_ID: 'partridge-alan',
        GCP_SERVICEACCOUNT_LOGGING: '/path/to/filename.json',
      },
      logging: {LOGGING_LEVEL: 'warn', LOGGING_STACKDRIVER_ENABLE, LOGGING_CONSOLE_ENABLE},
    }
    jest.doMock('partridge-config', () => ({config: mockConfig}))
  }
  beforeEach(() => {
    process.env.APP_NAME = 'partridge-client-frontend'
    process.env.APP_VERSION = '0.21'
  })

  afterEach(() => {
    jest.resetModules() // lifesaver
    mockStackDriver.mockClear()
    mockCreateLogger.mockClear()
    // note we do not clear `mockLogger` - see section 'Multiple require() calls' in `jest-testing.md`
  })

  it('attaches stackDriver transport when config specifies and is on server', () => {
    mockConfig(true, false)

    require('../index')

    expect(mockStackDriver).toHaveBeenCalledTimes(1)

    // serviceAccount cert required for use outside GCP
    expect(mockStackDriver.mock.calls[0][0]).toEqual(
      expect.objectContaining({projectId: 'partridge-alan', keyFilename: '/path/to/filename.json'})
    )

    // pass along the APP_NAME to allow discrimination in Stackdriver Console etc
    expect(mockStackDriver.mock.calls[0][0]).toEqual(expect.objectContaining({logName: 'partridge-client-frontend'}))

    // required to show in Stackdriver Error Reporting - https://goo.gl/GLPD4j
    expect(mockStackDriver.mock.calls[0][0]).toEqual(
      expect.objectContaining({serviceContext: {service: 'partridge-client-frontend', version: '0.21'}})
    )

    // unhandled exceptions - http://tinyurl.com/y6mrghtk
    expect(mockStackDriver.mock.calls[0][0]).toEqual(expect.objectContaining({handleExceptions: true}))

    expect(mockCreateLogger.mock.calls[0][0]!.transports).toContain(mockStackDriverInstance)
    expect(mockCreateLogger.mock.calls[0][0]).toHaveProperty('exitOnError', false)
    expect(mockCreateLogger.mock.calls[0][0]).toHaveProperty('format')
  })

  it('throws exception when env var APP_NAME/APP_VERSION not set', () => {
    expect(() => {
      mockConfig(true, true)
      delete process.env.APP_NAME
      delete process.env.APP_VERSION
      require('../index')
    }).toThrowError()
  })

  it('does not attach stackDriver transport when config specifies on but not on server', () => {
    mockConfig(false, false)
    require('../index')

    expect(mockStackDriver).not.toHaveBeenCalled()
  })

  it('does not attach stackDriver transport when config specifies off', () => {
    mockConfig(false, true)
    require('../index')

    expect(mockStackDriver).not.toHaveBeenCalled()
  })

  it('Creates Logger instance and attaches', () => {
    mockConfig(false, false)
    require('../index')

    expect(mockLogger.mock.calls[0][0]).toHaveProperty('on')
    expect(mockLogger.mock.calls[0][1]).toEqual('warn')
  })

  // it("attaches console transport when config specifies on", () => {
  //   const mockConfig: Partial<Config> = {logging: {level: 'warn', LOGGING_STACKDRIVER_ENABLE: true, LOGGING_CONSOLE_ENABLE: true}}
  //   jest.doMock("partridge-config", () => ({config: mockConfig}))
  //   require("../index")

  //   console.log('mockCreateLogger.mock.calls[0][0].transports :', mockCreateLogger.mock.calls[0][0].transports.length);
  //   expect(mockCreateLogger.mock.calls[0][0].transports[1]).toBeInstanceOf(winston.transports.Console)
  // })
})
