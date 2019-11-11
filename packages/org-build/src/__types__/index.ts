/**
 * Package types
 *
 *  - webpack typings - https://tinyurl.com/ybmka5gd
 */

import webpack, {
  Configuration as WebpackConfiguration,
  Plugin as WebpackPlugin,
  ExternalsFunctionElement,
  ExternalsElement,
} from 'webpack'
import {string} from 'prop-types'

/**
 * The standard webpack format is way too flexible - let's constrain it for our consumption
 */
type WebpackConfigurationWithSensibleAmendments = Omit<
  Omit<Omit<Omit<WebpackConfiguration, 'plugins'>, 'externals'>, 'resolve'>,
  'module'
> &
  RequiredProper<{
    plugins: WebpackConfiguration['plugins']
    resolve: WebpackConfiguration['resolve']
    module: WebpackConfiguration['module']
  }> & {
    externals?: (ExternalsFunctionElement | ExternalsElement)[]
  }
type OrgBuildConfiguration = WebpackConfigurationWithSensibleAmendments // keep concepts separate although equivalent
export {OrgBuildConfiguration, WebpackConfigurationWithSensibleAmendments as WebpackConfiguration}

export type Target = 'node' | 'web' // | 'mobile'

export type Env = 'production' | 'development'

export type WebpackObject = typeof webpack

export interface Options {
  nodeBundle?: string
  buildDir?: string
  // webBundle: string,
  host?: string
  port?: number
  plugins?: PluginsConfUnion[]
  serverEntryPoint?: string
}

// razzle plugins ----- https://tinyurl.com/yxkzndey
export interface UserDefinedPluginWithFuncConf {
  func: Plugin
  options: PluginArgs
}
export interface PackagedPluginByNameConf {
  // func?: undefined // define to allow discriminating - https://tinyurl.com/yd6yrrwl
  name: string
  options?: PluginArgs
}
export type PluginFunctionConf = (
  config: OrgBuildConfiguration,
  options: PluginOptions,
  webpackObject: WebpackObject
) => OrgBuildConfiguration

export type PluginsConfUnion = UserDefinedPluginWithFuncConf | PackagedPluginByNameConf | PluginFunctionConf

export interface PluginOptions {
  target: Target
  dev: boolean
  [key: string]: any
}

/**
 * Note it takes our hybrid OrgBuildConfiguration and returns a good old WebpackConfigurationWithSensibleAmendments
 */
export type Plugin = (
  config: OrgBuildConfiguration,
  options: PluginOptions,
  webpackObject: WebpackObject,
  pluginArgs?: PluginArgs
) => WebpackConfigurationWithSensibleAmendments

export type PluginArgs = any

export type ConfigWithAnyPlugins = OrgBuildConfiguration & {
  plugins: any
}
export type ConfigWithAnyLoaders = OrgBuildConfiguration & {
  module: any
}
export type LoaderIncludeExcludeEntry = string | RegExp
