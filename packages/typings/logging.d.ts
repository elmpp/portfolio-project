/// <reference types="axios" />

type Formatter = (_x: Dumpable, logLevel: LogLevel) => object

interface Formattable extends Dictionary<any> {
  asFormat: (logLevel: LogLevel) => any
}

type Dumpable = AxiosRequestConfig | AxiosResponse | AxiosError | Formattable

// https://goo.gl/MLZ3nQ
type LogLevel = 'error' | 'warn' | 'info' | 'verbose' | 'debug' | 'silly'