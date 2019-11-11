/**
 * Must be a babel.config.js file here - @see here - https://tinyurl.com/y2bblm7v
 * babel.config.js format - https://tinyurl.com/yypzemu3
 */
module.exports = {
  plugins: [
    // ['react-native-web', {commonjs: true}], // this is only required for metro-bundling - https://tinyurl.com/y53uaxoh
    'lodash',
    [
      // shimmy in react-native-web (should be first) - https://tinyurl.com/y4qc3hud
      'module-resolver',
      {
        root: ['./'],
        alias: {
          '^react-native$': 'react-native-web',
        },
      },
    ],
    'import-graphql',
    'dynamic-import-node',
  ],
  // presets - https://goo.gl/aqbWJY
  presets: [
    'next/babel', 
    '@zeit/next-typescript/babel', 
    '@babel/preset-flow', // react-native-paper is flow typed - https://tinyurl.com/y3g2ms7b
  ],
  // ignore: ['src/modules/header', 'src/modules/ui'],
  // exclude: ['react-native-web'],
  // exclude: ['node_modules'],
  // include: ['partridge-client-components'],
}
