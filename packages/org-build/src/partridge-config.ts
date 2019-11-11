/**
 * Plugin for bundling partridge-config effectively
 *
 *  - ignorePlugin - https://tinyurl.com/y3pr58z3
 *  - pg-native error when bundling with webpack - https://tinyurl.com/y6xoxhy9
 *  - DefinePlugin - https://tinyurl.com/mkmksd2
 */

import {Plugin, OrgBuildConfiguration} from './__types__'
import fs from 'fs'
import {isDev, isServer} from './plugins'
import copy from 'copy'
import {addDefinePluginDefinitions} from './webpack-util'

const configDefinitionDirSource = fs.realpathSync('../partridge-config/dist/config')

/**
 * Partridge-config uses `node-config` library which resolves configuration at run time so need
 * to inline the config into the bundle at build time
 *
 *  - node-config library - https://tinyurl.com/y4z9dxol
 *  - copy library - https://tinyurl.com/y6tlynnz
 *  - webpack DefinePlugin -
 */
export const partridgeConfig: Plugin = (config: OrgBuildConfiguration, options, webpackObject, _pluginArgs) => {
  const defineMap = partridgeConfigGetMap()
  config = addDefinePluginDefinitions(config, options, webpackObject, defineMap)

  if (isServer(options) && !isDev(options)) {
    copy(`${configDefinitionDirSource}/*.js`, './build/config', (_err, _file) => {})
    copy('../partridge-config/dist/__types__/*.js', './build/__types__', (_err, _file) => {})
    process.env.NODE_CONFIG_DIR = './build/config'
  }

  return config
}

export const partridgeConfigGetMap = (serialised = true): Dictionary<string> => {
  process.env.NODE_CONFIG_DIR = '../partridge-config/dist/config'

  const {config: partridgeConfig} = require('partridge-config')
  const stringifiedPartridgeConfig = partridgeConfig
  const stringifiedPartridgeConfigEnvSubMap = require(`${configDefinitionDirSource}/custom-environment-variables`)

  return {
    __BUILT_CONFIG: serialised ? JSON.stringify(stringifiedPartridgeConfig) : stringifiedPartridgeConfig,
    __BUILT_CONFIG_ENV_SUBSTITUTION_MAP: serialised
      ? JSON.stringify(stringifiedPartridgeConfigEnvSubMap)
      : stringifiedPartridgeConfigEnvSubMap,
  }
}
