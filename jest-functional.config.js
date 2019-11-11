// config for "functional" tests - i.e. ran against local server
// inspired by - https://goo.gl/LovoZ2
const { jsWithBabel: tsjPreset } = require('ts-jest/presets');

if (!process.env.APP_ENV) {
  throw Error('APP_ENV must be specified when running functional tests')
}

const config = {
  // https://goo.gl/B6cuNZ
  moduleFileExtensions: ['js', 'jsx', 'json', 'ts', 'tsx'],
  transform: {
    "^.+\\.graphql$": "jest-transform-graphql", // https://goo.gl/XtkkUq
    ...tsjPreset.transform, // https://goo.gl/FZKR9z
  },
  testMatch: [ "**/__tests__/**/*.functional.spec.ts?(x)" ],
  setupFilesAfterEnv: ["<rootDir>jest.setup.js"],
  // testEnvironment: 'jsdom', // do not set for puppeteer tests - http://tinyurl.com/y5ed25jf

  preset: 'jest-puppeteer',
  globalSetup: './jest-puppeteer-setup-global.js',
  globalTeardown: './jest-puppeteer-teardown-global.js',
}

module.exports = config
