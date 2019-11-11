import {createConnection as typeormCreateConnection, Connection, Logger, QueryRunner} from 'typeorm'
import {logger} from 'partridge-logging'
import {config} from 'partridge-config'
import path from 'path'
import {PostgresConnectionOptions} from 'typeorm/driver/postgres/PostgresConnectionOptions'

const monoRepoRoot = path.resolve(__dirname + '/../../../')

export * from './entities'

const createLogger = (): Logger => ({
  // https://goo.gl/Mnn1Tb
  /**
   * Logs query and parameters used in it.
   */
  logQuery: (query: string, parameters?: any[], _queryRunner?: QueryRunner) => {},
  // logQuery: (query: string, parameters?: any[], _queryRunner?: QueryRunner) => {
  //   logger.log('debug', query, {runtime_label: 'TYPEORM', dumpables: parameters ? {parameters: [parameters]} : {}})
  // },
  /**
   * Logs query that is failed.
   */
  logQueryError: (error: string, query: string, parameters?: any[], _queryRunner?: QueryRunner) => {
    logger.log('error', `Error when querying. Error: ${error}. Query: ${query}`, {
      runtime_label: 'TYPEORM',
      dumpables: parameters ? {parameters: [parameters]} : {},
    })
  },
  /**
   * Logs query that is slow.
   */
  logQuerySlow: (time: number, query: string, parameters?: any[], _queryRunner?: QueryRunner) => {
    logger.log('warn', `Slow Query: Time: ${time}. Query: ${query}`, {
      runtime_label: 'TYPEORM',
      dumpables: parameters ? {parameters: [parameters]} : {},
    })
  },
  /**
   * Logs events from the schema build process.
   */
  logSchemaBuild: (message: string, _queryRunner?: QueryRunner) => {
    logger.log('verbose', `Schema Build: ${message}`, {runtime_label: 'TYPEORM'})
  },
  /**
   * Logs events from the migrations run process.
   */
  logMigration: (message: string, _queryRunner?: QueryRunner) => {
    logger.log('verbose', `Migration: ${message}`, {runtime_label: 'TYPEORM'})
  },
  /**
   * Perform logging using given logger, or by default to the console.
   * Log has its own level and message.
   */
  log: (level: 'log' | 'info' | 'warn', message: any, _queryRunner?: QueryRunner) => {},
  // log: (level: 'log' | 'info' | 'warn', message: any, _queryRunner?: QueryRunner) => {
  //   logger.log(level === 'log' ? 'debug' : level, message, {runtime_label: 'TYPEORM'})
  // },
})

// ConnectionOptions - docs: https://goo.gl/UxTBAw / ts: https://goo.gl/MPLmFf / https://goo.gl/1NV1EB
export const connectionConfig: PostgresConnectionOptions = {
  // https://goo.gl/tY8jfu
  type: 'postgres',
  host: config.database.DATABASE_HOST,
  port: parseInt(config.database.DATABASE_PORT),
  username: config.database.DATABASE_USERNAME,
  password: config.database.DATABASE_PASSWORD,
  database: config.database.DATABASE_NAME,
  entities: [
    monoRepoRoot + '/packages/partridge-models/dist/entities/**/*.js', // https://goo.gl/34DyPg
  ],
  migrations: [monoRepoRoot + '/packages/partridge-schema/dist/migration/**/*.js'],
  subscribers: [monoRepoRoot + '/packages/partridge-models/dist/subscribers/**/*.js'],
  cli: {
    entitiesDir: '../partridge-models/dist/entities', // must be relative to invocation directory for cli
    migrationsDir: '../partridge-schema/src/migration',
    subscribersDir: '../partridge-models/dist/subscribers',
    // entitiesDir: monoRepoRoot + '/packages/partridge-models/dist/entities',
    // migrationsDir: monoRepoRoot + '/packages/partridge-schema/src/migration',
    // subscribersDir: monoRepoRoot + '/packages/partridge-models/dist/subscribers',
  },
  synchronize: false,
  migrationsTableName: '_typeorm_migrations',
  // logging: true,
  // logger: 'debug',
  logging: [
    'error',
    // 'warn',
    // 'schema',
    // 'query',
    // 'info',
    // 'log'
  ], // logging - https://goo.gl/Tn2nS4
  logger: createLogger(),
}

export const createConnection = async (config: Partial<PostgresConnectionOptions> = {}): Promise<Connection> => {
  return typeormCreateConnection({...connectionConfig, ...config})
}

let connection: Connection
export const getConnection = async (config: Partial<PostgresConnectionOptions> = {}): Promise<Connection> => {
  if (connection) return Promise.resolve(connection)
  return createConnection(config).then((newConnection: Connection) => {
    connection = newConnection
    return connection
  })
}
