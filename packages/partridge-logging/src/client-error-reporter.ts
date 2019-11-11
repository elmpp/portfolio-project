/**
 * Error handler for uncaught exceptions in a web scenarios. Sends
 * errors to the Google Error Reporting service
 * Should be called early on from the web entry point (i.e. App.tsx or whatever)
 *
 *  - Google Stackdriver error reporting library - https://tinyurl.com/y2hbt8tp
 */

import StackdriverErrorReporter, {StackdriverErrorReportingInitConfig} from 'stackdriver-errors-js'

let errorReporterInstance: typeof StackdriverErrorReporter

export const initiate = (config: StackdriverErrorReportingInitConfig) => {
  errorReporterInstance = new StackdriverErrorReporter()
  errorReporterInstance.start(config)
  return errorReporterInstance
}

export const getInstance = () => {
  if (!errorReporterInstance) {
    throw new Error('Please initiate the report instance via "initiate()"')
  }
  return errorReporterInstance
}
