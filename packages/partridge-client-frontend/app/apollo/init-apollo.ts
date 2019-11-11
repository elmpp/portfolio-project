// import ApolloClient from 'apollo-client'
// import {withClientState} from 'apollo-link-state'

// import ApolloClient, {HttpLink, ApolloLink, InMemoryCache, NormalizedCacheObject} from 'apollo-boost'
import {ApolloClient} from 'apollo-client'
import {ApolloLink} from 'apollo-link'
import { onError } from "apollo-link-error"
import {HttpLink} from 'apollo-link-http'
import {withClientState} from 'apollo-link-state'
import {InMemoryCache, NormalizedCacheObject} from 'apollo-cache-inmemory'

import fetch from 'isomorphic-fetch'
import {disableFragmentWarnings} from 'graphql-tag'
import _ from 'lodash'
import {mergeTypes} from 'merge-graphql-schemas'
import responsiveClientEnhancer from '../../modules/apollo-responsive/create-client-enhancer'
import {Options} from '../../modules/apollo-responsive/__types__'
import {breakpoints} from '../../modules/apollo-responsive/media-type-constants'
import {Duck, Ducks, DUCK_NAMES} from '../../modules/ducks'
import emptyTypes from '../__graphql__/EmptyTypes.graphql'
import {Client} from '../../__types__'
import {logger} from 'partridge-logging'
import {config} from 'partridge-config'

// import {config} from 'partridge-config'

disableFragmentWarnings() // https://goo.gl/Tk89w6

/**
 * Sets up the apollo client/cache/link-state etc
 *
 * - http://bit.ly/2khLa8u
 * - http://bit.ly/2IGZqGL - link state stuff (for redux replacement)
 *
 */

let apolloClient: Client

// Polyfill fetch() on the server (used by apollo-client)
if (!process.browser) {
  global.fetch = fetch
}

export type InitOptions = Omit<Options, 'breakpoints'>

const getDucks = (enhancerOptions: InitOptions): Ducks => {
  return {
    [DUCK_NAMES.Responsive]: responsiveClientEnhancer({...enhancerOptions, breakpoints}),
  }
}

/**
 * Merges the imported set of Ducks together with the existent Responsive Duck to form
 * a single applicaable Duck
 */
export function mergeDucks(enhancerOptions: InitOptions): Omit<Duck, 'stateShape'> {
  // use the parts from our responsive link-state provider
  // const responsiveDuck = responsiveClientEnhancer({...enhancerOptions, breakpoints})
  const ducks = getDucks(enhancerOptions)
  
  // organising resolvers and defaults
  //  - http://bit.ly/2s7dxe8
  //  - https://goo.gl/8MGfkv
  return {
    resolvers: _.merge({}, ...Object.values(ducks).map(duck => duck.resolvers)),
    defaults: _.merge({}, ...Object.values(ducks).map(duck => duck.defaults)),
    // defaults: Object.keys(ducks).reduce((acc, duckModule: DUCK_NAMES) => {
    //   return {...acc, ...ducks[duckModule].defaults}
    // }, ducks[DUCK_NAMES.Responsive].defaults),
    typeDefs: mergeTypes([emptyTypes, ...Object.values(ducks).map(duck => duck.typeDefs)], {
      all: true,
    }), // https://goo.gl/ZJPZ3B
    cb: (client: Client) => Object.values(ducks).map(duck => duck.cb).reduce((acc, cb) => cb ? cb(acc): acc, client), // reduce callbacks - https://tinyurl.com/yywwjzx3
  }
}

/**
 * This is the normal `create` client setup advised in the setup guides
 *  - https://tinyurl.com/yyzbr2dy
 */
export function create(initialState: NormalizedCacheObject, enhancerOptions: InitOptions) {
  const cache = new InMemoryCache({
    addTypename: true,
  }).restore(initialState || {})

  const {cb, ...standardDuckParts} = mergeDucks(enhancerOptions)
// const util = require('util')
// console.log('standardDuckParts', util.inspect(standardDuckParts, {showHidden: false, depth: null}));

  const client = new ApolloClient({
    // connectToDevTools: process.browser,
    connectToDevTools: true,
    ssrMode: !process.browser, // Disables forceFetch on the server (so queries are only run once)
    cache,
    link: ApolloLink.from([
      onError(({graphQLErrors, networkError}) => { // error handling - https://tinyurl.com/y2z34as8
        if (graphQLErrors) {
          graphQLErrors.map(({ message, locations, path }) =>
            logger.log('error', message, {runtime_label: 'APOLLO', dumpables: {locations: [locations], path: [path]}})
          )
        }
        if (networkError) {
          logger.log('error', networkError, {runtime_label: 'APOLLO'})
        }
      }),
      withClientState({
        // done at start of chain so is before HttpLink - http://bit.ly/2LVSXWv
        cache,
        ...standardDuckParts,
      }),
      new HttpLink({
        uri: config.frontend.FRONTEND_API_HOST_SERVER, // Server URL (must be absolute)
        credentials: 'same-origin', // Additional fetch() options like `credentials` or `headers`
      }),
    ]),
    resolvers: {}, // https://tinyurl.com/yx9vrcqw
  })

  if (cb) {
    cb(client)
  }
  return client
}

export default function initApollo({initialState, staticMediaType}: InitOptions & {initialState: NormalizedCacheObject}) {
  // Make sure to create a new client for every server-side request so that data
  // isn't shared between connections (which would be bad)
  if (!process.browser) {
    // the responsive state should have been guessed at by the express middleware
    return create(initialState, {staticMediaType})
  }

  // Reuse client on the client-side
  if (!apolloClient) {
    apolloClient = create(initialState, {staticMediaType: undefined})
  }
  return apolloClient
}
