// import ApolloClient from 'apollo-client'
// import {withClientState} from 'apollo-link-state'
// import ApolloClient, {HttpLink, ApolloLink, InMemoryCache, NormalizedCacheObject} from 'apollo-boost'
import {ApolloClient} from 'apollo-client'
import {ApolloLink} from 'apollo-link'
import {onError} from 'apollo-link-error'
import {HttpLink} from 'apollo-link-http'
import {InMemoryCache, NormalizedCacheObject} from 'apollo-cache-inmemory'

// import fetch from 'isomorphic-fetch'
import {disableFragmentWarnings} from 'graphql-tag'
import _ from 'lodash'
import {mergeTypeDefs} from 'graphql-tools-merge-typedefs'
// import responsiveClientEnhancer from '../../modules/apollo-responsive/create-client-enhancer'
// import {Options} from '../../modules/apollo-responsive/__types__'
// import {breakpoints} from '../../modules/apollo-responsive/media-type-constants'
import duckFuns, {Duck, Ducks, DUCK_NAMES, Options, StateShape} from '../stateful/ducks'
import emptyTypes from './__graphql__/EmptyTypes.graphql'
// import {logger} from 'partridge-logging'
import {config} from 'partridge-config'
import {Client} from '../__types__/apollo'
import {withClientState} from 'apollo-link-state'
// import { getType } from 'mime';

// import {config} from 'partridge-config'
// export {Options} from '../stateful/ducks'

// Polyfill fetch() on the server (used by apollo-client) in non-RN envs
if (!process.browser && typeof fetch === 'undefined') {
  const fetch = require('isomorphic-fetch')
  global.fetch = fetch
}

disableFragmentWarnings() // https://goo.gl/Tk89w6

// export {
//   OptionsSomething as Options,
// }

/**
 * Sets up the apollo client/cache/link-state etc
 *
 * - http://bit.ly/2khLa8u
 * - http://bit.ly/2IGZqGL - link state stuff (for redux replacement)
 *
 */

let apolloClient: Client

// export type InitOptions = Omit<Options, 'breakpoints'>

// const getDucks = (enhancerOptions: InitOptions): Ducks => {
//   return {
//     [DUCK_NAMES.Responsive]: responsiveClientEnhancer({...enhancerOptions, breakpoints}),
//   }
// }

type GroupedDucks = {
  [key in DUCK_NAMES]: Duck
}
type GroupedDefaults = {
  [key in DUCK_NAMES]: Duck['defaults']
}

type MergedDucks = Duck & {
  defaults: GroupedDefaults
}

/**
 * Merges the imported set of Ducks together to form
 * a single applicable Duck
 */
export function mergeDucks(options: Options): MergedDucks {
  // use the parts from our responsive link-state provider
  // const responsiveDuck = responsiveClientEnhancer({...enhancerOptions, breakpoints})
  // const ducks = getDucks(enhancerOptions)

  // pass options through to individual Duck functions
  const ducks: GroupedDucks = _.mapValues(duckFuns, (duckFun, duckName) => duckFun(options[duckName as DUCK_NAMES]))

  // console.log(typeof emptyTypes, Object.values(ducks).map(duck => duck.typeDefs))

  // organising resolvers and defaults
  //  - http://bit.ly/2s7dxe8
  //  - https://goo.gl/8MGfkv
  return {
    resolvers: _.merge({}, ...Object.values(ducks).map(duck => duck.resolvers)),
    // defaults: Object.keys(ducks).map(duck => duck.defaults)),
    defaults: _.transform<Duck, any>(
      ducks,
      (acc, {defaults}, duckName) => {
        acc[duckName] = defaults
      },
      {}
    ),
    // defaults: _.merge({}, ...Object.values(ducks).map(duck => duck.defaults)),
    // defaults: Object.keys(ducks).reduce((acc, duckModule: DUCK_NAMES) => {
    //   return {...acc, ...ducks[duckModule].defaults}
    // }, ducks[DUCK_NAMES.Responsive].defaults),
    typeDefs: mergeTypeDefs([emptyTypes, ...Object.values(ducks).map(duck => duck.typeDefs)]) as Duck['typeDefs'], // graphql-tools-merge-typedefs - https://tinyurl.com/y2pn8ldt
    // cb: (client: Client) => Object.values(ducks).map(duck => duck.cb).reduce((acc, cb) => cb ? cb(acc): acc, client), // reduce callbacks - https://tinyurl.com/yywwjzx3
  }
}

