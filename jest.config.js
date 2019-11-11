const base = require('./jest.config.base.js')

module.exports = {
  ...base,
  // all packages requiring jest testing
  projects: [
    '<rootDir>/packages/partridge-logging/',
    '<rootDir>/packages/partridge-schema/',
    '<rootDir>/packages/partridge-models/',
    '<rootDir>/packages/partridge-config/',
    '<rootDir>/packages/partridge-client-frontend/',
    '<rootDir>/packages/partridge-importer/',
    '<rootDir>/packages/partridge-api/',
    '<rootDir>/packages/org-common/',
    '<rootDir>/packages/org-build/',
    '<rootDir>/packages/partridge-storybook/',
    '<rootDir>/packages/partridge-client-components/',
    '<rootDir>/packages/partridge-client-core/',
    // '<rootDir>/packages/containers/', // cloud-build/community tests break unit tests
  ],
  coverageDirectory: '<rootDir>/coverage/',
  setupFilesAfterEnv: ["<rootDir>jest.setup.js"],
}
