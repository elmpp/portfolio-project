// http://bit.ly/2Hh0oDK (defers internally to css-mediaquery - http://bit.ly/2Hj6LXc)

window.matchMedia = jest.fn(() => require('matchmedia-polyfill'))

import * as apolloLink from 'apollo-link'
// import {HttpLink, ApolloClient} from 'apollo-boost'
import {ApolloClient} from 'apollo-client'
import {HttpLink} from 'apollo-link-http'
import {InMemoryCache} from 'apollo-cache-inmemory'
import fetch from 'isomorphic-fetch'
import createClientEnhancer from '../create-client-enhancer'
import * as handlers from '../handlers' // http://bit.ly/2JfjaO0
import * as calculateResponsiveModule from '../calculate-responsive'
import {MEDIA_SIZES, breakpoints as defaultBreakpoints} from '../media-type-constants'
import { Cache } from '../../../__types__';


// Polyfill fetch() on the server (used by apollo-client)
if (!process.browser) {
  global.fetch = fetch
}

let matchMediaSpy: Partial<Window['matchMedia']>
let clientCacheSpy: Cache
let mockCalculateResponsiveSpy: any
let clientLink
let client: any // n.b. to allow client.cache.config.xxx below

const defaultOptions = {defaultMediaType: undefined, breakpoints: defaultBreakpoints}
const dummyResponsiveState = {
  __typename: 'responsive',
  lessThan: [],
  greaterThan: [],
  is: [],
  mediaType: 'md',
  orientation: 'portrait',
}

function setup(customCacheSpy?: Cache) {
  mockCalculateResponsiveSpy = jest.fn(() => calculateResponsiveModule)
  jest.spyOn(calculateResponsiveModule, 'default').mockImplementation(() => mockCalculateResponsiveSpy)
  jest.spyOn(handlers, 'default')
  jest.mock('apollo-link', () => ({
    from: jest.fn()
  }))
  matchMediaSpy = (window as any).matchMedia = jest.fn(() => ({addListener: () => {}}))

  clientCacheSpy = customCacheSpy || new InMemoryCache()
  clientLink = apolloLink.ApolloLink.from([
    new HttpLink({
      uri: 'http://somewhere.com',
    }),
  ])
  client = new ApolloClient({
    link: clientLink,
    cache: clientCacheSpy,
  })
}

describe('create-client-enhancer', () => {
  afterEach(() => {
    jest.clearAllMocks()
    window.matchMedia = matchMediaSpy as Window['matchMedia']
  })

  describe('client setup', () => {
    describe('return value', () => {
      it('returns the things necessary to create a state-link and a client callback', () => {
        setup()
        const enhancerReturn = createClientEnhancer(defaultOptions)
        expect(enhancerReturn).toHaveProperty('resolvers')
        expect(enhancerReturn).toHaveProperty('defaults')
        expect(enhancerReturn).toHaveProperty('typeDefs')
        expect(enhancerReturn).toHaveProperty('cb')
      })
    })

    describe('defaults', () => {
      it('invokes a call to calculate-responsive with empty window.matchMedia when called with staticMediaType', () => {
        setup()
        createClientEnhancer({...defaultOptions, staticMediaType: MEDIA_SIZES.medium})

        expect(mockCalculateResponsiveSpy).toHaveBeenCalled()
        expect(mockCalculateResponsiveSpy.mock.calls[0][0]).toEqual({matchMedia: undefined})
      })

      it('invokes a call to calculate-responsive with using window', () => {
        setup()
        createClientEnhancer(defaultOptions)

        expect(mockCalculateResponsiveSpy).toHaveBeenCalled()
        expect(mockCalculateResponsiveSpy.mock.calls[0][0]).toEqual(window)
      })
    })

    describe('callback for client instance', () => {
      it('defines a new dataIdFromObject for the resolver types if client cache has none', () => {
        setup({writeData: () => {}, config: {}} as any as Cache)
        const {cb} = createClientEnhancer(defaultOptions)
        cb && cb(client) // tslint:disable-line

        expect(client.cache.config.dataIdFromObject(dummyResponsiveState)).toEqual('md')
        expect(client.cache.config.dataIdFromObject({__typename: 'something', id: 3})).toEqual('something:3')
      })

      it('augments and defers to existing client cache dataIdFromObject function', () => {
        setup({writeData: () => {}, config: {dataIdFromObject: () => 'whatever'}} as any as Cache)
        const {cb} = createClientEnhancer(defaultOptions)
        cb && cb(client) // tslint:disable-line

        expect(client.cache.config.dataIdFromObject(dummyResponsiveState)).toEqual('md')
        expect(client.cache.config.dataIdFromObject({__typename: 'something', id: 3})).toEqual('whatever')
      })
    })
  })

  describe('callback for adding event handlers', () => {
    it('attaches handlers when no staticMediaType supplied', () => {
      setup()
      const {cb} = createClientEnhancer(defaultOptions)
      cb && cb(client) // tslint:disable-line

      expect(handlers.default).toHaveBeenCalled()
    })

    it('does not attach handlers when staticMediaType supplied', () => {
      setup()
      const {cb} = createClientEnhancer({breakpoints: defaultBreakpoints, staticMediaType: MEDIA_SIZES.medium})
      cb && cb(client) // tslint:disable-line

      expect(handlers.default).not.toHaveBeenCalled()
    })

    it('does not attach handlers when no window object apparent', () => {
      setup();
      (window as any).matchMedia = undefined
      const {cb} = createClientEnhancer(defaultOptions)
      cb && cb(client) // tslint:disable-line

      expect(handlers.default).not.toHaveBeenCalled()
    })

    // this assumes that there is jsdom (window) available as is the default in jest
    // - http://bit.ly/2IHc08P
    it('attaches the handlers to the created client', () => {
      setup()
      const {cb} = createClientEnhancer(defaultOptions)
      cb && cb(client) // tslint:disable-line
      const mockCallArg1 = (handlers.default as jest.Mock).mock.calls[0][0]

      expect(mockCallArg1).toHaveProperty('client', client)
      expect(mockCallArg1).toHaveProperty('window', window)

      expect(mockCallArg1).toHaveProperty('options')
      expect(mockCallArg1.options).toHaveProperty('breakpoints', defaultBreakpoints)
      expect(mockCallArg1.options).toHaveProperty('staticMediaType', undefined)
    })
  })
})
