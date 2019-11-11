import {requestFormatter, responseFormatter, errorFormatter} from 'org-common/formatters'
import {Dumpable, DumpableKey} from './__types__'
import {AxiosRequestConfig, AxiosResponse, AxiosError} from 'axios'

function isAxiosRequest(dumpableKey: DumpableKey, _dumpable: Dumpable): _dumpable is AxiosRequestConfig {
  return dumpableKey === 'axiosRequest'
}
function isAxiosResponse(dumpableKey: DumpableKey, _dumpable: Dumpable): _dumpable is AxiosResponse {
  return dumpableKey === 'axiosResponse'
}
function isAxiosError(dumpableKey: DumpableKey, _dumpable: Dumpable): _dumpable is AxiosError {
  return dumpableKey === 'axiosError'
}

const format = (dumpableKey: DumpableKey, dumpable: Dumpable, logLevel: LogLevel): any => {
  if (isAxiosRequest(dumpableKey, dumpable)) {
    return requestFormatter(dumpable, logLevel)
  }
  if (isAxiosResponse(dumpableKey, dumpable)) {
    return responseFormatter(dumpable, logLevel)
  }
  if (isAxiosError(dumpableKey, dumpable)) {
    return errorFormatter(dumpable, logLevel)
  }

  if (typeof dumpable.asFormat === 'function') {
    return dumpable.asFormat(logLevel)
  }

  return dumpable
}

export default format
