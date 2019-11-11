import _ from 'lodash'
import {merge} from '../dist/util'

export {FeedSupplierName} from '../dist/__types__/config'

/**
 * Suitable for bundling with mobile or node target
 * 
 * During the build step, the config will be inlined into this module at the points below.
 * The process.env will be merged into the config at runtime
 */

// -- to be substituted by DefinePlugin or equivalent..
const builtConfigString = __BUILT_CONFIG
const builtEnvSubstitutionMap = __BUILT_CONFIG_ENV_SUBSTITUTION_MAP

export const config = merge(builtConfigString, builtEnvSubstitutionMap, process.env)

// console.log('config :', config);
