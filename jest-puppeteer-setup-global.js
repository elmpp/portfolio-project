/**
 * Bootstraps the puppeteer start up. 
 *  - invoked via "globalSetup" in `jest.puppeteer.config.js` - https://goo.gl/75yToS
 *  - incorporates jest Dev Server - brings up server before all tests - https://goo.gl/WtUiZy
 */
const chalk = require('chalk')
const {setup: setupServer, ERROR_TIMEOUT, ERROR_NO_COMMAND} = require('jest-dev-server')

const {setup: setupPuppeteer} = require('jest-environment-puppeteer')
// const config = require('./jest-puppeteer.config')

module.exports = async function globalSetup(globalConfig) {
  await setupPuppeteer(globalConfig)

  if (globalConfig.server) {
    try {
      const {server: serverConfig} = globalConfig
      // n.b. that env vars should have been set when functional tests ran (see run-tests#functional)
      console.log(chalk.green(`\n☝️ Server Starting`))
      await setupServer(serverConfig)
      console.log(chalk.green(`\n☝️ Server Running`))
    } catch (error) {
      if (error.code === ERROR_TIMEOUT) {
        console.log('')
        console.error(chalk.red(error.message))
        console.error(chalk.blue(`\n☝️ You can set "server.launchTimeout" in jest-puppeteer.config.js`))
        process.exit(1)
      }
      if (error.code === ERROR_NO_COMMAND) {
        console.log('')
        console.error(chalk.red(error.message))
        console.error(chalk.blue(`\n☝️ You must set "server.command" in jest-puppeteer.config.js`))
        process.exit(1)
      }
      throw error
    }
  }
}

// /* eslint-disable no-console */
// import {
//   setup as setupServer,
//   teardown as teardownServer,
//   ERROR_TIMEOUT,
//   ERROR_NO_COMMAND,
// } from 'jest-dev-server'
// import puppeteer from 'puppeteer'
// import chalk from 'chalk'
// import readConfig from './readConfig'

// let browser

// export async function setup() {
//   const config = await readConfig()
//   if (config.connect) {
//     browser = await puppeteer.connect(config.connect)
//   } else {
//     browser = await puppeteer.launch(config.launch)
//   }
//   process.env.PUPPETEER_WS_ENDPOINT = browser.wsEndpoint()

//   if (config.server) {
//     try {
//       await setupServer(config.server)
//     } catch (error) {
//       if (error.code === ERROR_TIMEOUT) {
//         console.log('')
//         console.error(chalk.red(error.message))
//         console.error(
//           chalk.blue(
//             `\n☝️ You can set "server.launchTimeout" in jest-puppeteer.config.js`,
//           ),
//         )
//         process.exit(1)
//       }
//       if (error.code === ERROR_NO_COMMAND) {
//         console.log('')
//         console.error(chalk.red(error.message))
//         console.error(
//           chalk.blue(
//             `\n☝️ You must set "server.command" in jest-puppeteer.config.js`,
//           ),
//         )
//         process.exit(1)
//       }
//       throw error
//     }
//   }
// }

// export async function teardown() {
//   await teardownServer()
//   await browser.close()
// }
