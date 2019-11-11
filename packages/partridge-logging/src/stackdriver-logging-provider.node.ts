/**
 * Sets up winston transports based on configuration and compile target.
 * Also defines the format of the log entries for consistency across transports.
 *
 *  - For logLevel Error or "upward" (GWC) will log directly to the Error Reporting Service - https://tinyurl.com/y3efape8
 */

import {createLogger, transports as winstonTransports} from 'winston'
import {config} from 'partridge-config'
import debugFun, {IDebugger} from 'debug'
import {truthy} from 'org-common/util'
import {formatEntryWithDumpables} from './entry-format'

export {default as DumpableError} from './dumpable-error'
export * from './__types__'

const debug: IDebugger = debugFun('logging:setup')
debug.log = console.log.bind(console) // https://goo.gl/KMfmSi

const transports = new Map()

if (truthy(config.logging.LOGGING_STACKDRIVER_ENABLE)) {
  const {stackdriverNodeWinstonTransport} = require('./stackdriver-node-winston-transport') // http://tinyurl.com/y383a99v

  transports.set('stackDriver', stackdriverNodeWinstonTransport)
}

if (truthy(config.logging.LOGGING_CONSOLE_ENABLE)) {
  transports.set(
    'console',
    new winstonTransports.Console({
      handleExceptions: false,
    })
  )
} else {
  // include the console transport always as winston needs at least one
  transports.set('console', new winstonTransports.Console({silent: true}))
}

debug(`Logging: ${JSON.stringify({transports: [...transports.keys()], level: config.logging.LOGGING_LEVEL})}`)

export const loggingProvider = createLogger({
  level: config.logging.LOGGING_LEVEL,
  transports: [...transports.values()],
  format: formatEntryWithDumpables,
  exitOnError: false,
})
