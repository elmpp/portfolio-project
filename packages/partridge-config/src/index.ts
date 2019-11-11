import {Config} from './__types__/config'
import * as ENV_CONSTANTS from './env-constants'
import * as util from './util'

export * from './__types__/config' // https://goo.gl/EMCCqH

let config: Config // eslint-disable-line import/no-mutable-exports

process.env.NODE_CONFIG_STRICT_MODE = 'true'

// allow an opportunity for amendment of returned values
config = util.parameterise(require('config'))

export {config, ENV_CONSTANTS, util}