// /**
//  * Produces a total graphql schema, including from our local ducks and from the
//  * (postgraphile) server.
//  *
//  *  - @see partridge-api/src/index for details of how server schema is dumped
//  *  - DEV ONLY! (uses fs)
//  */
// export const mergeDucksAndServer = (options: Options): Duck => {

//   const fs = require('fs')
//   const path = require('path')

//   // pass options through to individual Duck functions
//   const ducks = _.mapValues(duckFuns, (duckFun, duckName) => duckFun(options[duckName as DUCK_NAMES]))

//   const serverTypeDefs = fs.readFileSync(path.resolve(__dirname, '../../schema-dump-api.json')).data.__schema.types

//   return {
//     resolvers: _.merge({}, ...Object.values(ducks).map(duck => duck.resolvers)),
//     defaults: _.merge({}, ...Object.values(ducks).map(duck => duck.defaults)),
//     typeDefs: mergeTypeDefs([
//       emptyTypes,
//       ...Object.values(ducks).map(duck => duck.typeDefs),
//       ...serverTypeDefs,

//     ]) as Duck['typeDefs'], // graphql-tools-merge-typedefs - https://tinyurl.com/y2pn8ldt
//   }
// }

// console.log('logger :', logger);

// /**
//  * This is the normal `create` client setup advised in the setup guides
//  *  - https://tinyurl.com/yyzbr2dy
//  */
function create(initialState: NormalizedCacheObject, options: Options) {
  const cache = new InMemoryCache({
    addTypename: true,
  }).restore(initialState || {})

  const schema = mergeDucks(options)
  // const util = require('util')
  // console.log('standardDuckParts', util.inspect(standardDuckParts, {showHidden: false, depth: null}));

  const client = new ApolloClient({
    // connectToDevTools: process.browser,
    connectToDevTools: true,
    ssrMode: !process.browser, // Disables forceFetch on the server (so queries are only run once)
    cache,
    link: ApolloLink.from([
      onError(({graphQLErrors, networkError}) => {
        // error handling - https://tinyurl.com/y2z34as8
        if (graphQLErrors) {
          graphQLErrors.map(() =>
            // graphQLErrors.map(({ message, locations, path }) =>
            // logger.log('error', message, {runtime_label: 'APOLLO', dumpables: {locations: [locations], path: [path]}})
            console.log('pants')
          )
        }
        if (networkError) {
          console.log('pants')
          // logger.log('error', networkError, {runtime_label: 'APOLLO'})
        }
      }),
      // withClientState - https://tinyurl.com/y2qxuywa
      withClientState({
        cache,
        ...schema,
      }),
      new HttpLink({
        uri: config.frontend.FRONTEND_API_HOST_SERVER, // Server URL (must be absolute)
        credentials: 'same-origin', // Additional fetch() options like `credentials` or `headers`
      }),
    ]),
    resolvers: {}, // https://tinyurl.com/yx9vrcqw
  })

  // if (cb) {
  //   cb(client)
  // }
  return client
}

export default function initApollo(initialState: NormalizedCacheObject, options: Options) {
  // console.log('process-init-apollo :', process);

  // Make sure to create a new client for every server-side request so that data
  // isn't shared between connections (which would be bad)
  if (!process.browser) {
    // the responsive state should have been guessed at by the express middleware
    return create(initialState, options)
  }

  // Reuse client on the client-side
  if (!apolloClient) {
    apolloClient = create(initialState, options)
  }
  return apolloClient
}
