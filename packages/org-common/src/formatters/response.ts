import {AxiosResponse} from 'axios'
import _ from 'lodash'

const formatter: Formatter = (dumpable: AxiosResponse, _logLevel: LogLevel) => {
  const vals = _.pick(dumpable, ['status', 'headers'])
  return vals
}

export {formatter as responseFormatter}
