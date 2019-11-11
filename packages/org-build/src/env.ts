'use strict'

import {paths} from './paths'
import fs from 'fs'
import path from 'path'
import {Target, Options} from './__types__'

// Make sure that including paths.js after env.js will read .env variables.
delete require.cache[require.resolve('./paths')]

const NODE_ENV = process.env.NODE_ENV
if (!NODE_ENV) {
  throw new Error('The NODE_ENV environment variable is required but was not specified.')
}

// We support resolving modules according to `NODE_PATH`.
// This lets you use absolute paths in imports inside large monorepos:
// https://github.com/facebookincubator/create-react-app/issues/253.
// It works similar to `NODE_PATH` in Node itself:
// https://nodejs.org/api/modules.html#modules_loading_from_the_global_folders
// Note that unlike in Node, only *relative* paths from `NODE_PATH` are honored.
// Otherwise, we risk importing Node.js core modules into an app instead of Webpack shims.
// https://github.com/facebookincubator/create-react-app/issues/1023#issuecomment-265344421
// We also resolve them to make sure all tools using them work consistently.
const appDirectory = fs.realpathSync(process.cwd())
const nodePath = (process.env.NODE_PATH || '')
  .split(path.delimiter)
  .filter(folder => folder && !path.isAbsolute(folder))
  .map(folder => path.resolve(appDirectory, folder))
  .join(path.delimiter)

// // Grab NODE_ENV and RAZZLE_* environment variables and prepare them to be
// // injected into the application via DefinePlugin in Webpack configuration.
// const RAZZLE = /^RAZZLE_/i;

function getClientEnvironment(target: Target, options: Options) {
  const raw = {
    // Useful for determining whether we’re running in production mode.
    // Most importantly, it switches React into the correct mode.
    NODE_ENV: process.env.NODE_ENV || 'development',
    PORT: process.env.PORT || 3000,
    VERBOSE: !!process.env.VERBOSE,
    HOST: process.env.HOST || options.host || 'localhost',
    RAZZLE_ASSETS_MANIFEST: paths.appManifest,
    BUILD_TARGET: target,
    // only for production builds. Useful if you need to serve from a CDN
    PUBLIC_PATH: process.env.PUBLIC_PATH || '/',
  }
  // Stringify all values so we can feed into Webpack DefinePlugin
  const stringified = Object.keys(raw).reduce(
    (env, key: keyof typeof raw) => {
      env[`process.env.${key}`] = JSON.stringify(raw[key])
      return env
    },
    {} as Dictionary<string>
  )

  return {raw, stringified}
}

module.exports = {
  getClientEnv: getClientEnvironment,
  nodePath,
}
