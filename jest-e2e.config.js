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
    // "^.+\\.tsx?$": "ts-jest",
    // "^.+\\.(js|jsx|ts|tsx)$": "babel-jest",
  },
  preset: 'jest-puppeteer',

  // defines which tests are ran in E2E suite. Explicitly lists them
  // testMatch: ['**/partridge-client-frontend/app/express/__tests__/server.functional.spec.ts'],
  testMatch: ['**/partridge-client-frontend/**/express/__tests__/server.functional.spec.ts'],

  setupFilesAfterEnv: ["<rootDir>jest.setup.js"],
}

module.exports = config
