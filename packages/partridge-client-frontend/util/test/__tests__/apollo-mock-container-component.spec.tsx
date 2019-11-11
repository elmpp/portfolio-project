/**
 * For use in testing our container components. Basically only responsible for setting up a context
 * conducive to allowing containers to run graphql and redux operations
 *
 *  -
 *  - @see TESTING.md:mocking:apollo
 */

import {config} from 'partridge-config'
jest.doMock('next/config', () => () => ({publicRuntimeConfig: config.frontend}))

import React from 'react'
import {useQuery} from 'react-apollo-hooks'
import apolloMockContainerComponent from '../apollo-mock-container-component'
import MEDIA_TYPE_QUERY from '../../../modules/apollo-responsive/__graphql__/responsive-query-media-type.graphql'
import {ReactWrapper} from 'enzyme'
import { Action } from '../renderer';

describe('apolloMockContainerComponent', () => {
  const QueryComponent = () => {
    const {data, loading} = useQuery(MEDIA_TYPE_QUERY)
    
    if (loading || !data) return null // tslint:disable-line
    return <div className="aClass">{data.responsive.mediaType}</div>
  }

  it('should allow queries to be ran', async () => {
    const props = {some: 'else'}
    const wrapper = (await apolloMockContainerComponent(QueryComponent, {
      renderMethod: Action.mount,
      props,
    })) as ReactWrapper

    expect(
      wrapper
        .find('.aClass')
        .at(0)
        .text()
    ).toEqual('Hello World') // default value for string in mocked apollo client
  })
})
