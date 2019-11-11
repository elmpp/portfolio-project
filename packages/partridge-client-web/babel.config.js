console.log('partridge-client-web/babel.config.js loaded')

/**
 * Contains all the babel stuff to transpile both /src and the extra modules configured in
 * razzle.config.js
 */
module.exports = api => {
  api.cache(false)
  return {
    presets: [
      'razzle/babel',
      // 'react-native', // RNW - https://tinyurl.com/y3tmtld4
      '@babel/preset-flow', // react-native-paper is included from node_modules and has flow typing
    ], // this is default and good enough for /src
    plugins: [
      'lodash', // lodash - https://tinyurl.com/y3m55xuo
      'react-native-web',
      // 'import-graphql',
      'dynamic-import-node',
    ],
    env: {
      production: {
        plugins: [
          'lodash', // lodash - https://tinyurl.com/y3m55xuo
          'react-native-web', // webpack + RNW - https://tinyurl.com/yxuj7fku
          // 'import-graphql',
          'dynamic-import-node',
          'react-native-paper/babel', // https://tinyurl.com/y6yhrwqc
        ],
      },
    },
  }
}
