// config for "environmental" tests - @see 'jest-testing.md'

const { jsWithBabel: tsjPreset } = require('ts-jest/presets');

const config = {
  // https://goo.gl/B6cuNZ
  moduleFileExtensions: ['js', 'jsx', 'json', 'ts', 'tsx'],
  transform: {
    "^.+\\.graphql$": "jest-transform-graphql", // https://goo.gl/XtkkUq
    ...tsjPreset.transform, // https://goo.gl/FZKR9z
  },
  testMatch: [ "**/__tests__/**/*.environmental.spec.ts?(x)" ],
  testEnvironment: 'jsdom',

  setupFilesAfterEnv: ["<rootDir>jest.setup.js"],
}

module.exports = config
