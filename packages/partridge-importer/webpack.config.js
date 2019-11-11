// const startServerPlugin = require('org-build').startServerPlugin
const {
  startServerFunctionsFramework,
  ignorePgNative,
  partridgeLogging,
  partridgeConfig,
  whitelistModules,
  definePluginVars,
  debugConfig,
  setMainFields,
  transpileTypescriptModules,
  lodash,
  webpackDashboard,
  webpackAnalyzer,
} = require('org-build')
const {getDevPackagesPaths} = require('org-build/dist/util')
const fs = require('fs')

// the modules that should be transpiled (as TS) and included in bundle
const includableDevModules = getDevPackagesPaths()

const options = {
  // we need the build to emit at /index.js (+index.js.map) as functions-framework won't recognise anything else
  serverEntryPoint: require.resolve('./src/index.ts'),
  nodeBundle: 'index',
  buildDir: fs.realpathSync('.'),
  port: 3002,
  plugins: [
    {
      func: setMainFields,
      options: ['source', 'module', 'main'],
    },
    ignorePgNative,
    {
      func: startServerFunctionsFramework,
      options: {
        name: 'index.js',
      },
    },
    partridgeLogging,
    partridgeConfig,
    definePluginVars,
    {
      func: whitelistModules,
      options: {bundleableModules: includableDevModules, withHoisting: true},
    },
    lodash,
    {
      func: transpileTypescriptModules,
      options: includableDevModules,
    },
    // debug is last, obvs
    {
      func: debugConfig,
      options: 'node', // target to debug
    },
    // --- debugging bundle contents...
    webpackDashboard,
    webpackAnalyzer,
  ],
}

module.exports = options
