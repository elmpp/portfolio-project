
// client error reporting library - https://tinyurl.com/y373kbve
declare module "stackdriver-errors-js" {

  interface ReportOptions {
    skipLocalFrames?: number
  }

  // - https://tinyurl.com/y373kbve
  export interface StackdriverErrorReportingInitConfig {
    key: string
    projectId: string
    service?: string
    version?: string
    reportUncaughtExceptions?: boolean
    reportUnhandledPromiseRejections?: boolean
  }

  var StackdriverErrorReporter: any
  const start: (config: StackdriverErrorReportingInitConfig) => void
  const report: (err: Error, options: ReportOptions) => Promise

  export {
    start,
    report,
  }
}
