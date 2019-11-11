// inspired by - https://goo.gl/LovoZ2
const { defaults: tsjPreset } = require('ts-jest/presets');

module.exports = {
  // https://goo.gl/B6cuNZ
  moduleFileExtensions: ['js', 'jsx', 'json', 'ts', 'tsx', 'graphql'],
  transform: {
    "^.+\\.graphql$": "jest-transform-graphql", // https://goo.gl/XtkkUq
    ...tsjPreset.transform, // https://goo.gl/FZKR9z
  },
  testMatch: [ "**/__tests__/**/*.spec.ts?(x)", "**/__tests__/**/*.spec.js?(x)" ],

  testPathIgnorePatterns: [
    '\\.(orig.jsx?)$',
    '\\.(skip.jsx?)$',
    '\\.(orig.tsx?)$',
    '\\.(skip.tsx?)$',
  ],

  setupFilesAfterEnv: ["<rootDir>/../../jest.setup.js"],
  testEnvironment: 'jsdom',

  snapshotSerializers: ['enzyme-to-json/serializer'], // required for `wrapper.update()`::toJson - https://goo.gl/csMPyi
  verbose: true,
  // https://goo.gl/TESzMk
  globals: {
    ['ts-jest']: {
      tsConfig: './tsconfig.json', // ** jest should always use this root-level tsconfig.json!!
    },
  },
}
