/**
 * Build plugins specifically for partridge-api. Kept here as we can transpile from
 * typescript easily
 *
 *  - ignorePlugin - https://tinyurl.com/y3pr58z3
 *  - pg-native error when bundling with webpack - https://tinyurl.com/y6xoxhy9
 */

import {IgnorePlugin} from 'webpack'
import {Plugin} from './__types__'

export const ignorePgNative: Plugin = (config, _options, _webpackObject, _pluginArgs) => {
  config.plugins.push(new IgnorePlugin(/^pg-native$/))
  return config
}
