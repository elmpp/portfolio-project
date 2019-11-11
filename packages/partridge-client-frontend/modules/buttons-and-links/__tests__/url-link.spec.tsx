import React from 'react'
import {UrlLink, UrlPart} from '../url-link'
import {ReactWrapper, ShallowWrapper, mount} from 'enzyme'
import {SingletonRouter} from 'next/router'

describe('url-link', () => {
  let wrapper: ShallowWrapper | ReactWrapper
  const newHrefGood = 'http://www.bbc.com'

  it('Creates redirect with full href', () => {
    const routerMock = {asPath: 'https://www.guardian.co.uk/aPath?search=param#ahash'} as SingletonRouter
    const newParts = {[UrlPart.PATHNAME]: 'newpath'}
    wrapper = mount(
      <UrlLink router={routerMock} newHref={newHrefGood} newParts={newParts}>
        <a>linky</a>
      </UrlLink>
    )
    
    expect(wrapper.find('a').prop('href')).toEqual('http://www.bbc.com/newpath?search=param#ahash')
  })
  
  it('Creates redirect from router aspath', () => {
    const routerMock = {asPath: '/nextroutes/manchester-united/liverpool'} as SingletonRouter
    const newParts = {[UrlPart.PATHNAME]: 'newpath'}
    wrapper = mount(
      <UrlLink router={routerMock} newHref={newHrefGood} newParts={newParts}>
        <a>linky</a>
      </UrlLink>
    )
    
    expect(wrapper.find('a').prop('href')).toEqual('http://www.bbc.com/newpath')
  })
})
