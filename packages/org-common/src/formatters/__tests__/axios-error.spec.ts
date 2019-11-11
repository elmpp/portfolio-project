import {AxiosError} from 'axios'
import format from '../error'
import _ from 'lodash'

describe('axios-error', () => {
  it('formats an instance of AxiosError', () => {
    const dumpable: Partial<AxiosError> = {
      config: {
        url: 'http://www.bbc.com/somewhere/else',
        headers: {
          'x-feed-supplier': 'coral',
          Accept: 'application/json',
        },
        baseURL: 'http://www.bbc.com',
      },
      message: 'big error numbnuts',
      request: {},
      response: {} as AxiosError['response'],
      code: 'a_code',
    }
    const expected = _.pick(dumpable, ['config', 'message', 'code'])
    const expectedNot = _.pick(dumpable, ['request', 'response'])

    const formatted = format(dumpable, 'warn')

    expect(formatted).toEqual(expect.objectContaining(expected))
    expect(formatted).toEqual(expect.not.objectContaining(expectedNot))
  })
})
