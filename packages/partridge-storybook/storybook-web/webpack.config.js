/**
 *  - custom webpack - https://tinyurl.com/y6nnmayg
 *  - storybook build config docs - https://tinyurl.com/y5tbqogm
 */
const {
  // plugins
  partridgeConfig,
  partridgeLogging,
  transpileJavascriptModules,
  transpileTypescriptModules,
  lodash,
  reactNativeWeb,
  styledComponents,
  graphqlTypes,
  definePluginVars,
  webpackDashboard,
  reactNativeVectorIcons,
  mainFieldsAndExtensionsForClientApp,
  removeLoader,
  webpackAnalyzer,
  runAllPlugins,
  debugConfig,
  // util
  getDevPackagesPaths,
} = require('org-build')
const fs = require('fs')
const path = require('path')
const WebpackConfigHelpers = require('razzle-dev-utils/WebpackConfigHelpers')
const Helpers = new WebpackConfigHelpers(process.cwd())

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
// for storybook, we'll just use the ts-loader (with its babel use) for all transpirable modules
const includableModules = includableDevModules.concat(includableNodeModules)

/**
 * The storybook webpack config is a little different to Razzle apps
 */
const normaliseConfig = (config, _options, _webpackObject) => {
  // firstly, need to swap the resolved babel-loader location to ours

  const babelLoaderLocation = path.resolve(
    __dirname,
    '../../../node_modules/react-scripts/node_modules/babel-loader/lib/index.js'
  ) // this is the nested one we must replace
  const loaderWrappers = Helpers.getLoadersByName(config, babelLoaderLocation)

  if (!loaderWrappers.length) {
    throw Error(
      `This component assumes that you are using 'babel-loader' in normaliseConfig. If you are not using it, then you might need to check and test code for how would it work with other loaders`
    )
  }

  const babelLoaderRuleIndex = loaderWrappers[0].ruleIndex

  config.module.rules[babelLoaderRuleIndex].loader = require.resolve('babel-loader') // should resolve to what our org-build helpers will
  config.resolve.extensions = config.resolve.extensions || []

  return config
}

const removeEslint = (config, options, webpackObject) => {
  return removeLoader(config, options, webpackObject, 'eslint-loader')
}

/**
 * Removes the standard babel-loader rule
 * Use after ts-loader have been added (with the babel-loader subsumed)
 */
const removeBabelLoader = (config, options, webpackObject) => {
  // config = removeLoader(config, options, webpackObject, 'babel-loader')
  config.module.rules.splice(0, 1)
  return config
}

/**
 * Storybook seems to package its own react causing errors with hooks etc
 *  - GH comment - https://tinyurl.com/y5usqwgs
 */
const aliasReactPackages = (config, options, webpackObject) => {
  config.resolve.alias = {
    ...(config.resolve.alias || {}),
    react: path.resolve(__dirname, '../../../node_modules', 'react'),
    'react-dom': path.resolve(__dirname, '../../../node_modules', 'react-dom'),
  }
  return config
}

/**
 *
 * @param config object
 * @param mode DEVELOPMENT|PRODUCTION
 * -  docs - https://tinyurl.com/y3bzklj9
 */
const createConfig = ({config, mode}) => {
  // config.module.rules.push({
  //   test: /\.tsx?$/,
  //   use: [
  //     {
  //       loader: require.resolve('babel-loader'),
  //       options: {
  //         presets: [require.resolve('babel-preset-react-app')],
  //       },
  //     },
  //     require.resolve('react-docgen-typescript-loader'),
  //   ],
  // })

  // config.resolve.extensions.push('.ts', '.tsx')

  plugins = [
    // normaliseConfig, // must be first!
    // removeEslint,
    {
      name: 'typescript', // typescript plugin setup - https://tinyurl.com/yxq9lsra
      options: {
        useBabel: true, // run's babel as well as ts-loader for tsx/jsx files - https://tinyurl.com/yxozjytu
        test: /\.(tsx?|jsx?)$/, // will run the nodeModuleModules through this as well
        forkTsChecker: {
          // options - // https://tinyurl.com/yxbz77yp
          tslint: undefined,
        },
      },
    },
    partridgeConfig,
    partridgeLogging,
    // compiles as typescript dev modules
    {
      func: transpileTypescriptModules,
      // options: includableDevModules,
      options: includableModules.concat(path.resolve(__dirname, './')), // include .storybook
    },
    // ensure the BUILD_TARGET aligns with our target definition
    definePluginVars,
    lodash,
    reactNativeWeb,
    styledComponents,
    aliasReactPackages,
    {
      func: graphqlTypes,
      options: includableDevModules,
    },
    reactNativeVectorIcons,
    removeBabelLoader,
    mainFieldsAndExtensionsForClientApp, // last

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
  ]

  config = runAllPlugins(
    config,
    plugins,
    {
      target: 'web',
      dev: mode === 'DEVELOPMENT',
    },
    undefined
  )

  const util = require('util')
  console.log('config.module.rules', util.inspect(config.module.rules, {showHidden: false, depth: null, colors: true}))
  console.log('config.resolve', util.inspect(config.resolve, {showHidden: false, depth: null, colors: true}))

  return config
}

module.exports = createConfig
