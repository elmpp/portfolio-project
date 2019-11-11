/**
 * Global teardown for jest-puppeteer - https://goo.gl/75yToS
 */

const {teardown: teardownServer} = require('jest-dev-server')
const {teardown: teardownPuppeteer} = require('jest-environment-puppeteer')
const kill = require('kill-port')

module.exports = async function globalTeardown(globalConfig) {
  // fuck knows what these 2 do
  await teardownServer()
  await teardownPuppeteer(globalConfig)

  // had to get heavy as above wasn't working - https://goo.gl/5mCfjL
  kill(3012)
    .then((message) => {console.log`Server on port 3012 killed innit. ${message}`})
    .catch((message) => {console.log`Server on port 3012 could not be killed for some reason. ${message}`})
}
