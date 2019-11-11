import {AxiosRequestConfig, AxiosResponse, AxiosError} from 'axios'
// import winston, { LogMethod } from 'winston'
import {Logger} from '../logger'

export interface Dumpables {
  axiosRequest?: AxiosRequestConfig[]
  axiosResponse?: AxiosResponse[]
  [index: string]: any[] | undefined
}
export type Dumpable = AxiosRequestConfig | AxiosResponse | AxiosError | Formattable
export type DumpableKey = 'axiosRequest' | 'axiosResponse' | 'axiosError' | string

// export type LoggingProvider = winston.Logger
export interface LoggingProvider {
  // log: LogMethod,
  log: Logger['log']
  end: () => void // to satisfy winston's possible delay (important for SSR) - http://tinyurl.com/yyo9v7p8
}

// Guide to logging levels - https://goo.gl/MLZ3nQ
// export type LogLevel = 'error' | 'warn' | 'info' | 'verbose' | 'debug' | 'silly'

export interface LogOptions {
  dumpables?: Dumpables
  runtime_label?: 'APOLLO' | 'BOOTSTRAP' | 'AXIOS' | 'IMPORTER' | 'EXPRESS' | 'FRONTEND' | 'TYPEORM' | 'GRAPHQL'
  labels?: object
  [index: string]: any
}
