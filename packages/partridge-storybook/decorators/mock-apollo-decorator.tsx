/**
 * Creates an apollo client instance with mocking for both server and client schemas
 *
 *  - based on apollo-storybook-decorator - https://tinyurl.com/y2gobnn2
 *  - mocking schema - https://tinyurl.com/y5ead3k4
 *  - writing addons - https://tinyurl.com/y4sz5sf3
 *  - dumped schema in partridge-client-core - https://tinyurl.com/yykb93k5
 *  - introspectionFragmentMatcher addition to support fragments - https://tinyurl.com/y5e5lgau
 */

import * as React from 'react'
import {forceReRender} from '@storybook/react'
import schemaGql from '../../partridge-client-core/schema-dump-combined.graphql'
import {InMemoryCache, IntrospectionFragmentMatcher} from 'apollo-cache-inmemory'
import ApolloClient from 'apollo-client'
import {SchemaLink} from 'apollo-link-schema'
import {addMockFunctionsToSchema, makeExecutableSchema} from 'graphql-tools'
import {Dimensions, ScaledSize} from 'react-native'
import {ApolloProvider, calculateInputFromDimensions, mergeDucks} from 'partridge-client-core'
import {DecoratorFunction} from '../__types__'
import {mockEventView} from '../mock'
import {filter} from 'org-common/util'

// to support use of fragments in our queries -  https://tinyurl.com/y5e5lgau
import introspectionResult from 'partridge-client-core/src/__types__/graphql/__generated__/introspection-result'

const fragmentMatcher = new IntrospectionFragmentMatcher({
  introspectionQueryResultData: introspectionResult,
})

const writeDimensionsToCache = (suppliedScaledSize: Partial<ScaledSize> = {}, cache: InMemoryCache) => {
  const scaledSize = Dimensions.get('window')
  const newCacheDimensions = {...scaledSize, ...filter(suppliedScaledSize, val => !!val)}
  // console.log('newCacheDimensions :', newCacheDimensions);
  const input = {...calculateInputFromDimensions(newCacheDimensions), __typename: 'Dimensions'}
  cache.writeData({data: {dimensions: input}})
}


export const mockApolloDecorator = (options: Parameters<typeof mergeDucks>[0]): DecoratorFunction => storyFn => {

  const builtSchema = makeExecutableSchema({
    typeDefs: schemaGql,
    resolverValidationOptions: {
      requireResolversForResolveType: false,
    },
  })

  addMockFunctionsToSchema({
    schema: builtSchema,
    mocks: {
      Datetime: () => {
        return new Date()
      },
      BigInt: () => {
        return 7575757575
      },
      Query: () => ({
        eventByCanonicalisedNameUniqueQuery: () => mockEventView(20),
      }),
    },
  })

  const clientDucks = mergeDucks(options)

  const cache = new InMemoryCache({
    addTypename: true,
    fragmentMatcher,
  })
  cache.writeData({
    data: {
      ...clientDucks.defaults,
    },
  })
  writeDimensionsToCache({}, cache)

  Dimensions.addEventListener('change', ({window: windowScaledSize}) => {
    writeDimensionsToCache(windowScaledSize, cache)
    forceReRender()
  })


  const client = new ApolloClient({
    link: new SchemaLink({schema: builtSchema}),
    cache,
  })

  const StorybookProvider = ({children}: {children: React.ReactNode}) => (
    <ApolloProvider client={client}>{children}</ApolloProvider>
  )

  return <StorybookProvider>{storyFn()}</StorybookProvider>
}
