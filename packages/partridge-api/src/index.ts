/**
 * PostGraphile server set up in "library" mode (i.e. as a server)
 *
 *  options -
 *  library mode - https://tinyurl.com/y6xm4u56
 */

if (module.hot) {
  module.hot.accept()
}

require('./env-check')
import express from 'express'
import {postgraphile, PostGraphileOptions} from 'postgraphile'
import compression from 'compression'
import {request as loggingMiddleware, error as errorLoggingMiddleware} from 'partridge-logging/middleware'
import {PoolConfig} from 'pg'
import simplifyInflectorPlugin from '@graphile-contrib/pg-simplify-inflector'
import {enumOriginalCasingPlugin} from './enum-original-casing-plugin'
import {config} from 'partridge-config'
import path from 'path'

const app = express()

const poolConfig: PoolConfig = {
  user: config.database.DATABASE_USERNAME,
  database: config.database.DATABASE_NAME,
  password: config.database.DATABASE_PASSWORD,
  host: config.database.DATABASE_HOST,
  port: parseInt(config.database.DATABASE_PORT),
}

// postgraphile options - https://tinyurl.com/y2aw8gzj
const graphileOptions: PostGraphileOptions<express.Request, express.Response> = {
  ignoreRBAC: false,
  disableDefaultMutations: true,
  graphiql: config.environment.APP_ENV !== 'prod',
  enhanceGraphiql: true,
  pgDefaultRole: 'api_read_role',
  appendPlugins: [simplifyInflectorPlugin, enumOriginalCasingPlugin],
  disableQueryLog: config.environment.APP_ENV === 'prod',
  showErrorStack: config.environment.APP_ENV !== 'prod',
  simpleCollections: 'omit', // https://tinyurl.com/y3fxnug2
  // exportJsonSchemaPath: process.env.NODE_ENV === 'development' ? path.resolve(__dirname, '../../partridge-client-core/schema-dump-api.json') : undefined,
  exportGqlSchemaPath:
    process.env.NODE_ENV === 'development'
      ? path.resolve(__dirname, '../../partridge-client-core/schema-dump-api.graphql')
      : undefined,
}

// want to dump the

app.use(compression()) // https://tinyurl.com/n2u5fj4
app.use(loggingMiddleware)
// @todo - add "query whitelisting middleware" - https://tinyurl.com/y2g5vhp9
app.use(errorLoggingMiddleware)
app.use(
  postgraphile(
    // api - https://tinyurl.com/y2aw8gzj
    poolConfig,
    graphileOptions
  )
)

const apiPort = process.env.PORT || 3003 // https://tinyurl.com/y2lvpsr3
app.listen(apiPort, () => console.log(`Server started on ${apiPort}`))
