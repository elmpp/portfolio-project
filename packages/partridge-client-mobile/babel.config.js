const {partridgeConfigGetMap} = require('org-build')

module.exports = function(api) {
  api.cache(true)

  const plugins = [
    [
      'transform-define',
      {
        ['process.env.BUILD_TARGET']: 'mobile', // we use BUILD_TARGET globally for platform switching
        ...partridgeConfigGetMap(false),
      },
    ], // babel-based DefinePlugin - https://tinyurl.com/y2pqzr6t
    'lodash', // lodash - https://tinyurl.com/y3m55xuo
    // 'require-all', // allows buildtime assets reference (search 'requireAll') - https://tinyurl.com/y5xkpcep / https://tinyurl.com/y6zhnttb
    'import-directory', // allows buildtime assets reference - https://tinyurl.com/yyxf34ex
    // 'import-graphql', // note graphql loading is configured in `metro.config.js`
  ]

  const ret = {
    presets: ['babel-preset-expo'],
    plugins: [...plugins],
    env: {
      production: {
        plugins: [
          ...plugins,
          'react-native-paper/babel', // https://tinyurl.com/y6yhrwqc
        ],
      },
    },
  }

  // const util = require('util')
  // console.log('ret', util.inspect(ret, {showHidden: false, depth: null, colors: true}));

  return ret
}
