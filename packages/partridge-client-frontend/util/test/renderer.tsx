/**
 * Abstracts the rendering of a component using either enzyme's shallow/render/mount
 *
 *  - enzyme shallow API - https://github.com/airbnb/enzyme/blob/master/docs/api/shallow.md#shallownode-options--shallowwrapper
 *  - enzymes differences between render/mount/shallow - https://gist.github.com/fokusferit/e4558d384e4e9cab95d04e5f35d4f913#mount
 *  - setup for mount() - https://github.com/airbnb/enzyme/blob/master/docs/guides/jsdom.md#using-enzyme-with-jsdom
 *
 *  @see TESTING.md
 */

// import Router from 'next/router'
// const mockedRouter = {push: () => {}}
// Router.router = mockedRouter as any

import React from 'react'
import {mount, shallow, render, ReactWrapper, ShallowWrapper, CommonWrapper, MountRendererProps, ShallowRendererProps} from 'enzyme'
// import {ApolloProvider} from 'react-apollo'
import {ApolloProvider} from 'react-apollo-hooks'
import {Client} from '../../__types__'


import MockNextContext from './nextjs-mock-context'
// import {MockNextJsContextProvider, MockNextJsContextConsumer, mockContext} from './nextjs-mock-context'
// import {withMockRouterContext} from './nextjs-mock-context-legacy'
// const MockRouter = withMockRouterContext();
// import MockNextContext from './nextjs-mock-context-legacy-broken'

/// <reference types="cheerio" />

// require('./setupTests')

export enum Action {
  mount,
  shallow,
  render,
}

export interface RendererOptions {
  client: Client
  action: Action
  props: any
  options: MountRendererProps | ShallowRendererProps | any
  // createOptions: ShallowOptions | MountOptions | RenderOptions | {}
  tickUpdate: boolean
}

export type RendererWrapper = ReactWrapper | ShallowWrapper | Cheerio

export default async (
  Component: React.ComponentType,
  {client, action, props = {}, options: createOptions = {}, tickUpdate = true}: RendererOptions
): Promise<RendererWrapper> => {
  let wrapper: RendererWrapper

  // const toRender = (
  //   <ApolloProvider client={client}>
  //     <MockRouter>
  //       <Component {...props} />
  //   </MockRouter>
  //     </ApolloProvider>
  // )
  const toRender = (
    <ApolloProvider client={client}>
      <MockNextContext>
        <Component {...props} />
    </MockNextContext>
      </ApolloProvider>
  )
  // const toRender = (
  //     <MockNextJsContextProvider value={mockContext}>
  //   <ApolloProvider client={client}>
  //     <MockNextJsContextConsumer>
  //       {(data: any) => {
  //         return <Component {...props} {...data} />
  //       }}
  //     </MockNextJsContextConsumer>
  //     </ApolloProvider>
  //   </MockNextJsContextProvider>
  // )

  switch (action) {
    case Action.mount:
      // in enzyme parlance, this will do a full mount in the [jsdom] dom with all children also rendered. Returns a mount wrapper
      wrapper = mount(toRender, createOptions)
      // wrapper.setContext({router: {cunt: true}})
      break
    case Action.shallow:
      // in enzyme parlance, this will do a just a top-level render, without children nor dom. Returns a shallowWrapper
      wrapper = shallow(toRender, createOptions)
      break
    case Action.render:
      // in enzyme parlance, this will render the static html without any wrapper - https://github.com/airbnb/enzyme/blob/master/docs/api/render.md
      wrapper = render(toRender, createOptions)
      break
    default:
      throw new Error(`action ${action} not supported`)
  }

  return new Promise(resolve => {
    if (tickUpdate) {
      return setImmediate(() => {
        ;(wrapper as ReactWrapper | ShallowWrapper).update()
        resolve(wrapper)
      })
    }
    return resolve(wrapper)
  })
}
