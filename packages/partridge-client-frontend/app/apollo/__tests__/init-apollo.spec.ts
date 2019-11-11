import {config} from 'partridge-config'
jest.doMock('next/config', () => () => ({publicRuntimeConfig: config.frontend}))

jest.doMock('../../../modules/apollo-responsive/create-client-enhancer')
// jest.doMock('apollo-client')
// jest.doMock('apollo-link-state', () => ({withClientState: () => 'WITH_CLIENT_STATE'}))

// import * as apolloClientModule from 'apollo-client'
const {ApolloClient} = jest.requireMock('apollo-client')
const {ApolloLink} = jest.requireMock('apollo-link')
const {HttpLink} = jest.requireMock('apollo-link-http')
// import {HttpLink} from 'apollo-link-http'
import initApollo, {create, InitOptions} from '../init-apollo'
import {MEDIA_SIZES, breakpoints} from '../../../modules/apollo-responsive/media-type-constants'
import {NormalizedCacheObject} from 'apollo-cache-inmemory'
import responsiveTypeDefs from '../../../modules/apollo-responsive/__graphql__/types.graphql'
import {Options} from '../../../modules/apollo-responsive/__types__'
const clientEnhancerModule = jest.requireMock('../../../modules/apollo-responsive/create-client-enhancer')

jest.mock('apollo-client', () => ({ApolloClient: jest.fn().mockImplementation(() => ({}))}))
jest.mock('apollo-link', () => ({ApolloLink: {from: jest.fn()}}))
jest.mock('apollo-link-http', () => ({HttpLink: jest.fn()}))
jest.mock('apollo-cache-inmemory')
jest.mock('apollo-link-state', () => ({withClientState: () => 'WITH_CLIENT_STATE'}))
// jest.mock('apollo-link', () => ({ApolloLink: jest.fn().mockImplementation(() => ({from: jest.fn()}))}))

const clientEnhancerCbSpy = jest.fn(client => client)
const clientEnhancer: jest.Mock<typeof clientEnhancerModule.default> = clientEnhancerModule.default // https://goo.gl/3JdZkZ
// const apolloClient = apolloClientModule.default as jest.Mock<apolloClientModule.default<any>>
clientEnhancer.mockImplementation(() => ({resolvers: [], defaults: [], typeDefs: responsiveTypeDefs, cb: clientEnhancerCbSpy}))

beforeEach(() => {
  jest.clearAllMocks()
})

describe.skip('initApollo', () => {
  afterEach(() => {
    process.browser = undefined
  })
  it('applies the enhancer to the create calls on the server side with the staticMediaType', () => {
    const expectedEnhancerArgs: Options = {staticMediaType: MEDIA_SIZES.medium, breakpoints}
    expect(process.browser).toBe(undefined) // should be the case for node

    initApollo({staticMediaType: MEDIA_SIZES.medium, initialState: {}})

    expect(clientEnhancer).toHaveBeenCalled()
    expect(clientEnhancer.mock.calls[0][0]).toEqual(expectedEnhancerArgs)

    expect(clientEnhancerCbSpy).toHaveBeenCalled()
    expect(clientEnhancerCbSpy.mock.calls[0][0]).toBeInstanceOf(ApolloClient)
  })
  it('applies the enhancer to the create calls on the browser side without the staticMediaType', () => {
    process.browser = true

    expect(process.browser).toBe(true)
    initApollo({staticMediaType: MEDIA_SIZES.medium, initialState: {}})

    expect(clientEnhancer).toHaveBeenCalled()
    expect(clientEnhancer.mock.calls[0][0] || {}).toHaveProperty('staticMediaType', undefined)
  })
})
describe.skip('create', () => {
  const anInitialValue: NormalizedCacheObject = {
    something: {
      __typename: 'something',
      something: 'else',
    },
  }
  it('creates a cache using initial state if supplied', () => {
    create(anInitialValue, {})
    expect(ApolloClient).toHaveBeenCalled()
    expect(ApolloClient.mock.calls[0][0].cache.data.data).toEqual(anInitialValue)
  })
  it('uses the supplied enhancerOptions when creating the responsiveClientEnhancer', () => {
    const enhancerOptions: InitOptions = {staticMediaType: MEDIA_SIZES.extraSmall}
    create(anInitialValue, enhancerOptions)

    expect(clientEnhancer.mock.calls[0][0]).toEqual(expect.objectContaining(enhancerOptions))
  })
  it('initiates the right values for the link args', () => {
    create(anInitialValue, {})

    expect(ApolloClient).toHaveBeenCalled()
    expect(ApolloLink.from.mock.calls[0][0][0]).toEqual('WITH_CLIENT_STATE')
    expect(ApolloLink.from.mock.calls[0][0][1]).toBeInstanceOf(HttpLink)
  })
  it('returns an apollo client instance', () => {
    expect(create(anInitialValue, {})).toBeInstanceOf(ApolloClient)
  })
})
