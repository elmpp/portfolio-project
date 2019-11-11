import {AxiosRequestConfig} from 'axios'
import _ from 'lodash'

const formatter: Formatter = (dumpable: AxiosRequestConfig, _logLevel: LogLevel) => {
  const vals = _.pick(dumpable, ['url', 'headers'])
  return vals
}

export {formatter as requestFormatter}
