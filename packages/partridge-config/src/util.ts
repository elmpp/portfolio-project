import {Config} from './__types__/config'
import _ from 'lodash'

export const parameterise = (config: Config): Config => {
  const {frontend, ...otherConfig} = config
  const port = config.frontend.FRONTEND_HOST_WWW_PORT
  const portReplace = port === '80' || port === '443' ? '' : `:${port}`

  return {
    ...otherConfig,
    frontend: _.mapValues(config.frontend, (aConfigValue: string) => aConfigValue.replace(/\${port}/, portReplace)),
  }
}

/**
 * Returns a config object but with any values present in process.env mentioned in the subMap
 * (i.e. custom-environment-variables.ts) will override.
 *  - lodash _.mergeWith - https://tinyurl.com/y2zzxunu
 */
export const merge = (builtConfig: Config, subMap: DeepPartial<Config>, processEnv: any) =>
  _.mergeWith(builtConfig, subMap, (objValue: any, srcValue: any) => {
    // when a whole category isn't in config but is in envSubMap
    if (typeof srcValue === 'object' && objValue === undefined) {
      return {}
    }
    if (typeof srcValue === 'string') {
      return typeof processEnv[srcValue] !== 'undefined' ? processEnv[srcValue] : objValue
    }
  })
