import axios, {AxiosRequestConfig, AxiosInstance, AxiosResponse, AxiosError} from 'axios'
import {Feed} from 'partridge-config'
import {logger, DumpableError, LogOptions} from 'partridge-logging'
import {Client} from './__types__'
import {xml2js} from 'xml-js'

export const getClient = (config: Feed): Client => {
  const axiosOptions: AxiosRequestConfig = {
    // options - https://goo.gl/kXwMwA
    baseURL: config.url,
    timeout: 8000,
    // timeout: 3000,
    headers: config.headers || {}, // should include our x-feed-supplier header for wiremock
  }

  switch (config.authSchema && config.authSchema.type) {
    case 'htAccess':
      axiosOptions.auth = {
        username: config.authSchema!.username,
        password: config.authSchema!.password,
      }
      break
    case undefined:
      break
    default:
      throw new DumpableError('Unknown auth schema', {authSchema: [config.authSchema]})
  }

  const client = addInterceptors(axios.create(axiosOptions), config)

  return client
}

/**
 * Need to ensure outside communication is logged
 *  - https://goo.gl/wy9668
 */
function addInterceptors(client: AxiosInstance, config: Feed): AxiosInstance {
  client.interceptors.request.use(
    (config: AxiosRequestConfig) => {
      logger.log('debug', 'Request', {runtime_label: 'AXIOS', dumpables: {axiosRequest: [config]}})
      return config
    },
    error => {
      return handleError(error, 'Request', {runtime_label: 'AXIOS', dumpables: {axiosError: [error]}})
    }
  )

  client.interceptors.response.use(
    (response: AxiosResponse) => {
      if (config.format === 'xml') {
        try {
          response.data = xml2js(response.data, {compact: false}) // must be non-compact to ensure array child elements. options - https://goo.gl/NFtDFr
        } catch (error) {
          return handleError(error, 'Unable to convert xml -> js', {
            runtime_label: 'AXIOS',
            dumpables: {error: [error], axiosResponse: [response]},
          })
        }
      }

      logger.log('debug', 'Response', {runtime_label: 'AXIOS', dumpables: {axiosResponse: [response]}})
      return response
    },
    error => {
      return handleError(error, 'Response', {runtime_label: 'AXIOS', dumpables: {axiosError: [error]}})
    }
  )

  return client
}

const handleError = (error: AxiosError, message: string, logOptions: LogOptions) => {
  const util = require('util')
  console.log('message', util.inspect(message, {showHidden: false, depth: undefined, colors: true}))

  logger.log('error', message, logOptions)

  // https://goo.gl/dujWJq
  if (error.response) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx
    // console.log(error.response.data)
    // console.log(error.response.status)
    // console.log(error.response.headers)
  } else if (error.request) {
    // The request was made but no response was received
    // `error.request` is an instance of XMLHttpRequest in the browser and an instance of
    // http.ClientRequest in node.js
    console.log(error.request)
  } else {
    // Something happened in setting up the request that triggered an Error
    console.log('Error', error.message)
  }

  return Promise.reject(new DumpableError(error.message, logOptions.dumpables!)) // same as rethrowing
}
