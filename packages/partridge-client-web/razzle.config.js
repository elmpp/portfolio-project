'use strict'

/**
 * Razzle webpack creation
 *  - createConfig script - https://tinyurl.com/yy6gazjj
 *  - razzle plugin docs - https://tinyurl.com/y4f8mqxe
 */

const fs = require('fs')
const path = require('path')
const {
  // plugins
  partridgeConfig,
  partridgeLogging,
  transpileJavascriptModules,
  transpileTypescriptModules,
  whitelistModules: doWhitelistModules,
  lodash,
  reactNativeWeb,
  graphqlTypes,
  definePluginVars,
  webpackDashboard,
  webpackAnalyzer,
  debugConfig,
  reactNativeVectorIcons,
  addLoaderExcludes,
  mainFieldsAndExtensionsForClientApp,
  // util
  getDevPackagesPaths,
  isServer,
  isClient,
  isDev,
} = require('org-build')

// modules in node_modules authored by us but required in bundle (with transpilation)
const includableDevModules = getDevPackagesPaths()
// modules in node_modules not authored by us but required in bundle (with transpilation)
const includableNodeModules = [
  fs.realpathSync('../../node_modules/react-native-vector-icons'),
  fs.realpathSync('../../node_modules/react-native-safe-area-view'),
  fs.realpathSync('../../node_modules/react-native-web'),
  fs.realpathSync('../../node_modules/react-native-paper'),
  // fs.realpathSync('./node_modules/partridge-client-components/node_modules/react-native-paper'),
]

// /**
//  * Allow some differing package content based on target.
//  * Also allow module files to resolve preferentially if e.g. .web.tsx extension
//  *  - mainFields - https://tinyurl.com/y42zbtl4
//  *  - module resolving with extensions - https://tinyurl.com/yxuj7fku
//  */
// const mainFieldsAndExtensions = (config, options, webpackObject) => {

//   if (isServer(options)) {
//     setMainFields(config, options, webpackObject, ['source', 'module', 'main'])
//   }
//   if (isClient(options)) {
//     setMainFields(config, options, webpackObject, ['browser', 'source', 'module', 'main'])
//     setTargetExtensions(config, options, webpackObject, ['.web'])
//   }

//   return config
// }

/**
 * this final section is because razzle has `externals` definition of 'node_modules'
 * meaning our extra transpilation wouldn't be bundled. Need to whitelist...
 */
const whitelistModules = (config, options, webpackObject) => {
  // the original razzle definition (need to include) - https://tinyurl.com/y6sr9kp6
  const whitelist = [
    isDev(options) ? 'webpack/hot/poll?300' : null,
    /\.(eot|woff|woff2|ttf|otf)$/,
    /\.(svg|png|jpg|jpeg|gif|ico)$/,
    /\.(mp4|mp3|ogg|swf|webp)$/,
    /\.(css|scss|sass|sss|less)$/,
    // dependent modules to bundle...
    ...includableDevModules,
    ...includableNodeModules,
  ].filter(x => x)

  if (isServer(options)) {
    config = doWhitelistModules(config, options, webpackObject, {bundleableModules: whitelist, withHoisting: false}) // leave withHoisting false else icons fail SSR
  }
  if (isClient(options)) {
    config.externals = []
  }

  return config
}

/**
 * Don't want to include node-lib dependent stuff in client bundle.
 * Note that because we have added 'node-libs-browser', the webpack 'NodeSourcePlugin'
 * should step in and polyfill most node libraries
 *  - NodeSourcePlugin-relevant docs - https://tinyurl.com/y4hzsrah
 *  - webpack plugin for node modules management - https://tinyurl.com/y4y9gopa
 *  - webpack config for node modules - https://tinyurl.com/yxakfpor
 *  - node-libs-browser repo - https://tinyurl.com/y2ll84yw
 */
const optimiseClientBundle = (config, _options, _webpackObject) => {
  if (isClient(config)) {
    config.node = {
      // see above about how other modules (e.g. util etc) should be polyfilled via node-libs-browser
      fs: 'empty',
      config: 'empty', // our node-config module is getting included but we can just blank it out for client build
      child_process: 'empty', // http://tinyurl.com/y6kxff3m
      console: false,
      'merge-graphql-schemas': 'empty',
      // __dirname: true,
      // __filename: false,
    }
  }

  return config
}

// writing razzle plugins - https://tinyurl.com/yxkzndey
module.exports = {
  plugins: [
    {
      name: 'typescript', // typescript plugin setup - https://tinyurl.com/yxq9lsra
      options: {
        useBabel: true, // run's babel as well as ts-loader for tsx/jsx files - https://tinyurl.com/yxozjytu
      },
    },
    partridgeConfig,
    partridgeLogging,
    {
      func: transpileJavascriptModules,
      options: includableNodeModules,
    },
    // compiles as typescript dev modules
    {
      func: transpileTypescriptModules,
      options: includableDevModules,
    },
    // ensure the BUILD_TARGET aligns with our target definition
    definePluginVars,
    // ensures compiled modules make the bundle
    whitelistModules, // note this is local function, not from plugins.ts
    lodash,
    reactNativeWeb,
    {
      func: graphqlTypes,
      options: includableDevModules,
    },
    reactNativeVectorIcons,
    optimiseClientBundle,
    mainFieldsAndExtensionsForClientApp, // last!
    // --- debugging bundle contents...
    {
      func: debugConfig,
      options: 'node',
    },
    // {
    //   func: debugConfig,
    //   options: 'web',
    // },
    webpackDashboard,
    webpackAnalyzer,
  ],
}
