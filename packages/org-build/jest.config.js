const base = require('../../jest.config.base.js')
const pack = require('./package')

module.exports = {
  ...base,
  displayName: pack.name,
  name: pack.name,
  rootDir: './',
  testPathIgnorePatterns: base.testPathIgnorePatterns.concat(['<rootDir>/src/config/test.*', '<rootDir>/lib']),
}
