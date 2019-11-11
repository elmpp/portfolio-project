import {config} from 'partridge-config'
jest.doMock('next/config', () => () => ({publicRuntimeConfig: config.frontend}))

import initMockApollo from '../init-mock-apollo'
import RESPONSIVE_QUERY_MEDIA_TYPE from '../../../modules/apollo-responsive/__graphql__/responsive-query-media-type.graphql'
import EVENT_QUERY from '../../__graphql__/Event.graphql'
import {DUCK_NAMES} from '../../../modules/ducks'
import {ResponsiveQueryMediaType} from '../../../modules/__types__/graphql/ResponsiveQueryMediaType'

describe('init-mock-apollo', () => {
  const client = initMockApollo()

  it('should return mocked data for a client query', async () => {
    // manual client.query - https://goo.gl/UkhXdU
    const res = await client.query<ResponsiveQueryMediaType>({
      query: RESPONSIVE_QUERY_MEDIA_TYPE,
    })

    expect(typeof res.data[DUCK_NAMES.Responsive].mediaType).toEqual('string')
  })

  // reinstate once am generating types for the server queries
  it.skip('should return mocked data for a remote query', async () => {
    const res = await client.query({
      query: EVENT_QUERY,
    })

    // expect(typeof res.data.event[0].name).toEqual('string')
  })
})
