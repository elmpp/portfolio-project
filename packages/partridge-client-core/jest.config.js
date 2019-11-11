const base = require('../../jest.config.base.js')
const pack = require('./package')

module.exports = {
  ...base,
  displayName: pack.name,
  name: pack.name,
  rootDir: './',

  preset: 'react-native-web', // RNW with jest - https://tinyurl.com/yxuqyhm9
}
