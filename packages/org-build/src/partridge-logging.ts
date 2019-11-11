/**
 * Plugin for bundling partridge-config effectively
 *
 *  - ignorePlugin - https://tinyurl.com/y3pr58z3
 *  - pg-native error when bundling with webpack - https://tinyurl.com/y6xoxhy9
 *  - DefinePlugin - https://tinyurl.com/mkmksd2
 */

import {Plugin, OrgBuildConfiguration} from './__types__'
import {isServer, blacklistModules} from './plugins'

/**
 * @google-cloud/winston-logging pulls in all manner of stuff if left alone (node-gyp etc etc)
 * Partridge-logging should take care of most of this through our use of mainFields but
 * we still need to ensure things don't appear in the (server) bundle
 */
export const partridgeLogging: Plugin = (config: OrgBuildConfiguration, options, webpackObject, _pluginArgs) => {
  if (isServer(options)) {
    config = blacklistModules(config, options, webpackObject, [new RegExp('@google-cloud/logging-winston')]) // do !not! want this bundled
  }

  return config
}
