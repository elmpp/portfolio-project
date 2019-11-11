/**
 * Implementation of the nodejs stackdriver winston library.
 * Uses the Winston Google-Cloud (GWC) library to allow logging
 * directly to stackdriver with enhanced formatting etc (rather
 * than via /var/log).
 *
 *  - Setting up GWC library - https://tinyurl.com/y3ubqtly
 */

import {Options as CloudWinstonOptions} from '@google-cloud/logging-winston/build/src/types/core'
import {config} from 'partridge-config'
import {LoggingWinston} from '@google-cloud/logging-winston'

const cloudWinstonOptions: CloudWinstonOptions & {handleExceptions?: boolean} = {
  // Cloud Winston NodeJS logging transport configuration - http://tinyurl.com/y2g2xfdp
  projectId: config.environment.GCP_PROJECT_ID,
  keyFilename: config.environment.GCP_SERVICEACCOUNT_LOGGING, // service account deets - http://tinyurl.com/y364vhft
  serviceContext: {
    service: config.environment.APP_NAME, // http://tinyurl.com/y58fxxtg
    version: `${config.environment.APP_ENV}-${config.environment.APP_VERSION}`,
  },
  logName: process.env.APP_NAME,
  handleExceptions: true,
}

export const stackdriverNodeWinstonTransport = new LoggingWinston(cloudWinstonOptions)
