import {LoggingProvider} from './__types__'
import {config} from 'partridge-config'
import {StackdriverErrorReportingInitConfig} from 'stackdriver-errors-js'

/**
 * Logging provider for web scenarios. In contrast to the node logging-provider.ts
 * this will only handle logging of errors and "upward". The "logging" of other
 * metrics will be done through Google Analytics.
 *
 *  - setting up client stackdriver Google library - https://tinyurl.com/y373kbve
 */

let loggingProvider: LoggingProvider
const noop = () => {} // tslint:disable-line

const isErrorLevel = (logLevel: LogLevel) => ['error'].includes(logLevel)

const consoleLog = (logLevel: LogLevel, err: Error | string) => {
  isErrorLevel(logLevel) ? console.error(err) : console.log(err)
}

// allow webpack to remove this logging outside production
if (process.env.NODE_ENV === 'production') {
  const {initiate} = require('./client-error-reporter')

  // error handling is enabled through the winston logger...
  const errorHandlerOptions: StackdriverErrorReportingInitConfig = {
    key: config.environment.GCP_API_KEY_LOGGING!,
    projectId: config.environment.GCP_PROJECT_ID!,
    service: config.environment.APP_NAME,
    version: `${config.environment.APP_ENV}-${config.environment.APP_VERSION}`,
    reportUncaughtExceptions: true,
    reportUnhandledPromiseRejections: true,
  }

  const errorReportingInstance = initiate(errorHandlerOptions)

  loggingProvider = {
    end: noop,
    log: (logLevel, err) => {
      if (isErrorLevel(logLevel)) {
        errorReportingInstance.report(err)
      }
    },
  }
} else {
  loggingProvider = {
    end: noop,
    log: (logLevel, err) => consoleLog(logLevel, err),
  }
}

export {loggingProvider}
