export enum FeedSupplierName {
  coral = 'coral',
  sky = 'sky',
  boylesports = 'boylesports',
  test1 = 'test1',
  test2 = 'test2',
  test3 = 'test3',
  test4 = 'test4',
  test5 = 'test5',
  test6 = 'test6',
  test7 = 'test7',
  test8 = 'test8',
  test9 = 'test9',
  test10 = 'test10',
}

export interface HtAccessAuth {
  type: 'htAccess'
  username: string
  password: string
}
export interface Feed {
  authSchema?: HtAccessAuth
  name: FeedSupplierName
  url: string // util.format
  format?: 'xml' | 'json' // defaults to standard axios formats (json, etc) - https://goo.gl/BDdjiW -> responseType)
  headers?: Dictionary<string>
}
export interface Environment {
  GCP_PROJECT_ID?: string
  GCP_SERVICEACCOUNT_LOGGING?: string // account on console - https://tinyurl.com/y5qeuxc2
  GCP_API_KEY_LOGGING?: string // key - https://tinyurl.com/y5dvwx35
  IS_E2E_TEST?: boolean // set based on process
  APP_ENV?: 'local' | 'local_e2e' | 'ci' | 'ci_e2e' | 'prod' // defaultable to prod
  APP_NAME?: string
  APP_VERSION?: string
}
export interface Frontend {
  FRONTEND_API_HOST_SERVER: string
  FRONTEND_API_HOST_BROWSER: string
  FRONTEND_HOST_WWW: string
  FRONTEND_HOST_WWW_MOBILE: string
  FRONTEND_HOST_WWW_PORT: string
  FRONTEND_HOST_ASSETS: string
  FRONTEND_HOST_STATIC: string
  OVERRIDABLE_TEST_KEY: string
}
export interface Database {
  DATABASE_SCHEMA: string
  DATABASE_HOST: string
  DATABASE_PORT: string
  DATABASE_NAME: string
  DATABASE_USERNAME: string
  DATABASE_PASSWORD: string
}

export interface Logging {
  LOGGING_STACKDRIVER_ENABLE: boolean
  LOGGING_CONSOLE_ENABLE: boolean
  LOGGING_LEVEL: LogLevel // https://goo.gl/MLZ3nQ
}

// https://tinyurl.com/y2ox4auj
// tslint:disable-next-line
export type Config = {
  feeds: Partial<{[s in FeedSupplierName]: Feed}>
  logging: Logging
  frontend: Frontend
  environment: Environment
  database: Database
}
// export interface Config extends ConfigDefinition {
//   // util: any // https://goo.gl/kss4j2
//   // get: (index: string) => any
// }

// const config: Config

// export {
//   config
// }
