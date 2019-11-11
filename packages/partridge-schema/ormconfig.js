// typeorm config - https://goo.gl/fyXLQF
const {connectionConfig} = require('partridge-models')

module.exports = connectionConfig

// ConnectionOptions - docs: https://goo.gl/UxTBAw / ts: https://goo.gl/MPLmFf / https://goo.gl/1NV1EB
// module.exports = {
//   type: 'postgres',
//   host: config.database.DATABASE_HOST,
//   port: config.database.DATABASE_PORT,
//   username: config.database.DATABASE_USERNAME,
//   password: config.database.DATABASE_PASSWORD,
//   database: config.database.DATABASE_NAME,
//   // schema: undefined, // Can be overridden but undefined so migrations agnostic. Should always be public anyway! - https://goo.gl/d6zcwZ
//   synchronize: false,
//   logging: false,
//   migrationsTableName: '_typeorm_migrations',
//   entities: ['../partridge-models/src/**/*.ts'],
//   migrations: ['src/migration/**/*.ts'],
//   subscribers: ['../partridge-models/src/subscribers/**/*.ts'],
//   cli: {
//     entitiesDir: '../partridge-models/src',
//     migrationsDir: 'src/migration',
//     subscribersDir: '../partridge-models/src/subscribers',
//   },
// }
