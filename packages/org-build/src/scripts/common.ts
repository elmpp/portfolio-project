/**
 * Code common to ./build and ./start
 */

import {Options} from '../__types__'
import logger from 'razzle-dev-utils/logger'
import clearConsole from 'react-dev-utils/clearConsole'
import fs from 'fs-extra'

export const readOptions = (filePath: string, utilsLogger: typeof logger): Options => {
  let razzle: Options = {}

  // Check for webpack.config.js file...
  if (fs.existsSync(filePath)) {
    try {
      razzle = require(filePath)
      // console.log('razzle :', razzle);
    } catch (e) {
      clearConsole()
      utilsLogger.error('Invalid webpack.config.js file.', e)
      process.exit(1)
    }
  } else {
    logger.info('No webpack.config.js file found. Continuing with defaults...')
  }
  return razzle
}
