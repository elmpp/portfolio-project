/**
 * Standardises the plugin format - https://tinyurl.com/yxw9cf8d
 */
'use strict'

import {
  OrgBuildConfiguration,
  WebpackObject,
  PluginOptions,
  PluginsConfUnion,
  UserDefinedPluginWithFuncConf,
  WebpackConfiguration,
} from './__types__'
import webpack, {Plugin as WebpackPlugin} from 'webpack'

// TS typeeguard - https://tinyurl.com/y6mdwb9s
function isUserDefinedPluginWithFunc(pluginArg: PluginsConfUnion): pluginArg is UserDefinedPluginWithFuncConf {
  return (pluginArg as UserDefinedPluginWithFuncConf).func !== undefined
}

// allows passing in of proper webpack plugin instances
function isProperWebpackPlugin(pluginArg: PluginsConfUnion | WebpackPlugin): pluginArg is WebpackPlugin {
  return typeof (pluginArg as WebpackPlugin).apply === 'function'
}

function runPlugin(
  plugin: PluginsConfUnion | string | WebpackPlugin,
  config: OrgBuildConfiguration,
  options: PluginOptions,
  webpackObject: WebpackObject
): WebpackConfiguration {
  if (typeof plugin === 'string') {
    // Apply the plugin with default options if passing only a string
    return runPlugin({name: plugin}, config, options, webpackObject)
  }

  if (typeof plugin === 'function') {
    return plugin(config, options, webpack)
  }

  if (isProperWebpackPlugin(plugin)) {
    config.plugins.push(plugin)
    return config
  }

  if (isUserDefinedPluginWithFunc(plugin)) {
    // Used for writing plugin tests
    return plugin.func(config, options, webpackObject, plugin.options)
  }

  const completePluginName = `razzle-plugin-${plugin.name}`

  // Try to find the plugin in node_modules
  const razzlePlugin = require(completePluginName)
  if (!razzlePlugin) {
    throw new Error(`Unable to find '${completePluginName}`)
  }

  // console.log('running razzle plugin ', config)

  return razzlePlugin(config, options, webpackObject, plugin.options) as OrgBuildConfiguration
}

export const runAllPlugins = (
  config: OrgBuildConfiguration,
  plugins: PluginsConfUnion[],
  options: PluginOptions,
  webpackObject: WebpackObject
): WebpackConfiguration => {
  // Apply razzle plugins, if they are present in razzle.config.js
  plugins.forEach(plugin => {
    config = runPlugin(plugin, config, options, webpackObject)
  })
  return config
}

// export default runPlugin
