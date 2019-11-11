import {AxiosRequestConfig} from 'axios'
import format from '../request'
import _ from 'lodash'

describe('axios-request', () => {
  it('formats an instance of AxiosRequestConfig', () => {
    const dumpable: AxiosRequestConfig = {
      url: 'http://bbc.com',
      headers: {
        'x-feed-supplier': 'coral',
        Accept: 'application/json',
      },
      maxContentLength: 9999,
    }
    const expected = _.pick(dumpable, ['url', 'headers'])

    const formatted = format(dumpable, 'warn')

    expect(formatted).toEqual(expect.objectContaining(expected))
  })
})
