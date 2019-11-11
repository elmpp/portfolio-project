/**
 * this is a RN config file that seems to have parity with the metro config
 *  - metro config - https://tinyurl.com/y5bnzqjj
 *  - metro-lerna boilerplate project - https://tinyurl.com/yyata5w2
 */

const path = require('path')
const {createMetroConfiguration} = require('expo-yarn-workspaces')
const {sourceExts} = require('metro-config/src/defaults/defaults')
const fs = require('fs')
const _ = require('lodash')
const metroCacheKey = require('./metro-cache-key')
// const getDevPaths = require('get-dev-paths')
const blacklist = require('metro-config/src/defaults/blacklist')
const {getDevPackagesPaths} = require('org-build')

const projectRoot = path.resolve(__dirname)

// const modules = getDevPaths(projectRoot)
//   .map($ => fs.realpathSync($))
//   .concat(fs.realpathSync('../../node_modules'))

// modules in node_modules authored by us but required in bundle (with transpilation)
const includableDevModules = getDevPackagesPaths()
// modules in node_modules not authored by us but required in bundle (with transpilation)
const includableNodeModules = [] // react-native bundles everything already, obvs
const includableModules = includableDevModules.concat(includableNodeModules).reduce((acc, modulePath) => {
  acc[path.basename(modulePath)] = modulePath
  return acc
}, {})
const blacklistedModules = includableDevModules.map(module => new RegExp(`${module}/node_modules/react-native/.*`))

const stubbedExtraNodeModules = _.mapValues(
  {
    // https://tinyurl.com/yylbncmv
    ...require('node-libs-react-native'),
    http2: require.resolve('node-noop'),
    '@google-cloud/logging-winston': require.resolve('node-noop'),
    // "partridge-config": require.resolve('node-noop'),
  },
  value => {
    if (!value) {
      return require.resolve('node-noop')
    }
    return value
  }
)
stubbedExtraNodeModules.browser = false

const extraNodeModules = {
  ...stubbedExtraNodeModules,
  ...includableModules,
  'react-native': path.resolve(__dirname, '../../node_modules/react-native'),
}

// console.log('object :', includableModules);
// console.log('object :', includableDevModules);
// console.log('object :', extraNodeModules);

const defaultConfig = createMetroConfiguration(__dirname)

let config = _.merge(defaultConfig, {
  /**
   * Add "global" dependencies for our RN project here so that our local components can resolve their
   * dependencies correctly
   */
  resolver: {
    extraNodeModules,
    // resolverMainFields: ['partridge', 'react-native', 'browser', 'module', 'main'], // 'partridge' here for our partridge-config special field, here to point `partridge-client-components` to its src - https://tinyurl.com/yyteuyfv / https://tinyurl.com/y2mucqvu
    resolverMainFields: ['partridge', 'react-native', 'browser', 'main'], // 'partridge' here for our partridge-config special field, here to point `partridge-client-components` to its src - https://tinyurl.com/yyteuyfv / https://tinyurl.com/y2mucqvu
    sourceExts: [...sourceExts, 'graphql', 'gql'], // allow react-native-graphql-transformer (below) to work - https://tinyurl.com/y3duz4j2
    // assetExts: [...sourceExts, 'graphql', 'gql'], // allow react-native-graphql-transformer (below) to work - https://tinyurl.com/y3duz4j2
    blacklistRE: blacklist(blacklistedModules),
  },
  /**
   * Add our workspace roots so that react native can find the source code for the included packages
   * in the monorepo
   */
  projectRoot,
  // watchFolders: Array.from(new Set(includableDevModules)),
  watchFolders: [
    ...Array.from(new Set(includableDevModules)),
    path.resolve(__dirname, '../../node_modules'), // need a watchfolder for monorepo - https://tinyurl.com/y3khsmpz
  ],
  transformer: {
    ...defaultConfig.transformer,
    babelTransformerPath: require.resolve(
      // docs - https://tinyurl.com/y2bbccps
      '@bam.tech/react-native-graphql-transformer' // this graphql transformer works with RN (import-graphql doesn't) -
    ),
  },
  cacheVersion: metroCacheKey(),
})

// // if (process.env.NODE_ENV === 'development') {
//   config = {
//     ...config,
//     minifierPath: 'metro-minify-terser',
//     minifierConfig: {
//       // https://www.npmjs.com/package/terser#mangle-options
//       ecma: 8,
//       keep_classnames: true,
//       keep_fnames: true,
//       module: true,
//       mangle: {
//         module: true,
//         keep_classnames: true,
//         keep_fnames: true,
//       },
//     },
//   }

//   console.log('THIS IS SOMETHING :', 'eriugheiurghuierg');
// // }
// console.log('config :', config);

module.exports = config
