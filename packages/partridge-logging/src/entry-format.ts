/**
 * Winston mechanism to allow formatting of log entries
 */

import {format} from 'winston'
import {TransformableInfo} from 'logform'
import {LEVEL, MESSAGE} from 'triple-beam'
import util from 'util'
import {LogOptions} from './__types__'
import chalk, {Level} from 'chalk'

const {timestamp, printf} = format

const runtimeLabel = (label: LogOptions['runtime_label']) => {
  switch (label) {
    case 'APOLLO':
      return chalk.green(`[${label}]`)
    case 'AXIOS':
      return chalk.yellow(`[${label}]`)
    case 'BOOTSTRAP':
      return chalk.blue(`[${label}]`)
    case 'EXPRESS':
      return chalk.magenta(`[${label}]`)
    case 'FRONTEND':
      return chalk.cyan(`[${label}]`)
    case 'IMPORTER':
      return chalk.red(`[${label}]`)
    case 'TYPEORM':
      return chalk.blueBright(`[${label}]`)
    case 'GRAPHQL':
      return chalk.redBright(`[${label}]`)
  }
  return `[${label}]`
}

export const formatEntryWithDumpables = format.combine(
  // label({
  //   message: false,
  // }),
  timestamp(),
  format((info: TransformableInfo) => {
    // http://tinyurl.com/y5qwqb9s / inspired by https://tinyurl.com/yylgtvzl
    if (info instanceof Error) {
      const newinfo = Object.assign({}, info, {
        level: info[LEVEL] || info.level,
        message: info[MESSAGE] || info.message,
      }) // tslint:disable-line

      newinfo.stack = info.stack
      newinfo.error = info // keep around for the client-error-reporting.ts
      return newinfo
    }

    if (!((info as any).message instanceof Error)) return info

    // Assign all enumerable properties and the
    // message property from the error provided.
    Object.assign(info, info.message)

    const err = (info.message as unknown) as Error
    if (typeof err.message !== 'undefined') {
      info.message = err.message
    }

    // Assign the stack if requested.
    if (typeof err.stack !== 'undefined') {
      info.stack = err.stack
    }

    return info
  })(), // https://tinyurl.com/y2b4wf72
  printf((info: TransformableInfo) => {
    let formatted = `${info.timestamp} ${info.runtime_label ? runtimeLabel(info.runtime_label) : ''} ${info.level}: ${
      info.message
    }`

    if (info.stack) {
      formatted += `\n${info.stack}`
    }
    if (info.dumpables && Object.values(info.dumpables).length) {
      formatted += `\n dumpables: ${util.inspect(info.dumpables || {}, {showHidden: false, depth: null})}`
    }
    return formatted
  })
)
