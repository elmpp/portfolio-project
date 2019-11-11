// import ApolloClient from 'apollo-client'
// import {InMemoryCache, ApolloClient} from 'apollo-boost'
import {InMemoryCache} from 'apollo-cache-inmemory'
import ApolloClient from 'apollo-client'
import {SchemaLink} from 'apollo-link-schema'
import {buildClientSchema} from 'graphql/utilities'
import {addMockFunctionsToSchema, makeExecutableSchema, mergeSchemas} from 'graphql-tools'
import {mergeDucks} from './init-apollo'
import * as apiSchemaIntrospection from '../__graphql__/api-schema.json' // https://goo.gl/4e4BDH

/**
 * Creates an apollo client instance with mocking for both server and client schemas
 *
 * - https://goo.gl/t5Swgn
 * - https://goo.gl/i4UBMt
 */

export default function initMockApollo() {
  // eslint-disable-next-line no-unused-vars
  const {cb, ...mergedDucks} = mergeDucks({staticMediaType: undefined, defaultMediaType: undefined})

  // we create our schemas from api and local
  const apiSchema = buildClientSchema(apiSchemaIntrospection as any) // this function for introspection exports - https://goo.gl/4e4BDH
  addMockFunctionsToSchema({schema: apiSchema})
  const localSchema = makeExecutableSchema(mergedDucks) // this function for creating schemas (this will include resolvers)
  addMockFunctionsToSchema({schema: localSchema})

  // schema-stitch these together. Bear in mind that init-apollo.js needn't do this because the
  // remote schema is "behind" our graphql server
  const schema = mergeSchemas({
    schemas: [apiSchema, localSchema],
  })

  return new ApolloClient({
    link: new SchemaLink({schema}),
    cache: new InMemoryCache({
      addTypename: true,
    }),
  })
}
