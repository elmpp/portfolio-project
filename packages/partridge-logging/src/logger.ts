import {LoggingProvider, Dumpable, DumpableKey, LogOptions} from './__types__'
import format from './format'
import _ from 'lodash'

export class Logger {
  // readonly means it'll be assigned automatically to class property
  constructor(logProvider: LoggingProvider, defaultLogLevel: LogLevel) {
    this.logProvider = logProvider
    this.defaultLogLevel = defaultLogLevel
  }

  logProvider: LoggingProvider
  defaultLogLevel: LogLevel

  log(logLevel: LogLevel, messageOrError: Error | string, options: LogOptions = {}): void {
    try {
      this.logProvider.log(logLevel, messageOrError, this.optionsReducer(options, logLevel))
    } catch (err) {
      // note that this error handling is actually done in the .on('error') handler in logger index.ts
      this.logProvider.log('error', err) // handles too-large grpc error
    }
  }

  end() {
    this.logProvider.end() // http://tinyurl.com/yyo9v7p8
  }

  optionsReducer(options: LogOptions, logLevel: LogLevel): LogOptions {
    if (options.dumpables && Object.keys(options.dumpables).length !== 0) {
      options = {
        ...options,
        dumpables: _.mapValues(options.dumpables, (dumpables: Dumpable[], dumpableKey: DumpableKey) => {
          if (dumpables.length === 1) {
            return format(dumpableKey, dumpables[0], logLevel)
          }
          return dumpables.map((dumpable: Dumpable) => format(dumpableKey, dumpable, logLevel))
        }),
      }
    }
    return options
  }
}
