const {
  startServer,
  ignorePgNative,
  partridgeConfig,
  partridgeLogging,
  whitelistModules,
  setMainFields,
  transpileTypescriptModules,
  lodash,
  definePluginVars,
  debugConfig,
  webpackDashboard,
  webpackAnalyzer,
} = require('org-build')
const fs = require('fs')
const {getDevPackagesPaths} = require('org-build/dist/util')

// the modules that should be transpiled (as TS) and included in bundle
const includableDevModules = getDevPackagesPaths()

/**
 * @typedef Options
 */
const options = {
  serverEntryPoint: require.resolve('./src/index.ts'),
  nodeBundle: 'server',
  port: 3003,
  plugins: [
    {
      func: startServer,
      // options: {
      //   name: 'functions-framework',
      //   args: ['build/server.js'],
      // }
    },
    {
      func: setMainFields,
      options: ['source', 'module', 'main'],
    },
    ignorePgNative,
    lodash,
    partridgeConfig,
    partridgeLogging,
    definePluginVars,
    {
      func: whitelistModules,
      options: {bundleableModules: [...includableDevModules, 'partridge-logging/middleware'], withHoisting: true},
    },
    {
      func: transpileTypescriptModules,
      options: includableDevModules,
    },
    // debug is last, obvs
    // {
    //   func: debugConfig,
    //   options: 'node', // target to debug
    // },
    // --- debugging bundle contents...
    webpackDashboard,
    webpackAnalyzer,
  ],
}

module.exports = options
