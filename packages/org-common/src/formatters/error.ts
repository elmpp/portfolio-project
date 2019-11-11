import _ from 'lodash'
import {AxiosResponse} from 'axios'

const formatter: Formatter = (dumpable: AxiosResponse, _logLevel: LogLevel) => {
  const vals = _.pick(dumpable, ['config', 'message', 'code'])
  return vals
}

export {formatter as errorFormatter}
