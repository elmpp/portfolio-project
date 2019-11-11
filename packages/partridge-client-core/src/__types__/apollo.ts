import {ApolloClient} from 'apollo-client'
import {InMemoryCache, NormalizedCacheObject} from 'apollo-cache-inmemory'

export type Cache = InMemoryCache
// export type Cache = NormalizedCacheObject
export type Client = ApolloClient<NormalizedCacheObject>
