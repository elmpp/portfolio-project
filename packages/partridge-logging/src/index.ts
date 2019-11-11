/**
 *  - google stackdriver logging - https://goo.gl/wcwLaK
 *  - winston - https://goo.gl/EPBvF3
 */

import {config} from 'partridge-config'
import {Logger} from './logger'
import {loggingProvider} from './stackdriver-logging-provider'

export {default as DumpableError} from './dumpable-error'
export * from './__types__'

// logProvider.on('error', (err: Error) => {
//   logProvider.log('error', `Error during log provider call. Provider error msg: ${err.message}.`) // handles too-large grpc error
// })

const logger = new Logger(loggingProvider, config.logging.LOGGING_LEVEL)

export {Logger, logger}
