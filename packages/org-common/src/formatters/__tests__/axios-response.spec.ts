import {AxiosResponse} from 'axios'
import format from '../response'
import _ from 'lodash'

describe('axios-response', () => {
  it('formats an instance of AxiosResponseConfig', () => {
    const dumpable: Partial<AxiosResponse> = {
      status: 200,
      headers: {
        'x-feed-supplier': 'coral',
        Accept: 'application/json',
      },
      data: 'somedata',
      statusText: 'ignorable',
    }
    const expected = _.pick(dumpable, ['status', 'headers'])
    const expectedNot = _.pick(dumpable, ['data', 'statusText'])

    const formatted = format(dumpable, 'warn')

    expect(formatted).toEqual(expect.objectContaining(expected))
    expect(formatted).toEqual(expect.not.objectContaining(expectedNot))
  })
})
