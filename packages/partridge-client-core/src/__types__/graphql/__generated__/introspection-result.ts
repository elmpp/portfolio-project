export type Maybe<T> = T | null

export interface IntrospectionResultData {
  __schema: {
    types: {
      kind: string
      name: string
      possibleTypes: {
        name: string
      }[]
    }[]
  }
}

const result: IntrospectionResultData = {
  __schema: {
    types: [
      {
        kind: 'INTERFACE',
        name: 'Node',
        possibleTypes: [
          {
            name: 'Query',
          },
          {
            name: '_TypeormMigration',
          },
          {
            name: 'Category1',
          },
          {
            name: 'MetaCategory1',
          },
          {
            name: 'Category2',
          },
          {
            name: 'MetaCategory2',
          },
          {
            name: 'Category3',
          },
          {
            name: 'MetaCategory3',
          },
          {
            name: 'Event',
          },
          {
            name: 'MetaEvent',
          },
          {
            name: 'ConcreteEvent',
          },
          {
            name: 'MetaConcreteEvent',
          },
          {
            name: 'ConcreteMarket',
          },
          {
            name: 'Market',
          },
          {
            name: 'MetaMarket',
          },
          {
            name: 'MarketCollectionJoinMarket',
          },
          {
            name: 'MarketCollection',
          },
          {
            name: 'MetaMarketCollection',
          },
          {
            name: 'MetaConcreteMarket',
          },
          {
            name: 'ConcreteOutcome',
          },
          {
            name: 'Outcome',
          },
          {
            name: 'MetaOutcome',
          },
          {
            name: 'MetaConcreteOutcome',
          },
          {
            name: 'EventView',
          },
          {
            name: 'MarketView',
          },
          {
            name: 'OutcomeView',
          },
          {
            name: 'Queue',
          },
          {
            name: 'Rename',
          },
          {
            name: 'Run',
          },
        ],
      },
    ],
  },
}

export default result

/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: string
  String: string
  Boolean: boolean
  Int: number
  Float: number
  /** A location in a connection that can be used for resuming pagination. */
  Cursor: any
  /**
   * A signed eight-byte integer. The upper big integer values are greater than the
   * max value for a JavaScript number. Therefore all big integers will be output as
   * strings and not numbers.
   **/
  BigInt: any
  /** A universally unique identifier as defined by [RFC 4122](https://tools.ietf.org/html/rfc4122). */
  UUID: any
  /**
   * A point in time as described by the [ISO
   * 8601](https://en.wikipedia.org/wiki/ISO_8601) standard. May or may not include a timezone.
   **/
  Datetime: any
  /** A JavaScript object encoded in the JSON format as specified by [ECMA-404](http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf). */
  JSON: any
}

export type _TypeormMigration = Node & {
  __typename?: '_TypeormMigration'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  id: Scalars['Int']
  timestamp: Scalars['BigInt']
  name: Scalars['String']
}

/**
 * A condition to be used against `_TypeormMigration` object types. All fields are
 * tested for equality and combined with a logical ‘and.’
 **/
export type _TypeormMigrationCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['Int']>
  /** Checks for equality with the object’s `timestamp` field. */
  timestamp?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `name` field. */
  name?: Maybe<Scalars['String']>
}

/** A connection to a list of `_TypeormMigration` values. */
export type _TypeormMigrationsConnection = {
  __typename?: '_TypeormMigrationsConnection'
  /** A list of `_TypeormMigration` objects. */
  nodes: Array<Maybe<_TypeormMigration>>
  /** A list of edges which contains the `_TypeormMigration` and cursor to aid in pagination. */
  edges: Array<_TypeormMigrationsEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `_TypeormMigration` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `_TypeormMigration` edge in the connection. */
export type _TypeormMigrationsEdge = {
  __typename?: '_TypeormMigrationsEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `_TypeormMigration` at the end of the edge. */
  node?: Maybe<_TypeormMigration>
}

/** Methods to use when ordering `_TypeormMigration`. */
export enum _TypeormMigrationsOrderBy {
  Natural = 'NATURAL',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  TimestampAsc = 'TIMESTAMP_ASC',
  TimestampDesc = 'TIMESTAMP_DESC',
  NameAsc = 'NAME_ASC',
  NameDesc = 'NAME_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

/** All input for the `applyCanonicalise` mutation. */
export type ApplyCanonicaliseInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  metaParam?: Maybe<MetaInput>
  append?: Maybe<Scalars['String']>
}

/** The output of our `applyCanonicalise` mutation. */
export type ApplyCanonicalisePayload = {
  __typename?: 'ApplyCanonicalisePayload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  meta?: Maybe<Meta>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
}

/** All input for the `applyRenaming` mutation. */
export type ApplyRenamingInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  entityName?: Maybe<Scalars['String']>
  metaParam?: Maybe<MetaInput>
}

/** The output of our `applyRenaming` mutation. */
export type ApplyRenamingPayload = {
  __typename?: 'ApplyRenamingPayload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  meta?: Maybe<Meta>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
}

export enum BettingStatusEnum {
  Priced = 'PRICED',
}

export type Category1 = Node & {
  __typename?: 'Category1'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  id: Scalars['BigInt']
  name: Scalars['String']
  canonicalisedName: Scalars['String']
  canonicalisedNameUnique: Scalars['String']
  displayOrder: Scalars['Int']
  /** Reads a single `MetaCategory1` that is related to this `Category1`. */
  metaCategory1ById?: Maybe<MetaCategory1>
  /** Reads and enables pagination through a set of `MetaCategory1`. */
  metaCategory1SById: MetaCategory1sConnection
  /** Reads and enables pagination through a set of `Category2`. */
  category2s: Category2sConnection
}

export type Category1MetaCategory1SByIdArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaCategory1sOrderBy>>
  condition?: Maybe<MetaCategory1Condition>
}

export type Category1Category2sArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<Category2sOrderBy>>
  condition?: Maybe<Category2Condition>
}

/**
 * A condition to be used against `Category1` object types. All fields are tested
 * for equality and combined with a logical ‘and.’
 **/
export type Category1Condition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `name` field. */
  name?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedName` field. */
  canonicalisedName?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedNameUnique` field. */
  canonicalisedNameUnique?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `displayOrder` field. */
  displayOrder?: Maybe<Scalars['Int']>
}

/** A connection to a list of `Category1` values. */
export type Category1sConnection = {
  __typename?: 'Category1sConnection'
  /** A list of `Category1` objects. */
  nodes: Array<Maybe<Category1>>
  /** A list of edges which contains the `Category1` and cursor to aid in pagination. */
  edges: Array<Category1sEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `Category1` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `Category1` edge in the connection. */
export type Category1sEdge = {
  __typename?: 'Category1sEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `Category1` at the end of the edge. */
  node?: Maybe<Category1>
}

/** Methods to use when ordering `Category1`. */
export enum Category1sOrderBy {
  Natural = 'NATURAL',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  NameAsc = 'NAME_ASC',
  NameDesc = 'NAME_DESC',
  CanonicalisedNameAsc = 'CANONICALISED_NAME_ASC',
  CanonicalisedNameDesc = 'CANONICALISED_NAME_DESC',
  CanonicalisedNameUniqueAsc = 'CANONICALISED_NAME_UNIQUE_ASC',
  CanonicalisedNameUniqueDesc = 'CANONICALISED_NAME_UNIQUE_DESC',
  DisplayOrderAsc = 'DISPLAY_ORDER_ASC',
  DisplayOrderDesc = 'DISPLAY_ORDER_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

export type Category2 = Node & {
  __typename?: 'Category2'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  id: Scalars['BigInt']
  name: Scalars['String']
  canonicalisedName: Scalars['String']
  canonicalisedNameUnique: Scalars['String']
  displayOrder: Scalars['Int']
  category1Id: Scalars['BigInt']
  /** Reads a single `Category1` that is related to this `Category2`. */
  category1?: Maybe<Category1>
  /** Reads a single `MetaCategory2` that is related to this `Category2`. */
  metaCategory2ById?: Maybe<MetaCategory2>
  /** Reads and enables pagination through a set of `MetaCategory2`. */
  metaCategory2SById: MetaCategory2sConnection
  /** Reads and enables pagination through a set of `Category3`. */
  category3s: Category3sConnection
}

export type Category2MetaCategory2SByIdArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaCategory2sOrderBy>>
  condition?: Maybe<MetaCategory2Condition>
}

export type Category2Category3sArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<Category3sOrderBy>>
  condition?: Maybe<Category3Condition>
}

/**
 * A condition to be used against `Category2` object types. All fields are tested
 * for equality and combined with a logical ‘and.’
 **/
export type Category2Condition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `name` field. */
  name?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedName` field. */
  canonicalisedName?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedNameUnique` field. */
  canonicalisedNameUnique?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `displayOrder` field. */
  displayOrder?: Maybe<Scalars['Int']>
  /** Checks for equality with the object’s `category1Id` field. */
  category1Id?: Maybe<Scalars['BigInt']>
}

/** A connection to a list of `Category2` values. */
export type Category2sConnection = {
  __typename?: 'Category2sConnection'
  /** A list of `Category2` objects. */
  nodes: Array<Maybe<Category2>>
  /** A list of edges which contains the `Category2` and cursor to aid in pagination. */
  edges: Array<Category2sEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `Category2` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `Category2` edge in the connection. */
export type Category2sEdge = {
  __typename?: 'Category2sEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `Category2` at the end of the edge. */
  node?: Maybe<Category2>
}

/** Methods to use when ordering `Category2`. */
export enum Category2sOrderBy {
  Natural = 'NATURAL',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  NameAsc = 'NAME_ASC',
  NameDesc = 'NAME_DESC',
  CanonicalisedNameAsc = 'CANONICALISED_NAME_ASC',
  CanonicalisedNameDesc = 'CANONICALISED_NAME_DESC',
  CanonicalisedNameUniqueAsc = 'CANONICALISED_NAME_UNIQUE_ASC',
  CanonicalisedNameUniqueDesc = 'CANONICALISED_NAME_UNIQUE_DESC',
  DisplayOrderAsc = 'DISPLAY_ORDER_ASC',
  DisplayOrderDesc = 'DISPLAY_ORDER_DESC',
  Category1IdAsc = 'CATEGORY1_ID_ASC',
  Category1IdDesc = 'CATEGORY1_ID_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

export type Category3 = Node & {
  __typename?: 'Category3'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  id: Scalars['BigInt']
  name: Scalars['String']
  canonicalisedName: Scalars['String']
  canonicalisedNameUnique: Scalars['String']
  displayOrder: Scalars['Int']
  category2Id: Scalars['BigInt']
  /** Reads a single `Category2` that is related to this `Category3`. */
  category2?: Maybe<Category2>
  /** Reads a single `MetaCategory3` that is related to this `Category3`. */
  metaCategory3ById?: Maybe<MetaCategory3>
  /** Reads and enables pagination through a set of `MetaCategory3`. */
  metaCategory3SById: MetaCategory3sConnection
  /** Reads and enables pagination through a set of `Event`. */
  events: EventsConnection
}

export type Category3MetaCategory3SByIdArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaCategory3sOrderBy>>
  condition?: Maybe<MetaCategory3Condition>
}

export type Category3EventsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<EventsOrderBy>>
  condition?: Maybe<EventCondition>
}

/**
 * A condition to be used against `Category3` object types. All fields are tested
 * for equality and combined with a logical ‘and.’
 **/
export type Category3Condition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `name` field. */
  name?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedName` field. */
  canonicalisedName?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedNameUnique` field. */
  canonicalisedNameUnique?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `displayOrder` field. */
  displayOrder?: Maybe<Scalars['Int']>
  /** Checks for equality with the object’s `category2Id` field. */
  category2Id?: Maybe<Scalars['BigInt']>
}

/** A connection to a list of `Category3` values. */
export type Category3sConnection = {
  __typename?: 'Category3sConnection'
  /** A list of `Category3` objects. */
  nodes: Array<Maybe<Category3>>
  /** A list of edges which contains the `Category3` and cursor to aid in pagination. */
  edges: Array<Category3sEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `Category3` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `Category3` edge in the connection. */
export type Category3sEdge = {
  __typename?: 'Category3sEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `Category3` at the end of the edge. */
  node?: Maybe<Category3>
}

/** Methods to use when ordering `Category3`. */
export enum Category3sOrderBy {
  Natural = 'NATURAL',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  NameAsc = 'NAME_ASC',
  NameDesc = 'NAME_DESC',
  CanonicalisedNameAsc = 'CANONICALISED_NAME_ASC',
  CanonicalisedNameDesc = 'CANONICALISED_NAME_DESC',
  CanonicalisedNameUniqueAsc = 'CANONICALISED_NAME_UNIQUE_ASC',
  CanonicalisedNameUniqueDesc = 'CANONICALISED_NAME_UNIQUE_DESC',
  DisplayOrderAsc = 'DISPLAY_ORDER_ASC',
  DisplayOrderDesc = 'DISPLAY_ORDER_DESC',
  Category2IdAsc = 'CATEGORY2_ID_ASC',
  Category2IdDesc = 'CATEGORY2_ID_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

export type ConcreteEvent = Node & {
  __typename?: 'ConcreteEvent'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  id: Scalars['BigInt']
  displayed: Scalars['Boolean']
  url?: Maybe<Scalars['String']>
  processedId: Scalars['BigInt']
  feedSupplier: FeedSupplierEnum
  status: StatusEnum
  /** Reads a single `Event` that is related to this `ConcreteEvent`. */
  processed?: Maybe<Event>
  /** Reads a single `MetaConcreteEvent` that is related to this `ConcreteEvent`. */
  metaConcreteEventById?: Maybe<MetaConcreteEvent>
  /** Reads and enables pagination through a set of `MetaConcreteEvent`. */
  metaConcreteEventsById: MetaConcreteEventsConnection
  /** Reads and enables pagination through a set of `ConcreteMarket`. */
  concreteMarkets: ConcreteMarketsConnection
}

export type ConcreteEventMetaConcreteEventsByIdArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaConcreteEventsOrderBy>>
  condition?: Maybe<MetaConcreteEventCondition>
}

export type ConcreteEventConcreteMarketsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<ConcreteMarketsOrderBy>>
  condition?: Maybe<ConcreteMarketCondition>
}

/**
 * A condition to be used against `ConcreteEvent` object types. All fields are
 * tested for equality and combined with a logical ‘and.’
 **/
export type ConcreteEventCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `displayed` field. */
  displayed?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `url` field. */
  url?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `processedId` field. */
  processedId?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `feedSupplier` field. */
  feedSupplier?: Maybe<FeedSupplierEnum>
  /** Checks for equality with the object’s `status` field. */
  status?: Maybe<StatusEnum>
}

/** A connection to a list of `ConcreteEvent` values. */
export type ConcreteEventsConnection = {
  __typename?: 'ConcreteEventsConnection'
  /** A list of `ConcreteEvent` objects. */
  nodes: Array<Maybe<ConcreteEvent>>
  /** A list of edges which contains the `ConcreteEvent` and cursor to aid in pagination. */
  edges: Array<ConcreteEventsEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `ConcreteEvent` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `ConcreteEvent` edge in the connection. */
export type ConcreteEventsEdge = {
  __typename?: 'ConcreteEventsEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `ConcreteEvent` at the end of the edge. */
  node?: Maybe<ConcreteEvent>
}

/** Methods to use when ordering `ConcreteEvent`. */
export enum ConcreteEventsOrderBy {
  Natural = 'NATURAL',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  DisplayedAsc = 'DISPLAYED_ASC',
  DisplayedDesc = 'DISPLAYED_DESC',
  UrlAsc = 'URL_ASC',
  UrlDesc = 'URL_DESC',
  ProcessedIdAsc = 'PROCESSED_ID_ASC',
  ProcessedIdDesc = 'PROCESSED_ID_DESC',
  FeedSupplierAsc = 'FEED_SUPPLIER_ASC',
  FeedSupplierDesc = 'FEED_SUPPLIER_DESC',
  StatusAsc = 'STATUS_ASC',
  StatusDesc = 'STATUS_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

export type ConcreteMarket = Node & {
  __typename?: 'ConcreteMarket'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  id: Scalars['BigInt']
  cashoutAvailable: Scalars['Boolean']
  eachwayAvailable: Scalars['Boolean']
  firstFourAvailable: Scalars['Boolean']
  forecastAvailable: Scalars['Boolean']
  guaranteedPriceAvailable: Scalars['Boolean']
  placeAvailable: Scalars['Boolean']
  quinellaAvailable: Scalars['Boolean']
  tricastAvailable: Scalars['Boolean']
  url?: Maybe<Scalars['String']>
  concreteEventId: Scalars['BigInt']
  processedId: Scalars['BigInt']
  displayOrder: Scalars['Int']
  isDefault: Scalars['Boolean']
  feedSupplier: FeedSupplierEnum
  betInPlay: Scalars['Boolean']
  betTill?: Maybe<Scalars['Datetime']>
  bettingStatus: BettingStatusEnum
  status: StatusEnum
  /** Reads a single `ConcreteEvent` that is related to this `ConcreteMarket`. */
  concreteEvent?: Maybe<ConcreteEvent>
  /** Reads a single `Market` that is related to this `ConcreteMarket`. */
  processed?: Maybe<Market>
  /** Reads a single `MetaConcreteMarket` that is related to this `ConcreteMarket`. */
  metaConcreteMarketById?: Maybe<MetaConcreteMarket>
  /** Reads and enables pagination through a set of `MetaConcreteMarket`. */
  metaConcreteMarketsById: MetaConcreteMarketsConnection
  /** Reads and enables pagination through a set of `ConcreteOutcome`. */
  concreteOutcomes: ConcreteOutcomesConnection
}

export type ConcreteMarketMetaConcreteMarketsByIdArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaConcreteMarketsOrderBy>>
  condition?: Maybe<MetaConcreteMarketCondition>
}

export type ConcreteMarketConcreteOutcomesArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<ConcreteOutcomesOrderBy>>
  condition?: Maybe<ConcreteOutcomeCondition>
}

/**
 * A condition to be used against `ConcreteMarket` object types. All fields are
 * tested for equality and combined with a logical ‘and.’
 **/
export type ConcreteMarketCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `cashoutAvailable` field. */
  cashoutAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `eachwayAvailable` field. */
  eachwayAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `firstFourAvailable` field. */
  firstFourAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `forecastAvailable` field. */
  forecastAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `guaranteedPriceAvailable` field. */
  guaranteedPriceAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `placeAvailable` field. */
  placeAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `quinellaAvailable` field. */
  quinellaAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `tricastAvailable` field. */
  tricastAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `url` field. */
  url?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `concreteEventId` field. */
  concreteEventId?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `processedId` field. */
  processedId?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `displayOrder` field. */
  displayOrder?: Maybe<Scalars['Int']>
  /** Checks for equality with the object’s `isDefault` field. */
  isDefault?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `feedSupplier` field. */
  feedSupplier?: Maybe<FeedSupplierEnum>
  /** Checks for equality with the object’s `betInPlay` field. */
  betInPlay?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `betTill` field. */
  betTill?: Maybe<Scalars['Datetime']>
  /** Checks for equality with the object’s `bettingStatus` field. */
  bettingStatus?: Maybe<BettingStatusEnum>
  /** Checks for equality with the object’s `status` field. */
  status?: Maybe<StatusEnum>
}

/** A connection to a list of `ConcreteMarket` values. */
export type ConcreteMarketsConnection = {
  __typename?: 'ConcreteMarketsConnection'
  /** A list of `ConcreteMarket` objects. */
  nodes: Array<Maybe<ConcreteMarket>>
  /** A list of edges which contains the `ConcreteMarket` and cursor to aid in pagination. */
  edges: Array<ConcreteMarketsEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `ConcreteMarket` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `ConcreteMarket` edge in the connection. */
export type ConcreteMarketsEdge = {
  __typename?: 'ConcreteMarketsEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `ConcreteMarket` at the end of the edge. */
  node?: Maybe<ConcreteMarket>
}

/** Methods to use when ordering `ConcreteMarket`. */
export enum ConcreteMarketsOrderBy {
  Natural = 'NATURAL',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  CashoutAvailableAsc = 'CASHOUT_AVAILABLE_ASC',
  CashoutAvailableDesc = 'CASHOUT_AVAILABLE_DESC',
  EachwayAvailableAsc = 'EACHWAY_AVAILABLE_ASC',
  EachwayAvailableDesc = 'EACHWAY_AVAILABLE_DESC',
  FirstFourAvailableAsc = 'FIRST_FOUR_AVAILABLE_ASC',
  FirstFourAvailableDesc = 'FIRST_FOUR_AVAILABLE_DESC',
  ForecastAvailableAsc = 'FORECAST_AVAILABLE_ASC',
  ForecastAvailableDesc = 'FORECAST_AVAILABLE_DESC',
  GuaranteedPriceAvailableAsc = 'GUARANTEED_PRICE_AVAILABLE_ASC',
  GuaranteedPriceAvailableDesc = 'GUARANTEED_PRICE_AVAILABLE_DESC',
  PlaceAvailableAsc = 'PLACE_AVAILABLE_ASC',
  PlaceAvailableDesc = 'PLACE_AVAILABLE_DESC',
  QuinellaAvailableAsc = 'QUINELLA_AVAILABLE_ASC',
  QuinellaAvailableDesc = 'QUINELLA_AVAILABLE_DESC',
  TricastAvailableAsc = 'TRICAST_AVAILABLE_ASC',
  TricastAvailableDesc = 'TRICAST_AVAILABLE_DESC',
  UrlAsc = 'URL_ASC',
  UrlDesc = 'URL_DESC',
  ConcreteEventIdAsc = 'CONCRETE_EVENT_ID_ASC',
  ConcreteEventIdDesc = 'CONCRETE_EVENT_ID_DESC',
  ProcessedIdAsc = 'PROCESSED_ID_ASC',
  ProcessedIdDesc = 'PROCESSED_ID_DESC',
  DisplayOrderAsc = 'DISPLAY_ORDER_ASC',
  DisplayOrderDesc = 'DISPLAY_ORDER_DESC',
  IsDefaultAsc = 'IS_DEFAULT_ASC',
  IsDefaultDesc = 'IS_DEFAULT_DESC',
  FeedSupplierAsc = 'FEED_SUPPLIER_ASC',
  FeedSupplierDesc = 'FEED_SUPPLIER_DESC',
  BetInPlayAsc = 'BET_IN_PLAY_ASC',
  BetInPlayDesc = 'BET_IN_PLAY_DESC',
  BetTillAsc = 'BET_TILL_ASC',
  BetTillDesc = 'BET_TILL_DESC',
  BettingStatusAsc = 'BETTING_STATUS_ASC',
  BettingStatusDesc = 'BETTING_STATUS_DESC',
  StatusAsc = 'STATUS_ASC',
  StatusDesc = 'STATUS_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

export type ConcreteOutcome = Node & {
  __typename?: 'ConcreteOutcome'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  id: Scalars['BigInt']
  odds?: Maybe<Scalars['String']>
  oddsDecimal?: Maybe<Scalars['Float']>
  runnerNumber?: Maybe<Scalars['Int']>
  handicap?: Maybe<Scalars['String']>
  displayOrder: Scalars['Int']
  isHome: Scalars['Boolean']
  concreteMarketId: Scalars['BigInt']
  processedId: Scalars['BigInt']
  feedSupplier: FeedSupplierEnum
  livePriceAvailable: Scalars['Boolean']
  startingPriceAvailable: Scalars['Boolean']
  status: StatusEnum
  /** Reads a single `ConcreteMarket` that is related to this `ConcreteOutcome`. */
  concreteMarket?: Maybe<ConcreteMarket>
  /** Reads a single `Outcome` that is related to this `ConcreteOutcome`. */
  processed?: Maybe<Outcome>
  /** Reads a single `MetaConcreteOutcome` that is related to this `ConcreteOutcome`. */
  metaConcreteOutcomeById?: Maybe<MetaConcreteOutcome>
  /** Reads and enables pagination through a set of `MetaConcreteOutcome`. */
  metaConcreteOutcomesById: MetaConcreteOutcomesConnection
}

export type ConcreteOutcomeMetaConcreteOutcomesByIdArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaConcreteOutcomesOrderBy>>
  condition?: Maybe<MetaConcreteOutcomeCondition>
}

/**
 * A condition to be used against `ConcreteOutcome` object types. All fields are
 * tested for equality and combined with a logical ‘and.’
 **/
export type ConcreteOutcomeCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `odds` field. */
  odds?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `oddsDecimal` field. */
  oddsDecimal?: Maybe<Scalars['Float']>
  /** Checks for equality with the object’s `runnerNumber` field. */
  runnerNumber?: Maybe<Scalars['Int']>
  /** Checks for equality with the object’s `handicap` field. */
  handicap?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `displayOrder` field. */
  displayOrder?: Maybe<Scalars['Int']>
  /** Checks for equality with the object’s `isHome` field. */
  isHome?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `concreteMarketId` field. */
  concreteMarketId?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `processedId` field. */
  processedId?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `feedSupplier` field. */
  feedSupplier?: Maybe<FeedSupplierEnum>
  /** Checks for equality with the object’s `livePriceAvailable` field. */
  livePriceAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `startingPriceAvailable` field. */
  startingPriceAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `status` field. */
  status?: Maybe<StatusEnum>
}

/** A connection to a list of `ConcreteOutcome` values. */
export type ConcreteOutcomesConnection = {
  __typename?: 'ConcreteOutcomesConnection'
  /** A list of `ConcreteOutcome` objects. */
  nodes: Array<Maybe<ConcreteOutcome>>
  /** A list of edges which contains the `ConcreteOutcome` and cursor to aid in pagination. */
  edges: Array<ConcreteOutcomesEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `ConcreteOutcome` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `ConcreteOutcome` edge in the connection. */
export type ConcreteOutcomesEdge = {
  __typename?: 'ConcreteOutcomesEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `ConcreteOutcome` at the end of the edge. */
  node?: Maybe<ConcreteOutcome>
}

/** Methods to use when ordering `ConcreteOutcome`. */
export enum ConcreteOutcomesOrderBy {
  Natural = 'NATURAL',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  OddsAsc = 'ODDS_ASC',
  OddsDesc = 'ODDS_DESC',
  OddsDecimalAsc = 'ODDS_DECIMAL_ASC',
  OddsDecimalDesc = 'ODDS_DECIMAL_DESC',
  RunnerNumberAsc = 'RUNNER_NUMBER_ASC',
  RunnerNumberDesc = 'RUNNER_NUMBER_DESC',
  HandicapAsc = 'HANDICAP_ASC',
  HandicapDesc = 'HANDICAP_DESC',
  DisplayOrderAsc = 'DISPLAY_ORDER_ASC',
  DisplayOrderDesc = 'DISPLAY_ORDER_DESC',
  IsHomeAsc = 'IS_HOME_ASC',
  IsHomeDesc = 'IS_HOME_DESC',
  ConcreteMarketIdAsc = 'CONCRETE_MARKET_ID_ASC',
  ConcreteMarketIdDesc = 'CONCRETE_MARKET_ID_DESC',
  ProcessedIdAsc = 'PROCESSED_ID_ASC',
  ProcessedIdDesc = 'PROCESSED_ID_DESC',
  FeedSupplierAsc = 'FEED_SUPPLIER_ASC',
  FeedSupplierDesc = 'FEED_SUPPLIER_DESC',
  LivePriceAvailableAsc = 'LIVE_PRICE_AVAILABLE_ASC',
  LivePriceAvailableDesc = 'LIVE_PRICE_AVAILABLE_DESC',
  StartingPriceAvailableAsc = 'STARTING_PRICE_AVAILABLE_ASC',
  StartingPriceAvailableDesc = 'STARTING_PRICE_AVAILABLE_DESC',
  StatusAsc = 'STATUS_ASC',
  StatusDesc = 'STATUS_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

/** All input for the `createEntityCategory1` mutation. */
export type CreateEntityCategory1Input = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  queueParam?: Maybe<QueueInput>
  metaParam?: Maybe<MetaInput>
}

/** The output of our `createEntityCategory1` mutation. */
export type CreateEntityCategory1Payload = {
  __typename?: 'CreateEntityCategory1Payload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  category1?: Maybe<Category1>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
  /** An edge for our `Category1`. May be used by Relay 1. */
  category1Edge?: Maybe<Category1sEdge>
}

/** The output of our `createEntityCategory1` mutation. */
export type CreateEntityCategory1PayloadCategory1EdgeArgs = {
  orderBy?: Maybe<Array<Category1sOrderBy>>
}

/** All input for the `createEntityCategory2` mutation. */
export type CreateEntityCategory2Input = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  queueParam?: Maybe<QueueInput>
  metaParam?: Maybe<MetaInput>
}

/** The output of our `createEntityCategory2` mutation. */
export type CreateEntityCategory2Payload = {
  __typename?: 'CreateEntityCategory2Payload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  category2?: Maybe<Category2>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
  /** Reads a single `Category1` that is related to this `Category2`. */
  category1?: Maybe<Category1>
  /** An edge for our `Category2`. May be used by Relay 1. */
  category2Edge?: Maybe<Category2sEdge>
}

/** The output of our `createEntityCategory2` mutation. */
export type CreateEntityCategory2PayloadCategory2EdgeArgs = {
  orderBy?: Maybe<Array<Category2sOrderBy>>
}

/** All input for the `createEntityCategory3` mutation. */
export type CreateEntityCategory3Input = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  queueParam?: Maybe<QueueInput>
  metaParam?: Maybe<MetaInput>
}

/** The output of our `createEntityCategory3` mutation. */
export type CreateEntityCategory3Payload = {
  __typename?: 'CreateEntityCategory3Payload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  category3?: Maybe<Category3>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
  /** Reads a single `Category2` that is related to this `Category3`. */
  category2?: Maybe<Category2>
  /** An edge for our `Category3`. May be used by Relay 1. */
  category3Edge?: Maybe<Category3sEdge>
}

/** The output of our `createEntityCategory3` mutation. */
export type CreateEntityCategory3PayloadCategory3EdgeArgs = {
  orderBy?: Maybe<Array<Category3sOrderBy>>
}

/** All input for the `createEntityEvent` mutation. */
export type CreateEntityEventInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  queueParam?: Maybe<QueueInput>
  metaParam?: Maybe<MetaInput>
  action?: Maybe<Scalars['String']>
}

/** The output of our `createEntityEvent` mutation. */
export type CreateEntityEventPayload = {
  __typename?: 'CreateEntityEventPayload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  event?: Maybe<Event>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
  /** Reads a single `Category3` that is related to this `Event`. */
  category3?: Maybe<Category3>
  /** An edge for our `Event`. May be used by Relay 1. */
  eventEdge?: Maybe<EventsEdge>
}

/** The output of our `createEntityEvent` mutation. */
export type CreateEntityEventPayloadEventEdgeArgs = {
  orderBy?: Maybe<Array<EventsOrderBy>>
}

/** All input for the `createEntityMarketCollection` mutation. */
export type CreateEntityMarketCollectionInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  queueParam?: Maybe<QueueInput>
  metaParam?: Maybe<MetaInput>
}

/** The output of our `createEntityMarketCollection` mutation. */
export type CreateEntityMarketCollectionPayload = {
  __typename?: 'CreateEntityMarketCollectionPayload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  marketCollection?: Maybe<MarketCollection>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
  /** An edge for our `MarketCollection`. May be used by Relay 1. */
  marketCollectionEdge?: Maybe<MarketCollectionsEdge>
}

/** The output of our `createEntityMarketCollection` mutation. */
export type CreateEntityMarketCollectionPayloadMarketCollectionEdgeArgs = {
  orderBy?: Maybe<Array<MarketCollectionsOrderBy>>
}

/** All input for the `createEntityMarket` mutation. */
export type CreateEntityMarketInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  queueParam?: Maybe<QueueInput>
  metaParam?: Maybe<MetaInput>
  action?: Maybe<Scalars['String']>
}

/** The output of our `createEntityMarket` mutation. */
export type CreateEntityMarketPayload = {
  __typename?: 'CreateEntityMarketPayload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  market?: Maybe<Market>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
  /** An edge for our `Market`. May be used by Relay 1. */
  marketEdge?: Maybe<MarketsEdge>
}

/** The output of our `createEntityMarket` mutation. */
export type CreateEntityMarketPayloadMarketEdgeArgs = {
  orderBy?: Maybe<Array<MarketsOrderBy>>
}

/** All input for the `createEntityOutcome` mutation. */
export type CreateEntityOutcomeInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  queueParam?: Maybe<QueueInput>
  metaParam?: Maybe<MetaInput>
  action?: Maybe<Scalars['String']>
}

/** The output of our `createEntityOutcome` mutation. */
export type CreateEntityOutcomePayload = {
  __typename?: 'CreateEntityOutcomePayload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  outcome?: Maybe<Outcome>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
  /** An edge for our `Outcome`. May be used by Relay 1. */
  outcomeEdge?: Maybe<OutcomesEdge>
}

/** The output of our `createEntityOutcome` mutation. */
export type CreateEntityOutcomePayloadOutcomeEdgeArgs = {
  orderBy?: Maybe<Array<OutcomesOrderBy>>
}

export type CrunchTmp = {
  __typename?: 'CrunchTmp'
  uniqueAppend?: Maybe<Scalars['String']>
  action?: Maybe<Scalars['String']>
  suggestRenameRules?: Maybe<Scalars['Boolean']>
}

export type Dimensions = {
  __typename?: 'Dimensions'
  width: Scalars['Int']
  height: Scalars['Int']
  scale: Scalars['Int']
  fontScale: Scalars['Int']
  lessThan: DimensionsSet
  greaterThan: DimensionsSet
  is: DimensionsSet
  orientation: Orientation
}

export type DimensionsInput = {
  width: Scalars['Int']
  height: Scalars['Int']
  scale: Scalars['Int']
  fontScale: Scalars['Int']
  lessThan: DimensionsSetInput
  greaterThan: DimensionsSetInput
  is: DimensionsSetInput
  orientation: Orientation
}

export type DimensionsSet = {
  __typename?: 'DimensionsSet'
  xs: Scalars['Boolean']
  sm: Scalars['Boolean']
  md: Scalars['Boolean']
  lg: Scalars['Boolean']
  xl: Scalars['Boolean']
  xxl: Scalars['Boolean']
}

export type DimensionsSetInput = {
  xs: Scalars['Boolean']
  sm: Scalars['Boolean']
  md: Scalars['Boolean']
  lg: Scalars['Boolean']
  xl: Scalars['Boolean']
  xxl: Scalars['Boolean']
}

export enum EntityNameEnum {
  Category1 = 'CATEGORY1',
  Category2 = 'CATEGORY2',
  Category3 = 'CATEGORY3',
  Event = 'EVENT',
  Market = 'MARKET',
  Outcome = 'OUTCOME',
  Marketcollection = 'MARKETCOLLECTION',
}

export type Event = Node & {
  __typename?: 'Event'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  id: Scalars['BigInt']
  name: Scalars['String']
  canonicalisedName: Scalars['String']
  canonicalisedNameUnique: Scalars['String']
  eventDate: Scalars['Datetime']
  type: EventTypeEnum
  category3Id: Scalars['BigInt']
  displayOrder: Scalars['Int']
  /** Reads a single `Category3` that is related to this `Event`. */
  category3?: Maybe<Category3>
  /** Reads a single `MetaEvent` that is related to this `Event`. */
  metaEventById?: Maybe<MetaEvent>
  /** Reads and enables pagination through a set of `MetaEvent`. */
  metaEventsById: MetaEventsConnection
  /** Reads and enables pagination through a set of `ConcreteEvent`. */
  concreteEventsByProcessedId: ConcreteEventsConnection
}

export type EventMetaEventsByIdArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaEventsOrderBy>>
  condition?: Maybe<MetaEventCondition>
}

export type EventConcreteEventsByProcessedIdArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<ConcreteEventsOrderBy>>
  condition?: Maybe<ConcreteEventCondition>
}

/** A condition to be used against `Event` object types. All fields are tested for equality and combined with a logical ‘and.’ */
export type EventCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `name` field. */
  name?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedName` field. */
  canonicalisedName?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedNameUnique` field. */
  canonicalisedNameUnique?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `eventDate` field. */
  eventDate?: Maybe<Scalars['Datetime']>
  /** Checks for equality with the object’s `type` field. */
  type?: Maybe<EventTypeEnum>
  /** Checks for equality with the object’s `category3Id` field. */
  category3Id?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `displayOrder` field. */
  displayOrder?: Maybe<Scalars['Int']>
}

/** A connection to a list of `Event` values. */
export type EventsConnection = {
  __typename?: 'EventsConnection'
  /** A list of `Event` objects. */
  nodes: Array<Maybe<Event>>
  /** A list of edges which contains the `Event` and cursor to aid in pagination. */
  edges: Array<EventsEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `Event` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `Event` edge in the connection. */
export type EventsEdge = {
  __typename?: 'EventsEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `Event` at the end of the edge. */
  node?: Maybe<Event>
}

/** Methods to use when ordering `Event`. */
export enum EventsOrderBy {
  Natural = 'NATURAL',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  NameAsc = 'NAME_ASC',
  NameDesc = 'NAME_DESC',
  CanonicalisedNameAsc = 'CANONICALISED_NAME_ASC',
  CanonicalisedNameDesc = 'CANONICALISED_NAME_DESC',
  CanonicalisedNameUniqueAsc = 'CANONICALISED_NAME_UNIQUE_ASC',
  CanonicalisedNameUniqueDesc = 'CANONICALISED_NAME_UNIQUE_DESC',
  EventDateAsc = 'EVENT_DATE_ASC',
  EventDateDesc = 'EVENT_DATE_DESC',
  TypeAsc = 'TYPE_ASC',
  TypeDesc = 'TYPE_DESC',
  Category3IdAsc = 'CATEGORY3_ID_ASC',
  Category3IdDesc = 'CATEGORY3_ID_DESC',
  DisplayOrderAsc = 'DISPLAY_ORDER_ASC',
  DisplayOrderDesc = 'DISPLAY_ORDER_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

export enum EventTypeEnum {
  Match_2Teams = 'MATCH_2_TEAMS',
  Outright = 'OUTRIGHT',
}

export type EventView = Node & {
  __typename?: 'EventView'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  id: Scalars['BigInt']
  displayed: Scalars['Boolean']
  url: Scalars['String']
  feedSupplier: FeedSupplierEnum
  status: StatusEnum
  name: Scalars['String']
  canonicalisedName: Scalars['String']
  canonicalisedNameUnique: Scalars['String']
  eventDate: Scalars['Datetime']
  type: EventTypeEnum
  category3Id: Scalars['BigInt']
  displayOrder: Scalars['Int']
  /** Reads and enables pagination through a set of `MarketView`. */
  markets: MarketViewsConnection
}

export type EventViewMarketsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MarketViewsOrderBy>>
  condition?: Maybe<MarketViewCondition>
}

/**
 * A condition to be used against `EventView` object types. All fields are tested
 * for equality and combined with a logical ‘and.’
 **/
export type EventViewCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `displayed` field. */
  displayed?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `url` field. */
  url?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `feedSupplier` field. */
  feedSupplier?: Maybe<FeedSupplierEnum>
  /** Checks for equality with the object’s `status` field. */
  status?: Maybe<StatusEnum>
  /** Checks for equality with the object’s `name` field. */
  name?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedName` field. */
  canonicalisedName?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedNameUnique` field. */
  canonicalisedNameUnique?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `eventDate` field. */
  eventDate?: Maybe<Scalars['Datetime']>
  /** Checks for equality with the object’s `type` field. */
  type?: Maybe<EventTypeEnum>
  /** Checks for equality with the object’s `category3Id` field. */
  category3Id?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `displayOrder` field. */
  displayOrder?: Maybe<Scalars['Int']>
}

/** A connection to a list of `EventView` values. */
export type EventViewsConnection = {
  __typename?: 'EventViewsConnection'
  /** A list of `EventView` objects. */
  nodes: Array<Maybe<EventView>>
  /** A list of edges which contains the `EventView` and cursor to aid in pagination. */
  edges: Array<EventViewsEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `EventView` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `EventView` edge in the connection. */
export type EventViewsEdge = {
  __typename?: 'EventViewsEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `EventView` at the end of the edge. */
  node?: Maybe<EventView>
}

/** Methods to use when ordering `EventView`. */
export enum EventViewsOrderBy {
  Natural = 'NATURAL',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  DisplayedAsc = 'DISPLAYED_ASC',
  DisplayedDesc = 'DISPLAYED_DESC',
  UrlAsc = 'URL_ASC',
  UrlDesc = 'URL_DESC',
  FeedSupplierAsc = 'FEED_SUPPLIER_ASC',
  FeedSupplierDesc = 'FEED_SUPPLIER_DESC',
  StatusAsc = 'STATUS_ASC',
  StatusDesc = 'STATUS_DESC',
  NameAsc = 'NAME_ASC',
  NameDesc = 'NAME_DESC',
  CanonicalisedNameAsc = 'CANONICALISED_NAME_ASC',
  CanonicalisedNameDesc = 'CANONICALISED_NAME_DESC',
  CanonicalisedNameUniqueAsc = 'CANONICALISED_NAME_UNIQUE_ASC',
  CanonicalisedNameUniqueDesc = 'CANONICALISED_NAME_UNIQUE_DESC',
  EventDateAsc = 'EVENT_DATE_ASC',
  EventDateDesc = 'EVENT_DATE_DESC',
  TypeAsc = 'TYPE_ASC',
  TypeDesc = 'TYPE_DESC',
  Category3IdAsc = 'CATEGORY3_ID_ASC',
  Category3IdDesc = 'CATEGORY3_ID_DESC',
  DisplayOrderAsc = 'DISPLAY_ORDER_ASC',
  DisplayOrderDesc = 'DISPLAY_ORDER_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

/** All input for the `extractCrunchTmp` mutation. */
export type ExtractCrunchTmpInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  jsonParam?: Maybe<Scalars['JSON']>
}

/** The output of our `extractCrunchTmp` mutation. */
export type ExtractCrunchTmpPayload = {
  __typename?: 'ExtractCrunchTmpPayload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  crunchTmp?: Maybe<CrunchTmp>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
}

/** All input for the `extractFields` mutation. */
export type ExtractFieldsInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  fieldsType?: Maybe<Scalars['String']>
  jsonParam?: Maybe<Scalars['JSON']>
}

/** The output of our `extractFields` mutation. */
export type ExtractFieldsPayload = {
  __typename?: 'ExtractFieldsPayload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  string?: Maybe<Scalars['String']>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
}

export enum FeedSupplierEnum {
  Coral = 'coral',
  Sky = 'sky',
  Boylesports = 'boylesports',
  Test1 = 'test1',
  Test2 = 'test2',
  Test3 = 'test3',
  Test4 = 'test4',
  Test5 = 'test5',
  Test6 = 'test6',
  Test7 = 'test7',
  Test8 = 'test8',
  Test9 = 'test9',
  Test10 = 'test10',
}

export enum LayoutSize {
  Small = 'SMALL',
  Large = 'LARGE',
}

export type Market = Node & {
  __typename?: 'Market'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  id: Scalars['BigInt']
  name: Scalars['String']
  canonicalisedName: Scalars['String']
  canonicalisedNameUnique: Scalars['String']
  /** Reads a single `MetaMarket` that is related to this `Market`. */
  metaMarketById?: Maybe<MetaMarket>
  /** Reads and enables pagination through a set of `MetaMarket`. */
  metaMarketsById: MetaMarketsConnection
  /** Reads and enables pagination through a set of `ConcreteMarket`. */
  concreteMarketsByProcessedId: ConcreteMarketsConnection
  /** Reads and enables pagination through a set of `MarketCollectionJoinMarket`. */
  marketCollectionJoinMarkets: MarketCollectionJoinMarketsConnection
}

export type MarketMetaMarketsByIdArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaMarketsOrderBy>>
  condition?: Maybe<MetaMarketCondition>
}

export type MarketConcreteMarketsByProcessedIdArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<ConcreteMarketsOrderBy>>
  condition?: Maybe<ConcreteMarketCondition>
}

export type MarketMarketCollectionJoinMarketsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MarketCollectionJoinMarketsOrderBy>>
  condition?: Maybe<MarketCollectionJoinMarketCondition>
}

export type MarketCollection = Node & {
  __typename?: 'MarketCollection'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  id: Scalars['BigInt']
  name: Scalars['String']
  canonicalisedName: Scalars['String']
  canonicalisedNameUnique: Scalars['String']
  displayOrder: Scalars['Int']
  /** Reads a single `MetaMarketCollection` that is related to this `MarketCollection`. */
  metaMarketCollectionById?: Maybe<MetaMarketCollection>
  /** Reads and enables pagination through a set of `MetaMarketCollection`. */
  metaMarketCollectionsById: MetaMarketCollectionsConnection
  /** Reads and enables pagination through a set of `MarketCollectionJoinMarket`. */
  marketCollectionJoinMarkets: MarketCollectionJoinMarketsConnection
}

export type MarketCollectionMetaMarketCollectionsByIdArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaMarketCollectionsOrderBy>>
  condition?: Maybe<MetaMarketCollectionCondition>
}

export type MarketCollectionMarketCollectionJoinMarketsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MarketCollectionJoinMarketsOrderBy>>
  condition?: Maybe<MarketCollectionJoinMarketCondition>
}

/**
 * A condition to be used against `MarketCollection` object types. All fields are
 * tested for equality and combined with a logical ‘and.’
 **/
export type MarketCollectionCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `name` field. */
  name?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedName` field. */
  canonicalisedName?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedNameUnique` field. */
  canonicalisedNameUnique?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `displayOrder` field. */
  displayOrder?: Maybe<Scalars['Int']>
}

export type MarketCollectionJoinMarket = Node & {
  __typename?: 'MarketCollectionJoinMarket'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  marketCollectionId: Scalars['BigInt']
  marketId: Scalars['BigInt']
  /** Reads a single `MarketCollection` that is related to this `MarketCollectionJoinMarket`. */
  marketCollection?: Maybe<MarketCollection>
  /** Reads a single `Market` that is related to this `MarketCollectionJoinMarket`. */
  market?: Maybe<Market>
}

/**
 * A condition to be used against `MarketCollectionJoinMarket` object types. All
 * fields are tested for equality and combined with a logical ‘and.’
 **/
export type MarketCollectionJoinMarketCondition = {
  /** Checks for equality with the object’s `marketCollectionId` field. */
  marketCollectionId?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `marketId` field. */
  marketId?: Maybe<Scalars['BigInt']>
}

/** A connection to a list of `MarketCollectionJoinMarket` values. */
export type MarketCollectionJoinMarketsConnection = {
  __typename?: 'MarketCollectionJoinMarketsConnection'
  /** A list of `MarketCollectionJoinMarket` objects. */
  nodes: Array<Maybe<MarketCollectionJoinMarket>>
  /** A list of edges which contains the `MarketCollectionJoinMarket` and cursor to aid in pagination. */
  edges: Array<MarketCollectionJoinMarketsEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `MarketCollectionJoinMarket` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `MarketCollectionJoinMarket` edge in the connection. */
export type MarketCollectionJoinMarketsEdge = {
  __typename?: 'MarketCollectionJoinMarketsEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `MarketCollectionJoinMarket` at the end of the edge. */
  node?: Maybe<MarketCollectionJoinMarket>
}

/** Methods to use when ordering `MarketCollectionJoinMarket`. */
export enum MarketCollectionJoinMarketsOrderBy {
  Natural = 'NATURAL',
  MarketCollectionIdAsc = 'MARKET_COLLECTION_ID_ASC',
  MarketCollectionIdDesc = 'MARKET_COLLECTION_ID_DESC',
  MarketIdAsc = 'MARKET_ID_ASC',
  MarketIdDesc = 'MARKET_ID_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

/** A connection to a list of `MarketCollection` values. */
export type MarketCollectionsConnection = {
  __typename?: 'MarketCollectionsConnection'
  /** A list of `MarketCollection` objects. */
  nodes: Array<Maybe<MarketCollection>>
  /** A list of edges which contains the `MarketCollection` and cursor to aid in pagination. */
  edges: Array<MarketCollectionsEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `MarketCollection` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `MarketCollection` edge in the connection. */
export type MarketCollectionsEdge = {
  __typename?: 'MarketCollectionsEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `MarketCollection` at the end of the edge. */
  node?: Maybe<MarketCollection>
}

/** Methods to use when ordering `MarketCollection`. */
export enum MarketCollectionsOrderBy {
  Natural = 'NATURAL',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  NameAsc = 'NAME_ASC',
  NameDesc = 'NAME_DESC',
  CanonicalisedNameAsc = 'CANONICALISED_NAME_ASC',
  CanonicalisedNameDesc = 'CANONICALISED_NAME_DESC',
  CanonicalisedNameUniqueAsc = 'CANONICALISED_NAME_UNIQUE_ASC',
  CanonicalisedNameUniqueDesc = 'CANONICALISED_NAME_UNIQUE_DESC',
  DisplayOrderAsc = 'DISPLAY_ORDER_ASC',
  DisplayOrderDesc = 'DISPLAY_ORDER_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

/** A condition to be used against `Market` object types. All fields are tested for equality and combined with a logical ‘and.’ */
export type MarketCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `name` field. */
  name?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedName` field. */
  canonicalisedName?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedNameUnique` field. */
  canonicalisedNameUnique?: Maybe<Scalars['String']>
}

/** A connection to a list of `Market` values. */
export type MarketsConnection = {
  __typename?: 'MarketsConnection'
  /** A list of `Market` objects. */
  nodes: Array<Maybe<Market>>
  /** A list of edges which contains the `Market` and cursor to aid in pagination. */
  edges: Array<MarketsEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `Market` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `Market` edge in the connection. */
export type MarketsEdge = {
  __typename?: 'MarketsEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `Market` at the end of the edge. */
  node?: Maybe<Market>
}

/** Methods to use when ordering `Market`. */
export enum MarketsOrderBy {
  Natural = 'NATURAL',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  NameAsc = 'NAME_ASC',
  NameDesc = 'NAME_DESC',
  CanonicalisedNameAsc = 'CANONICALISED_NAME_ASC',
  CanonicalisedNameDesc = 'CANONICALISED_NAME_DESC',
  CanonicalisedNameUniqueAsc = 'CANONICALISED_NAME_UNIQUE_ASC',
  CanonicalisedNameUniqueDesc = 'CANONICALISED_NAME_UNIQUE_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

export type MarketView = Node & {
  __typename?: 'MarketView'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  id: Scalars['BigInt']
  cashoutAvailable: Scalars['Boolean']
  eachwayAvailable: Scalars['Boolean']
  firstFourAvailable: Scalars['Boolean']
  forecastAvailable: Scalars['Boolean']
  guaranteedPriceAvailable: Scalars['Boolean']
  placeAvailable: Scalars['Boolean']
  quinellaAvailable: Scalars['Boolean']
  tricastAvailable: Scalars['Boolean']
  eventId: Scalars['BigInt']
  displayOrder: Scalars['Int']
  isDefault: Scalars['Boolean']
  feedSupplier: FeedSupplierEnum
  betInPlay: Scalars['Boolean']
  betTill: Scalars['Datetime']
  bettingStatus: BettingStatusEnum
  status: StatusEnum
  name: Scalars['String']
  canonicalisedName: Scalars['String']
  canonicalisedNameUnique: Scalars['String']
  /** Reads a single `EventView` that is related to this `MarketView`. */
  event?: Maybe<EventView>
  /** Reads and enables pagination through a set of `OutcomeView`. */
  outcomes: OutcomeViewsConnection
}

export type MarketViewOutcomesArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<OutcomeViewsOrderBy>>
  condition?: Maybe<OutcomeViewCondition>
}

/**
 * A condition to be used against `MarketView` object types. All fields are tested
 * for equality and combined with a logical ‘and.’
 **/
export type MarketViewCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `cashoutAvailable` field. */
  cashoutAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `eachwayAvailable` field. */
  eachwayAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `firstFourAvailable` field. */
  firstFourAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `forecastAvailable` field. */
  forecastAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `guaranteedPriceAvailable` field. */
  guaranteedPriceAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `placeAvailable` field. */
  placeAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `quinellaAvailable` field. */
  quinellaAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `tricastAvailable` field. */
  tricastAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `eventId` field. */
  eventId?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `displayOrder` field. */
  displayOrder?: Maybe<Scalars['Int']>
  /** Checks for equality with the object’s `isDefault` field. */
  isDefault?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `feedSupplier` field. */
  feedSupplier?: Maybe<FeedSupplierEnum>
  /** Checks for equality with the object’s `betInPlay` field. */
  betInPlay?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `betTill` field. */
  betTill?: Maybe<Scalars['Datetime']>
  /** Checks for equality with the object’s `bettingStatus` field. */
  bettingStatus?: Maybe<BettingStatusEnum>
  /** Checks for equality with the object’s `status` field. */
  status?: Maybe<StatusEnum>
  /** Checks for equality with the object’s `name` field. */
  name?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedName` field. */
  canonicalisedName?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedNameUnique` field. */
  canonicalisedNameUnique?: Maybe<Scalars['String']>
}

/** A connection to a list of `MarketView` values. */
export type MarketViewsConnection = {
  __typename?: 'MarketViewsConnection'
  /** A list of `MarketView` objects. */
  nodes: Array<Maybe<MarketView>>
  /** A list of edges which contains the `MarketView` and cursor to aid in pagination. */
  edges: Array<MarketViewsEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `MarketView` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `MarketView` edge in the connection. */
export type MarketViewsEdge = {
  __typename?: 'MarketViewsEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `MarketView` at the end of the edge. */
  node?: Maybe<MarketView>
}

/** Methods to use when ordering `MarketView`. */
export enum MarketViewsOrderBy {
  Natural = 'NATURAL',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  CashoutAvailableAsc = 'CASHOUT_AVAILABLE_ASC',
  CashoutAvailableDesc = 'CASHOUT_AVAILABLE_DESC',
  EachwayAvailableAsc = 'EACHWAY_AVAILABLE_ASC',
  EachwayAvailableDesc = 'EACHWAY_AVAILABLE_DESC',
  FirstFourAvailableAsc = 'FIRST_FOUR_AVAILABLE_ASC',
  FirstFourAvailableDesc = 'FIRST_FOUR_AVAILABLE_DESC',
  ForecastAvailableAsc = 'FORECAST_AVAILABLE_ASC',
  ForecastAvailableDesc = 'FORECAST_AVAILABLE_DESC',
  GuaranteedPriceAvailableAsc = 'GUARANTEED_PRICE_AVAILABLE_ASC',
  GuaranteedPriceAvailableDesc = 'GUARANTEED_PRICE_AVAILABLE_DESC',
  PlaceAvailableAsc = 'PLACE_AVAILABLE_ASC',
  PlaceAvailableDesc = 'PLACE_AVAILABLE_DESC',
  QuinellaAvailableAsc = 'QUINELLA_AVAILABLE_ASC',
  QuinellaAvailableDesc = 'QUINELLA_AVAILABLE_DESC',
  TricastAvailableAsc = 'TRICAST_AVAILABLE_ASC',
  TricastAvailableDesc = 'TRICAST_AVAILABLE_DESC',
  EventIdAsc = 'EVENT_ID_ASC',
  EventIdDesc = 'EVENT_ID_DESC',
  DisplayOrderAsc = 'DISPLAY_ORDER_ASC',
  DisplayOrderDesc = 'DISPLAY_ORDER_DESC',
  IsDefaultAsc = 'IS_DEFAULT_ASC',
  IsDefaultDesc = 'IS_DEFAULT_DESC',
  FeedSupplierAsc = 'FEED_SUPPLIER_ASC',
  FeedSupplierDesc = 'FEED_SUPPLIER_DESC',
  BetInPlayAsc = 'BET_IN_PLAY_ASC',
  BetInPlayDesc = 'BET_IN_PLAY_DESC',
  BetTillAsc = 'BET_TILL_ASC',
  BetTillDesc = 'BET_TILL_DESC',
  BettingStatusAsc = 'BETTING_STATUS_ASC',
  BettingStatusDesc = 'BETTING_STATUS_DESC',
  StatusAsc = 'STATUS_ASC',
  StatusDesc = 'STATUS_DESC',
  NameAsc = 'NAME_ASC',
  NameDesc = 'NAME_DESC',
  CanonicalisedNameAsc = 'CANONICALISED_NAME_ASC',
  CanonicalisedNameDesc = 'CANONICALISED_NAME_DESC',
  CanonicalisedNameUniqueAsc = 'CANONICALISED_NAME_UNIQUE_ASC',
  CanonicalisedNameUniqueDesc = 'CANONICALISED_NAME_UNIQUE_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

export type Meta = {
  __typename?: 'Meta'
  id?: Maybe<Scalars['BigInt']>
  name?: Maybe<Scalars['String']>
  canonicalisedName?: Maybe<Scalars['String']>
  canonicalisedNameUnique?: Maybe<Scalars['String']>
  feedSupplier?: Maybe<Scalars['String']>
  runId?: Maybe<Scalars['UUID']>
  url?: Maybe<Scalars['String']>
}

export type MetaCategory1 = Node & {
  __typename?: 'MetaCategory1'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  feedId: Scalars['BigInt']
  runId: Scalars['UUID']
  feedSupplier: FeedSupplierEnum
  url: Scalars['String']
  id: Scalars['BigInt']
  /** Reads a single `Category1` that is related to this `MetaCategory1`. */
  category1ById?: Maybe<Category1>
}

/**
 * A condition to be used against `MetaCategory1` object types. All fields are
 * tested for equality and combined with a logical ‘and.’
 **/
export type MetaCategory1Condition = {
  /** Checks for equality with the object’s `feedId` field. */
  feedId?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `runId` field. */
  runId?: Maybe<Scalars['UUID']>
  /** Checks for equality with the object’s `feedSupplier` field. */
  feedSupplier?: Maybe<FeedSupplierEnum>
  /** Checks for equality with the object’s `url` field. */
  url?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
}

/** A connection to a list of `MetaCategory1` values. */
export type MetaCategory1sConnection = {
  __typename?: 'MetaCategory1sConnection'
  /** A list of `MetaCategory1` objects. */
  nodes: Array<Maybe<MetaCategory1>>
  /** A list of edges which contains the `MetaCategory1` and cursor to aid in pagination. */
  edges: Array<MetaCategory1sEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `MetaCategory1` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `MetaCategory1` edge in the connection. */
export type MetaCategory1sEdge = {
  __typename?: 'MetaCategory1sEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `MetaCategory1` at the end of the edge. */
  node?: Maybe<MetaCategory1>
}

/** Methods to use when ordering `MetaCategory1`. */
export enum MetaCategory1sOrderBy {
  Natural = 'NATURAL',
  FeedIdAsc = 'FEED_ID_ASC',
  FeedIdDesc = 'FEED_ID_DESC',
  RunIdAsc = 'RUN_ID_ASC',
  RunIdDesc = 'RUN_ID_DESC',
  FeedSupplierAsc = 'FEED_SUPPLIER_ASC',
  FeedSupplierDesc = 'FEED_SUPPLIER_DESC',
  UrlAsc = 'URL_ASC',
  UrlDesc = 'URL_DESC',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

export type MetaCategory2 = Node & {
  __typename?: 'MetaCategory2'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  feedId: Scalars['BigInt']
  runId: Scalars['UUID']
  feedSupplier: FeedSupplierEnum
  url: Scalars['String']
  id: Scalars['BigInt']
  /** Reads a single `Category2` that is related to this `MetaCategory2`. */
  category2ById?: Maybe<Category2>
}

/**
 * A condition to be used against `MetaCategory2` object types. All fields are
 * tested for equality and combined with a logical ‘and.’
 **/
export type MetaCategory2Condition = {
  /** Checks for equality with the object’s `feedId` field. */
  feedId?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `runId` field. */
  runId?: Maybe<Scalars['UUID']>
  /** Checks for equality with the object’s `feedSupplier` field. */
  feedSupplier?: Maybe<FeedSupplierEnum>
  /** Checks for equality with the object’s `url` field. */
  url?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
}

/** A connection to a list of `MetaCategory2` values. */
export type MetaCategory2sConnection = {
  __typename?: 'MetaCategory2sConnection'
  /** A list of `MetaCategory2` objects. */
  nodes: Array<Maybe<MetaCategory2>>
  /** A list of edges which contains the `MetaCategory2` and cursor to aid in pagination. */
  edges: Array<MetaCategory2sEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `MetaCategory2` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `MetaCategory2` edge in the connection. */
export type MetaCategory2sEdge = {
  __typename?: 'MetaCategory2sEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `MetaCategory2` at the end of the edge. */
  node?: Maybe<MetaCategory2>
}

/** Methods to use when ordering `MetaCategory2`. */
export enum MetaCategory2sOrderBy {
  Natural = 'NATURAL',
  FeedIdAsc = 'FEED_ID_ASC',
  FeedIdDesc = 'FEED_ID_DESC',
  RunIdAsc = 'RUN_ID_ASC',
  RunIdDesc = 'RUN_ID_DESC',
  FeedSupplierAsc = 'FEED_SUPPLIER_ASC',
  FeedSupplierDesc = 'FEED_SUPPLIER_DESC',
  UrlAsc = 'URL_ASC',
  UrlDesc = 'URL_DESC',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

export type MetaCategory3 = Node & {
  __typename?: 'MetaCategory3'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  feedId: Scalars['BigInt']
  runId: Scalars['UUID']
  feedSupplier: FeedSupplierEnum
  url: Scalars['String']
  id: Scalars['BigInt']
  /** Reads a single `Category3` that is related to this `MetaCategory3`. */
  category3ById?: Maybe<Category3>
}

/**
 * A condition to be used against `MetaCategory3` object types. All fields are
 * tested for equality and combined with a logical ‘and.’
 **/
export type MetaCategory3Condition = {
  /** Checks for equality with the object’s `feedId` field. */
  feedId?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `runId` field. */
  runId?: Maybe<Scalars['UUID']>
  /** Checks for equality with the object’s `feedSupplier` field. */
  feedSupplier?: Maybe<FeedSupplierEnum>
  /** Checks for equality with the object’s `url` field. */
  url?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
}

/** A connection to a list of `MetaCategory3` values. */
export type MetaCategory3sConnection = {
  __typename?: 'MetaCategory3sConnection'
  /** A list of `MetaCategory3` objects. */
  nodes: Array<Maybe<MetaCategory3>>
  /** A list of edges which contains the `MetaCategory3` and cursor to aid in pagination. */
  edges: Array<MetaCategory3sEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `MetaCategory3` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `MetaCategory3` edge in the connection. */
export type MetaCategory3sEdge = {
  __typename?: 'MetaCategory3sEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `MetaCategory3` at the end of the edge. */
  node?: Maybe<MetaCategory3>
}

/** Methods to use when ordering `MetaCategory3`. */
export enum MetaCategory3sOrderBy {
  Natural = 'NATURAL',
  FeedIdAsc = 'FEED_ID_ASC',
  FeedIdDesc = 'FEED_ID_DESC',
  RunIdAsc = 'RUN_ID_ASC',
  RunIdDesc = 'RUN_ID_DESC',
  FeedSupplierAsc = 'FEED_SUPPLIER_ASC',
  FeedSupplierDesc = 'FEED_SUPPLIER_DESC',
  UrlAsc = 'URL_ASC',
  UrlDesc = 'URL_DESC',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

export type MetaConcreteEvent = Node & {
  __typename?: 'MetaConcreteEvent'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  feedId: Scalars['BigInt']
  runId: Scalars['UUID']
  feedSupplier: FeedSupplierEnum
  url: Scalars['String']
  id: Scalars['BigInt']
  /** Reads a single `ConcreteEvent` that is related to this `MetaConcreteEvent`. */
  concreteEventById?: Maybe<ConcreteEvent>
}

/**
 * A condition to be used against `MetaConcreteEvent` object types. All fields are
 * tested for equality and combined with a logical ‘and.’
 **/
export type MetaConcreteEventCondition = {
  /** Checks for equality with the object’s `feedId` field. */
  feedId?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `runId` field. */
  runId?: Maybe<Scalars['UUID']>
  /** Checks for equality with the object’s `feedSupplier` field. */
  feedSupplier?: Maybe<FeedSupplierEnum>
  /** Checks for equality with the object’s `url` field. */
  url?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
}

/** A connection to a list of `MetaConcreteEvent` values. */
export type MetaConcreteEventsConnection = {
  __typename?: 'MetaConcreteEventsConnection'
  /** A list of `MetaConcreteEvent` objects. */
  nodes: Array<Maybe<MetaConcreteEvent>>
  /** A list of edges which contains the `MetaConcreteEvent` and cursor to aid in pagination. */
  edges: Array<MetaConcreteEventsEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `MetaConcreteEvent` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `MetaConcreteEvent` edge in the connection. */
export type MetaConcreteEventsEdge = {
  __typename?: 'MetaConcreteEventsEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `MetaConcreteEvent` at the end of the edge. */
  node?: Maybe<MetaConcreteEvent>
}

/** Methods to use when ordering `MetaConcreteEvent`. */
export enum MetaConcreteEventsOrderBy {
  Natural = 'NATURAL',
  FeedIdAsc = 'FEED_ID_ASC',
  FeedIdDesc = 'FEED_ID_DESC',
  RunIdAsc = 'RUN_ID_ASC',
  RunIdDesc = 'RUN_ID_DESC',
  FeedSupplierAsc = 'FEED_SUPPLIER_ASC',
  FeedSupplierDesc = 'FEED_SUPPLIER_DESC',
  UrlAsc = 'URL_ASC',
  UrlDesc = 'URL_DESC',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

export type MetaConcreteMarket = Node & {
  __typename?: 'MetaConcreteMarket'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  feedId: Scalars['BigInt']
  runId: Scalars['UUID']
  feedSupplier: FeedSupplierEnum
  url: Scalars['String']
  id: Scalars['BigInt']
  /** Reads a single `ConcreteMarket` that is related to this `MetaConcreteMarket`. */
  concreteMarketById?: Maybe<ConcreteMarket>
}

/**
 * A condition to be used against `MetaConcreteMarket` object types. All fields are
 * tested for equality and combined with a logical ‘and.’
 **/
export type MetaConcreteMarketCondition = {
  /** Checks for equality with the object’s `feedId` field. */
  feedId?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `runId` field. */
  runId?: Maybe<Scalars['UUID']>
  /** Checks for equality with the object’s `feedSupplier` field. */
  feedSupplier?: Maybe<FeedSupplierEnum>
  /** Checks for equality with the object’s `url` field. */
  url?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
}

/** A connection to a list of `MetaConcreteMarket` values. */
export type MetaConcreteMarketsConnection = {
  __typename?: 'MetaConcreteMarketsConnection'
  /** A list of `MetaConcreteMarket` objects. */
  nodes: Array<Maybe<MetaConcreteMarket>>
  /** A list of edges which contains the `MetaConcreteMarket` and cursor to aid in pagination. */
  edges: Array<MetaConcreteMarketsEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `MetaConcreteMarket` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `MetaConcreteMarket` edge in the connection. */
export type MetaConcreteMarketsEdge = {
  __typename?: 'MetaConcreteMarketsEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `MetaConcreteMarket` at the end of the edge. */
  node?: Maybe<MetaConcreteMarket>
}

/** Methods to use when ordering `MetaConcreteMarket`. */
export enum MetaConcreteMarketsOrderBy {
  Natural = 'NATURAL',
  FeedIdAsc = 'FEED_ID_ASC',
  FeedIdDesc = 'FEED_ID_DESC',
  RunIdAsc = 'RUN_ID_ASC',
  RunIdDesc = 'RUN_ID_DESC',
  FeedSupplierAsc = 'FEED_SUPPLIER_ASC',
  FeedSupplierDesc = 'FEED_SUPPLIER_DESC',
  UrlAsc = 'URL_ASC',
  UrlDesc = 'URL_DESC',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

export type MetaConcreteOutcome = Node & {
  __typename?: 'MetaConcreteOutcome'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  feedId: Scalars['BigInt']
  runId: Scalars['UUID']
  feedSupplier: FeedSupplierEnum
  url: Scalars['String']
  id: Scalars['BigInt']
  /** Reads a single `ConcreteOutcome` that is related to this `MetaConcreteOutcome`. */
  concreteOutcomeById?: Maybe<ConcreteOutcome>
}

/**
 * A condition to be used against `MetaConcreteOutcome` object types. All fields
 * are tested for equality and combined with a logical ‘and.’
 **/
export type MetaConcreteOutcomeCondition = {
  /** Checks for equality with the object’s `feedId` field. */
  feedId?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `runId` field. */
  runId?: Maybe<Scalars['UUID']>
  /** Checks for equality with the object’s `feedSupplier` field. */
  feedSupplier?: Maybe<FeedSupplierEnum>
  /** Checks for equality with the object’s `url` field. */
  url?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
}

/** A connection to a list of `MetaConcreteOutcome` values. */
export type MetaConcreteOutcomesConnection = {
  __typename?: 'MetaConcreteOutcomesConnection'
  /** A list of `MetaConcreteOutcome` objects. */
  nodes: Array<Maybe<MetaConcreteOutcome>>
  /** A list of edges which contains the `MetaConcreteOutcome` and cursor to aid in pagination. */
  edges: Array<MetaConcreteOutcomesEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `MetaConcreteOutcome` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `MetaConcreteOutcome` edge in the connection. */
export type MetaConcreteOutcomesEdge = {
  __typename?: 'MetaConcreteOutcomesEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `MetaConcreteOutcome` at the end of the edge. */
  node?: Maybe<MetaConcreteOutcome>
}

/** Methods to use when ordering `MetaConcreteOutcome`. */
export enum MetaConcreteOutcomesOrderBy {
  Natural = 'NATURAL',
  FeedIdAsc = 'FEED_ID_ASC',
  FeedIdDesc = 'FEED_ID_DESC',
  RunIdAsc = 'RUN_ID_ASC',
  RunIdDesc = 'RUN_ID_DESC',
  FeedSupplierAsc = 'FEED_SUPPLIER_ASC',
  FeedSupplierDesc = 'FEED_SUPPLIER_DESC',
  UrlAsc = 'URL_ASC',
  UrlDesc = 'URL_DESC',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

export type MetaEvent = Node & {
  __typename?: 'MetaEvent'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  feedId: Scalars['BigInt']
  runId: Scalars['UUID']
  feedSupplier: FeedSupplierEnum
  url: Scalars['String']
  id: Scalars['BigInt']
  /** Reads a single `Event` that is related to this `MetaEvent`. */
  eventById?: Maybe<Event>
}

/**
 * A condition to be used against `MetaEvent` object types. All fields are tested
 * for equality and combined with a logical ‘and.’
 **/
export type MetaEventCondition = {
  /** Checks for equality with the object’s `feedId` field. */
  feedId?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `runId` field. */
  runId?: Maybe<Scalars['UUID']>
  /** Checks for equality with the object’s `feedSupplier` field. */
  feedSupplier?: Maybe<FeedSupplierEnum>
  /** Checks for equality with the object’s `url` field. */
  url?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
}

/** A connection to a list of `MetaEvent` values. */
export type MetaEventsConnection = {
  __typename?: 'MetaEventsConnection'
  /** A list of `MetaEvent` objects. */
  nodes: Array<Maybe<MetaEvent>>
  /** A list of edges which contains the `MetaEvent` and cursor to aid in pagination. */
  edges: Array<MetaEventsEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `MetaEvent` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `MetaEvent` edge in the connection. */
export type MetaEventsEdge = {
  __typename?: 'MetaEventsEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `MetaEvent` at the end of the edge. */
  node?: Maybe<MetaEvent>
}

/** Methods to use when ordering `MetaEvent`. */
export enum MetaEventsOrderBy {
  Natural = 'NATURAL',
  FeedIdAsc = 'FEED_ID_ASC',
  FeedIdDesc = 'FEED_ID_DESC',
  RunIdAsc = 'RUN_ID_ASC',
  RunIdDesc = 'RUN_ID_DESC',
  FeedSupplierAsc = 'FEED_SUPPLIER_ASC',
  FeedSupplierDesc = 'FEED_SUPPLIER_DESC',
  UrlAsc = 'URL_ASC',
  UrlDesc = 'URL_DESC',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

/** An input for mutations affecting `Meta` */
export type MetaInput = {
  id?: Maybe<Scalars['BigInt']>
  name?: Maybe<Scalars['String']>
  canonicalisedName?: Maybe<Scalars['String']>
  canonicalisedNameUnique?: Maybe<Scalars['String']>
  feedSupplier?: Maybe<Scalars['String']>
  runId?: Maybe<Scalars['UUID']>
  url?: Maybe<Scalars['String']>
}

export type MetaMarket = Node & {
  __typename?: 'MetaMarket'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  feedId: Scalars['BigInt']
  runId: Scalars['UUID']
  feedSupplier: FeedSupplierEnum
  url: Scalars['String']
  id: Scalars['BigInt']
  /** Reads a single `Market` that is related to this `MetaMarket`. */
  marketById?: Maybe<Market>
}

export type MetaMarketCollection = Node & {
  __typename?: 'MetaMarketCollection'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  feedId: Scalars['BigInt']
  runId: Scalars['UUID']
  feedSupplier: FeedSupplierEnum
  url: Scalars['String']
  id: Scalars['BigInt']
  /** Reads a single `MarketCollection` that is related to this `MetaMarketCollection`. */
  marketCollectionById?: Maybe<MarketCollection>
}

/**
 * A condition to be used against `MetaMarketCollection` object types. All fields
 * are tested for equality and combined with a logical ‘and.’
 **/
export type MetaMarketCollectionCondition = {
  /** Checks for equality with the object’s `feedId` field. */
  feedId?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `runId` field. */
  runId?: Maybe<Scalars['UUID']>
  /** Checks for equality with the object’s `feedSupplier` field. */
  feedSupplier?: Maybe<FeedSupplierEnum>
  /** Checks for equality with the object’s `url` field. */
  url?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
}

/** A connection to a list of `MetaMarketCollection` values. */
export type MetaMarketCollectionsConnection = {
  __typename?: 'MetaMarketCollectionsConnection'
  /** A list of `MetaMarketCollection` objects. */
  nodes: Array<Maybe<MetaMarketCollection>>
  /** A list of edges which contains the `MetaMarketCollection` and cursor to aid in pagination. */
  edges: Array<MetaMarketCollectionsEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `MetaMarketCollection` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `MetaMarketCollection` edge in the connection. */
export type MetaMarketCollectionsEdge = {
  __typename?: 'MetaMarketCollectionsEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `MetaMarketCollection` at the end of the edge. */
  node?: Maybe<MetaMarketCollection>
}

/** Methods to use when ordering `MetaMarketCollection`. */
export enum MetaMarketCollectionsOrderBy {
  Natural = 'NATURAL',
  FeedIdAsc = 'FEED_ID_ASC',
  FeedIdDesc = 'FEED_ID_DESC',
  RunIdAsc = 'RUN_ID_ASC',
  RunIdDesc = 'RUN_ID_DESC',
  FeedSupplierAsc = 'FEED_SUPPLIER_ASC',
  FeedSupplierDesc = 'FEED_SUPPLIER_DESC',
  UrlAsc = 'URL_ASC',
  UrlDesc = 'URL_DESC',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

/**
 * A condition to be used against `MetaMarket` object types. All fields are tested
 * for equality and combined with a logical ‘and.’
 **/
export type MetaMarketCondition = {
  /** Checks for equality with the object’s `feedId` field. */
  feedId?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `runId` field. */
  runId?: Maybe<Scalars['UUID']>
  /** Checks for equality with the object’s `feedSupplier` field. */
  feedSupplier?: Maybe<FeedSupplierEnum>
  /** Checks for equality with the object’s `url` field. */
  url?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
}

/** A connection to a list of `MetaMarket` values. */
export type MetaMarketsConnection = {
  __typename?: 'MetaMarketsConnection'
  /** A list of `MetaMarket` objects. */
  nodes: Array<Maybe<MetaMarket>>
  /** A list of edges which contains the `MetaMarket` and cursor to aid in pagination. */
  edges: Array<MetaMarketsEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `MetaMarket` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `MetaMarket` edge in the connection. */
export type MetaMarketsEdge = {
  __typename?: 'MetaMarketsEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `MetaMarket` at the end of the edge. */
  node?: Maybe<MetaMarket>
}

/** Methods to use when ordering `MetaMarket`. */
export enum MetaMarketsOrderBy {
  Natural = 'NATURAL',
  FeedIdAsc = 'FEED_ID_ASC',
  FeedIdDesc = 'FEED_ID_DESC',
  RunIdAsc = 'RUN_ID_ASC',
  RunIdDesc = 'RUN_ID_DESC',
  FeedSupplierAsc = 'FEED_SUPPLIER_ASC',
  FeedSupplierDesc = 'FEED_SUPPLIER_DESC',
  UrlAsc = 'URL_ASC',
  UrlDesc = 'URL_DESC',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

export type MetaOutcome = Node & {
  __typename?: 'MetaOutcome'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  feedId: Scalars['BigInt']
  runId: Scalars['UUID']
  feedSupplier: FeedSupplierEnum
  url: Scalars['String']
  id: Scalars['BigInt']
  /** Reads a single `Outcome` that is related to this `MetaOutcome`. */
  outcomeById?: Maybe<Outcome>
}

/**
 * A condition to be used against `MetaOutcome` object types. All fields are tested
 * for equality and combined with a logical ‘and.’
 **/
export type MetaOutcomeCondition = {
  /** Checks for equality with the object’s `feedId` field. */
  feedId?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `runId` field. */
  runId?: Maybe<Scalars['UUID']>
  /** Checks for equality with the object’s `feedSupplier` field. */
  feedSupplier?: Maybe<FeedSupplierEnum>
  /** Checks for equality with the object’s `url` field. */
  url?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
}

/** A connection to a list of `MetaOutcome` values. */
export type MetaOutcomesConnection = {
  __typename?: 'MetaOutcomesConnection'
  /** A list of `MetaOutcome` objects. */
  nodes: Array<Maybe<MetaOutcome>>
  /** A list of edges which contains the `MetaOutcome` and cursor to aid in pagination. */
  edges: Array<MetaOutcomesEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `MetaOutcome` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `MetaOutcome` edge in the connection. */
export type MetaOutcomesEdge = {
  __typename?: 'MetaOutcomesEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `MetaOutcome` at the end of the edge. */
  node?: Maybe<MetaOutcome>
}

/** Methods to use when ordering `MetaOutcome`. */
export enum MetaOutcomesOrderBy {
  Natural = 'NATURAL',
  FeedIdAsc = 'FEED_ID_ASC',
  FeedIdDesc = 'FEED_ID_DESC',
  RunIdAsc = 'RUN_ID_ASC',
  RunIdDesc = 'RUN_ID_DESC',
  FeedSupplierAsc = 'FEED_SUPPLIER_ASC',
  FeedSupplierDesc = 'FEED_SUPPLIER_DESC',
  UrlAsc = 'URL_ASC',
  UrlDesc = 'URL_DESC',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

/** The root mutation type which contains root level fields which mutate data. */
export type Mutation = {
  __typename?: 'Mutation'
  applyCanonicalise?: Maybe<ApplyCanonicalisePayload>
  applyRenaming?: Maybe<ApplyRenamingPayload>
  createEntityCategory1?: Maybe<CreateEntityCategory1Payload>
  createEntityCategory2?: Maybe<CreateEntityCategory2Payload>
  createEntityCategory3?: Maybe<CreateEntityCategory3Payload>
  createEntityEvent?: Maybe<CreateEntityEventPayload>
  createEntityMarket?: Maybe<CreateEntityMarketPayload>
  createEntityMarketCollection?: Maybe<CreateEntityMarketCollectionPayload>
  createEntityOutcome?: Maybe<CreateEntityOutcomePayload>
  extractCrunchTmp?: Maybe<ExtractCrunchTmpPayload>
  extractFields?: Maybe<ExtractFieldsPayload>
  processEntityCategory1?: Maybe<ProcessEntityCategory1Payload>
  processEntityCategory2?: Maybe<ProcessEntityCategory2Payload>
  processEntityCategory3?: Maybe<ProcessEntityCategory3Payload>
  processEntityEvent?: Maybe<ProcessEntityEventPayload>
  processEntityMarket?: Maybe<ProcessEntityMarketPayload>
  processEntityMarketCollection?: Maybe<ProcessEntityMarketCollectionPayload>
  processEntityOutcome?: Maybe<ProcessEntityOutcomePayload>
  processQueue?: Maybe<ProcessQueuePayload>
  retrieveConcreteEntity?: Maybe<RetrieveConcreteEntityPayload>
  retrieveProcessedEntityByCanonicalised?: Maybe<RetrieveProcessedEntityByCanonicalisedPayload>
  retrieveProcessedEntityWithConcrete?: Maybe<RetrieveProcessedEntityWithConcretePayload>
  retrieveProcessedEntityWithoutConcrete?: Maybe<RetrieveProcessedEntityWithoutConcretePayload>
  updateDimensions?: Maybe<Dimensions>
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationApplyCanonicaliseArgs = {
  input: ApplyCanonicaliseInput
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationApplyRenamingArgs = {
  input: ApplyRenamingInput
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationCreateEntityCategory1Args = {
  input: CreateEntityCategory1Input
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationCreateEntityCategory2Args = {
  input: CreateEntityCategory2Input
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationCreateEntityCategory3Args = {
  input: CreateEntityCategory3Input
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationCreateEntityEventArgs = {
  input: CreateEntityEventInput
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationCreateEntityMarketArgs = {
  input: CreateEntityMarketInput
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationCreateEntityMarketCollectionArgs = {
  input: CreateEntityMarketCollectionInput
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationCreateEntityOutcomeArgs = {
  input: CreateEntityOutcomeInput
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationExtractCrunchTmpArgs = {
  input: ExtractCrunchTmpInput
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationExtractFieldsArgs = {
  input: ExtractFieldsInput
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationProcessEntityCategory1Args = {
  input: ProcessEntityCategory1Input
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationProcessEntityCategory2Args = {
  input: ProcessEntityCategory2Input
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationProcessEntityCategory3Args = {
  input: ProcessEntityCategory3Input
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationProcessEntityEventArgs = {
  input: ProcessEntityEventInput
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationProcessEntityMarketArgs = {
  input: ProcessEntityMarketInput
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationProcessEntityMarketCollectionArgs = {
  input: ProcessEntityMarketCollectionInput
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationProcessEntityOutcomeArgs = {
  input: ProcessEntityOutcomeInput
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationProcessQueueArgs = {
  input: ProcessQueueInput
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationRetrieveConcreteEntityArgs = {
  input: RetrieveConcreteEntityInput
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationRetrieveProcessedEntityByCanonicalisedArgs = {
  input: RetrieveProcessedEntityByCanonicalisedInput
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationRetrieveProcessedEntityWithConcreteArgs = {
  input: RetrieveProcessedEntityWithConcreteInput
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationRetrieveProcessedEntityWithoutConcreteArgs = {
  input: RetrieveProcessedEntityWithoutConcreteInput
}

/** The root mutation type which contains root level fields which mutate data. */
export type MutationUpdateDimensionsArgs = {
  dimensionsInput: DimensionsInput
}

/** An object with a globally unique `ID`. */
export type Node = {
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
}

export enum Orientation {
  Portrait = 'PORTRAIT',
  Landscape = 'LANDSCAPE',
}

export type Outcome = Node & {
  __typename?: 'Outcome'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  id: Scalars['BigInt']
  name: Scalars['String']
  canonicalisedName: Scalars['String']
  canonicalisedNameUnique: Scalars['String']
  /** Reads a single `MetaOutcome` that is related to this `Outcome`. */
  metaOutcomeById?: Maybe<MetaOutcome>
  /** Reads and enables pagination through a set of `MetaOutcome`. */
  metaOutcomesById: MetaOutcomesConnection
  /** Reads and enables pagination through a set of `ConcreteOutcome`. */
  concreteOutcomesByProcessedId: ConcreteOutcomesConnection
}

export type OutcomeMetaOutcomesByIdArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaOutcomesOrderBy>>
  condition?: Maybe<MetaOutcomeCondition>
}

export type OutcomeConcreteOutcomesByProcessedIdArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<ConcreteOutcomesOrderBy>>
  condition?: Maybe<ConcreteOutcomeCondition>
}

/** A condition to be used against `Outcome` object types. All fields are tested for equality and combined with a logical ‘and.’ */
export type OutcomeCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `name` field. */
  name?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedName` field. */
  canonicalisedName?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedNameUnique` field. */
  canonicalisedNameUnique?: Maybe<Scalars['String']>
}

/** A connection to a list of `Outcome` values. */
export type OutcomesConnection = {
  __typename?: 'OutcomesConnection'
  /** A list of `Outcome` objects. */
  nodes: Array<Maybe<Outcome>>
  /** A list of edges which contains the `Outcome` and cursor to aid in pagination. */
  edges: Array<OutcomesEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `Outcome` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `Outcome` edge in the connection. */
export type OutcomesEdge = {
  __typename?: 'OutcomesEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `Outcome` at the end of the edge. */
  node?: Maybe<Outcome>
}

/** Methods to use when ordering `Outcome`. */
export enum OutcomesOrderBy {
  Natural = 'NATURAL',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  NameAsc = 'NAME_ASC',
  NameDesc = 'NAME_DESC',
  CanonicalisedNameAsc = 'CANONICALISED_NAME_ASC',
  CanonicalisedNameDesc = 'CANONICALISED_NAME_DESC',
  CanonicalisedNameUniqueAsc = 'CANONICALISED_NAME_UNIQUE_ASC',
  CanonicalisedNameUniqueDesc = 'CANONICALISED_NAME_UNIQUE_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

export type OutcomeView = Node & {
  __typename?: 'OutcomeView'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  id: Scalars['BigInt']
  odds: Scalars['String']
  oddsDecimal: Scalars['Float']
  handicap: Scalars['String']
  displayOrder: Scalars['Int']
  isHome: Scalars['Boolean']
  marketId: Scalars['BigInt']
  feedSupplier: FeedSupplierEnum
  livePriceAvailable: Scalars['Boolean']
  startingPriceAvailable: Scalars['Boolean']
  status: StatusEnum
  name: Scalars['String']
  canonicalisedName: Scalars['String']
  canonicalisedNameUnique: Scalars['String']
  /** Reads a single `MarketView` that is related to this `OutcomeView`. */
  market?: Maybe<MarketView>
}

/**
 * A condition to be used against `OutcomeView` object types. All fields are tested
 * for equality and combined with a logical ‘and.’
 **/
export type OutcomeViewCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `odds` field. */
  odds?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `oddsDecimal` field. */
  oddsDecimal?: Maybe<Scalars['Float']>
  /** Checks for equality with the object’s `handicap` field. */
  handicap?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `displayOrder` field. */
  displayOrder?: Maybe<Scalars['Int']>
  /** Checks for equality with the object’s `isHome` field. */
  isHome?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `marketId` field. */
  marketId?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `feedSupplier` field. */
  feedSupplier?: Maybe<FeedSupplierEnum>
  /** Checks for equality with the object’s `livePriceAvailable` field. */
  livePriceAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `startingPriceAvailable` field. */
  startingPriceAvailable?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `status` field. */
  status?: Maybe<StatusEnum>
  /** Checks for equality with the object’s `name` field. */
  name?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedName` field. */
  canonicalisedName?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `canonicalisedNameUnique` field. */
  canonicalisedNameUnique?: Maybe<Scalars['String']>
}

/** A connection to a list of `OutcomeView` values. */
export type OutcomeViewsConnection = {
  __typename?: 'OutcomeViewsConnection'
  /** A list of `OutcomeView` objects. */
  nodes: Array<Maybe<OutcomeView>>
  /** A list of edges which contains the `OutcomeView` and cursor to aid in pagination. */
  edges: Array<OutcomeViewsEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `OutcomeView` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `OutcomeView` edge in the connection. */
export type OutcomeViewsEdge = {
  __typename?: 'OutcomeViewsEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `OutcomeView` at the end of the edge. */
  node?: Maybe<OutcomeView>
}

/** Methods to use when ordering `OutcomeView`. */
export enum OutcomeViewsOrderBy {
  Natural = 'NATURAL',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  OddsAsc = 'ODDS_ASC',
  OddsDesc = 'ODDS_DESC',
  OddsDecimalAsc = 'ODDS_DECIMAL_ASC',
  OddsDecimalDesc = 'ODDS_DECIMAL_DESC',
  HandicapAsc = 'HANDICAP_ASC',
  HandicapDesc = 'HANDICAP_DESC',
  DisplayOrderAsc = 'DISPLAY_ORDER_ASC',
  DisplayOrderDesc = 'DISPLAY_ORDER_DESC',
  IsHomeAsc = 'IS_HOME_ASC',
  IsHomeDesc = 'IS_HOME_DESC',
  MarketIdAsc = 'MARKET_ID_ASC',
  MarketIdDesc = 'MARKET_ID_DESC',
  FeedSupplierAsc = 'FEED_SUPPLIER_ASC',
  FeedSupplierDesc = 'FEED_SUPPLIER_DESC',
  LivePriceAvailableAsc = 'LIVE_PRICE_AVAILABLE_ASC',
  LivePriceAvailableDesc = 'LIVE_PRICE_AVAILABLE_DESC',
  StartingPriceAvailableAsc = 'STARTING_PRICE_AVAILABLE_ASC',
  StartingPriceAvailableDesc = 'STARTING_PRICE_AVAILABLE_DESC',
  StatusAsc = 'STATUS_ASC',
  StatusDesc = 'STATUS_DESC',
  NameAsc = 'NAME_ASC',
  NameDesc = 'NAME_DESC',
  CanonicalisedNameAsc = 'CANONICALISED_NAME_ASC',
  CanonicalisedNameDesc = 'CANONICALISED_NAME_DESC',
  CanonicalisedNameUniqueAsc = 'CANONICALISED_NAME_UNIQUE_ASC',
  CanonicalisedNameUniqueDesc = 'CANONICALISED_NAME_UNIQUE_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

/** Information about pagination in a connection. */
export type PageInfo = {
  __typename?: 'PageInfo'
  /** When paginating forwards, are there more items? */
  hasNextPage: Scalars['Boolean']
  /** When paginating backwards, are there more items? */
  hasPreviousPage: Scalars['Boolean']
  /** When paginating backwards, the cursor to continue. */
  startCursor?: Maybe<Scalars['Cursor']>
  /** When paginating forwards, the cursor to continue. */
  endCursor?: Maybe<Scalars['Cursor']>
}

/** All input for the `processEntityCategory1` mutation. */
export type ProcessEntityCategory1Input = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  queueParam?: Maybe<QueueInput>
}

/** The output of our `processEntityCategory1` mutation. */
export type ProcessEntityCategory1Payload = {
  __typename?: 'ProcessEntityCategory1Payload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
}

/** All input for the `processEntityCategory2` mutation. */
export type ProcessEntityCategory2Input = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  queueParam?: Maybe<QueueInput>
}

/** The output of our `processEntityCategory2` mutation. */
export type ProcessEntityCategory2Payload = {
  __typename?: 'ProcessEntityCategory2Payload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
}

/** All input for the `processEntityCategory3` mutation. */
export type ProcessEntityCategory3Input = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  queueParam?: Maybe<QueueInput>
}

/** The output of our `processEntityCategory3` mutation. */
export type ProcessEntityCategory3Payload = {
  __typename?: 'ProcessEntityCategory3Payload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
}

/** All input for the `processEntityEvent` mutation. */
export type ProcessEntityEventInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  queueParam?: Maybe<QueueInput>
}

/** The output of our `processEntityEvent` mutation. */
export type ProcessEntityEventPayload = {
  __typename?: 'ProcessEntityEventPayload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
}

/** All input for the `processEntityMarketCollection` mutation. */
export type ProcessEntityMarketCollectionInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  queueParam?: Maybe<QueueInput>
}

/** The output of our `processEntityMarketCollection` mutation. */
export type ProcessEntityMarketCollectionPayload = {
  __typename?: 'ProcessEntityMarketCollectionPayload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
}

/** All input for the `processEntityMarket` mutation. */
export type ProcessEntityMarketInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  queueParam?: Maybe<QueueInput>
}

/** The output of our `processEntityMarket` mutation. */
export type ProcessEntityMarketPayload = {
  __typename?: 'ProcessEntityMarketPayload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
}

/** All input for the `processEntityOutcome` mutation. */
export type ProcessEntityOutcomeInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  queueParam?: Maybe<QueueInput>
}

/** The output of our `processEntityOutcome` mutation. */
export type ProcessEntityOutcomePayload = {
  __typename?: 'ProcessEntityOutcomePayload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
}

/** All input for the `processQueue` mutation. */
export type ProcessQueueInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  runid?: Maybe<Scalars['String']>
}

/** The output of our `processQueue` mutation. */
export type ProcessQueuePayload = {
  __typename?: 'ProcessQueuePayload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  integer?: Maybe<Scalars['Int']>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
}

/** The root query type which gives access points into the data universe. */
export type Query = Node & {
  __typename?: 'Query'
  /**
   * Exposes the root query type nested one level down. This is helpful for Relay 1
   * which can only query top level fields if they are in a particular form.
   **/
  query: Query
  /** The root query type must be a `Node` to work well with Relay 1 mutations. This just resolves to `query`. */
  nodeId: Scalars['ID']
  /** Fetches an object given its globally unique `ID`. */
  node?: Maybe<Node>
  /** Reads and enables pagination through a set of `_TypeormMigration`. */
  _typeormMigrations?: Maybe<_TypeormMigrationsConnection>
  /** Reads and enables pagination through a set of `Category1`. */
  category1s?: Maybe<Category1sConnection>
  /** Reads and enables pagination through a set of `Category2`. */
  category2s?: Maybe<Category2sConnection>
  /** Reads and enables pagination through a set of `Category3`. */
  category3s?: Maybe<Category3sConnection>
  /** Reads and enables pagination through a set of `ConcreteEvent`. */
  concreteEvents?: Maybe<ConcreteEventsConnection>
  /** Reads and enables pagination through a set of `ConcreteMarket`. */
  concreteMarkets?: Maybe<ConcreteMarketsConnection>
  /** Reads and enables pagination through a set of `ConcreteOutcome`. */
  concreteOutcomes?: Maybe<ConcreteOutcomesConnection>
  /** Reads and enables pagination through a set of `Event`. */
  events?: Maybe<EventsConnection>
  /** Reads and enables pagination through a set of `EventView`. */
  eventViews?: Maybe<EventViewsConnection>
  /** Reads and enables pagination through a set of `Market`. */
  markets?: Maybe<MarketsConnection>
  /** Reads and enables pagination through a set of `MarketCollection`. */
  marketCollections?: Maybe<MarketCollectionsConnection>
  /** Reads and enables pagination through a set of `MarketCollectionJoinMarket`. */
  marketCollectionJoinMarkets?: Maybe<MarketCollectionJoinMarketsConnection>
  /** Reads and enables pagination through a set of `MarketView`. */
  marketViews?: Maybe<MarketViewsConnection>
  /** Reads and enables pagination through a set of `MetaCategory1`. */
  metaCategory1s?: Maybe<MetaCategory1sConnection>
  /** Reads and enables pagination through a set of `MetaCategory2`. */
  metaCategory2s?: Maybe<MetaCategory2sConnection>
  /** Reads and enables pagination through a set of `MetaCategory3`. */
  metaCategory3s?: Maybe<MetaCategory3sConnection>
  /** Reads and enables pagination through a set of `MetaConcreteEvent`. */
  metaConcreteEvents?: Maybe<MetaConcreteEventsConnection>
  /** Reads and enables pagination through a set of `MetaConcreteMarket`. */
  metaConcreteMarkets?: Maybe<MetaConcreteMarketsConnection>
  /** Reads and enables pagination through a set of `MetaConcreteOutcome`. */
  metaConcreteOutcomes?: Maybe<MetaConcreteOutcomesConnection>
  /** Reads and enables pagination through a set of `MetaEvent`. */
  metaEvents?: Maybe<MetaEventsConnection>
  /** Reads and enables pagination through a set of `MetaMarket`. */
  metaMarkets?: Maybe<MetaMarketsConnection>
  /** Reads and enables pagination through a set of `MetaMarketCollection`. */
  metaMarketCollections?: Maybe<MetaMarketCollectionsConnection>
  /** Reads and enables pagination through a set of `MetaOutcome`. */
  metaOutcomes?: Maybe<MetaOutcomesConnection>
  /** Reads and enables pagination through a set of `Outcome`. */
  outcomes?: Maybe<OutcomesConnection>
  /** Reads and enables pagination through a set of `OutcomeView`. */
  outcomeViews?: Maybe<OutcomeViewsConnection>
  /** Reads and enables pagination through a set of `Queue`. */
  queues?: Maybe<QueuesConnection>
  /** Reads and enables pagination through a set of `Rename`. */
  renames?: Maybe<RenamesConnection>
  /** Reads and enables pagination through a set of `Run`. */
  runs?: Maybe<RunsConnection>
  _typeormMigration?: Maybe<_TypeormMigration>
  category1?: Maybe<Category1>
  category2?: Maybe<Category2>
  category3?: Maybe<Category3>
  concreteEvent?: Maybe<ConcreteEvent>
  concreteMarket?: Maybe<ConcreteMarket>
  concreteOutcome?: Maybe<ConcreteOutcome>
  event?: Maybe<Event>
  eventView?: Maybe<EventView>
  market?: Maybe<Market>
  marketCollection?: Maybe<MarketCollection>
  marketCollectionJoinMarket?: Maybe<MarketCollectionJoinMarket>
  marketView?: Maybe<MarketView>
  metaCategory1?: Maybe<MetaCategory1>
  metaCategory2?: Maybe<MetaCategory2>
  metaCategory3?: Maybe<MetaCategory3>
  metaConcreteEvent?: Maybe<MetaConcreteEvent>
  metaConcreteMarket?: Maybe<MetaConcreteMarket>
  metaConcreteOutcome?: Maybe<MetaConcreteOutcome>
  metaEvent?: Maybe<MetaEvent>
  metaMarket?: Maybe<MetaMarket>
  metaMarketCollection?: Maybe<MetaMarketCollection>
  metaOutcome?: Maybe<MetaOutcome>
  outcome?: Maybe<Outcome>
  outcomeView?: Maybe<OutcomeView>
  queue?: Maybe<Queue>
  rename?: Maybe<Rename>
  run?: Maybe<Run>
  canonicalise?: Maybe<Scalars['String']>
  eventByCanonicalisedNameUniqueQuery?: Maybe<EventView>
  /** Reads a single `_TypeormMigration` using its globally unique `ID`. */
  _typeormMigrationByNodeId?: Maybe<_TypeormMigration>
  /** Reads a single `Category1` using its globally unique `ID`. */
  category1ByNodeId?: Maybe<Category1>
  /** Reads a single `Category2` using its globally unique `ID`. */
  category2ByNodeId?: Maybe<Category2>
  /** Reads a single `Category3` using its globally unique `ID`. */
  category3ByNodeId?: Maybe<Category3>
  /** Reads a single `ConcreteEvent` using its globally unique `ID`. */
  concreteEventByNodeId?: Maybe<ConcreteEvent>
  /** Reads a single `ConcreteMarket` using its globally unique `ID`. */
  concreteMarketByNodeId?: Maybe<ConcreteMarket>
  /** Reads a single `ConcreteOutcome` using its globally unique `ID`. */
  concreteOutcomeByNodeId?: Maybe<ConcreteOutcome>
  /** Reads a single `Event` using its globally unique `ID`. */
  eventByNodeId?: Maybe<Event>
  /** Reads a single `EventView` using its globally unique `ID`. */
  eventViewByNodeId?: Maybe<EventView>
  /** Reads a single `Market` using its globally unique `ID`. */
  marketByNodeId?: Maybe<Market>
  /** Reads a single `MarketCollection` using its globally unique `ID`. */
  marketCollectionByNodeId?: Maybe<MarketCollection>
  /** Reads a single `MarketCollectionJoinMarket` using its globally unique `ID`. */
  marketCollectionJoinMarketByNodeId?: Maybe<MarketCollectionJoinMarket>
  /** Reads a single `MarketView` using its globally unique `ID`. */
  marketViewByNodeId?: Maybe<MarketView>
  /** Reads a single `MetaCategory1` using its globally unique `ID`. */
  metaCategory1ByNodeId?: Maybe<MetaCategory1>
  /** Reads a single `MetaCategory2` using its globally unique `ID`. */
  metaCategory2ByNodeId?: Maybe<MetaCategory2>
  /** Reads a single `MetaCategory3` using its globally unique `ID`. */
  metaCategory3ByNodeId?: Maybe<MetaCategory3>
  /** Reads a single `MetaConcreteEvent` using its globally unique `ID`. */
  metaConcreteEventByNodeId?: Maybe<MetaConcreteEvent>
  /** Reads a single `MetaConcreteMarket` using its globally unique `ID`. */
  metaConcreteMarketByNodeId?: Maybe<MetaConcreteMarket>
  /** Reads a single `MetaConcreteOutcome` using its globally unique `ID`. */
  metaConcreteOutcomeByNodeId?: Maybe<MetaConcreteOutcome>
  /** Reads a single `MetaEvent` using its globally unique `ID`. */
  metaEventByNodeId?: Maybe<MetaEvent>
  /** Reads a single `MetaMarket` using its globally unique `ID`. */
  metaMarketByNodeId?: Maybe<MetaMarket>
  /** Reads a single `MetaMarketCollection` using its globally unique `ID`. */
  metaMarketCollectionByNodeId?: Maybe<MetaMarketCollection>
  /** Reads a single `MetaOutcome` using its globally unique `ID`. */
  metaOutcomeByNodeId?: Maybe<MetaOutcome>
  /** Reads a single `Outcome` using its globally unique `ID`. */
  outcomeByNodeId?: Maybe<Outcome>
  /** Reads a single `OutcomeView` using its globally unique `ID`. */
  outcomeViewByNodeId?: Maybe<OutcomeView>
  /** Reads a single `Queue` using its globally unique `ID`. */
  queueByNodeId?: Maybe<Queue>
  /** Reads a single `Rename` using its globally unique `ID`. */
  renameByNodeId?: Maybe<Rename>
  /** Reads a single `Run` using its globally unique `ID`. */
  runByNodeId?: Maybe<Run>
  dimensions: Dimensions
  settings: Settings
}

/** The root query type which gives access points into the data universe. */
export type QueryNodeArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type Query_TypeormMigrationsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<_TypeormMigrationsOrderBy>>
  condition?: Maybe<_TypeormMigrationCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryCategory1sArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<Category1sOrderBy>>
  condition?: Maybe<Category1Condition>
}

/** The root query type which gives access points into the data universe. */
export type QueryCategory2sArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<Category2sOrderBy>>
  condition?: Maybe<Category2Condition>
}

/** The root query type which gives access points into the data universe. */
export type QueryCategory3sArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<Category3sOrderBy>>
  condition?: Maybe<Category3Condition>
}

/** The root query type which gives access points into the data universe. */
export type QueryConcreteEventsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<ConcreteEventsOrderBy>>
  condition?: Maybe<ConcreteEventCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryConcreteMarketsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<ConcreteMarketsOrderBy>>
  condition?: Maybe<ConcreteMarketCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryConcreteOutcomesArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<ConcreteOutcomesOrderBy>>
  condition?: Maybe<ConcreteOutcomeCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryEventsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<EventsOrderBy>>
  condition?: Maybe<EventCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryEventViewsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<EventViewsOrderBy>>
  condition?: Maybe<EventViewCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryMarketsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MarketsOrderBy>>
  condition?: Maybe<MarketCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryMarketCollectionsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MarketCollectionsOrderBy>>
  condition?: Maybe<MarketCollectionCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryMarketCollectionJoinMarketsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MarketCollectionJoinMarketsOrderBy>>
  condition?: Maybe<MarketCollectionJoinMarketCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryMarketViewsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MarketViewsOrderBy>>
  condition?: Maybe<MarketViewCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaCategory1sArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaCategory1sOrderBy>>
  condition?: Maybe<MetaCategory1Condition>
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaCategory2sArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaCategory2sOrderBy>>
  condition?: Maybe<MetaCategory2Condition>
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaCategory3sArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaCategory3sOrderBy>>
  condition?: Maybe<MetaCategory3Condition>
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaConcreteEventsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaConcreteEventsOrderBy>>
  condition?: Maybe<MetaConcreteEventCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaConcreteMarketsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaConcreteMarketsOrderBy>>
  condition?: Maybe<MetaConcreteMarketCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaConcreteOutcomesArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaConcreteOutcomesOrderBy>>
  condition?: Maybe<MetaConcreteOutcomeCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaEventsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaEventsOrderBy>>
  condition?: Maybe<MetaEventCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaMarketsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaMarketsOrderBy>>
  condition?: Maybe<MetaMarketCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaMarketCollectionsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaMarketCollectionsOrderBy>>
  condition?: Maybe<MetaMarketCollectionCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaOutcomesArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<MetaOutcomesOrderBy>>
  condition?: Maybe<MetaOutcomeCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryOutcomesArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<OutcomesOrderBy>>
  condition?: Maybe<OutcomeCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryOutcomeViewsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<OutcomeViewsOrderBy>>
  condition?: Maybe<OutcomeViewCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryQueuesArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<QueuesOrderBy>>
  condition?: Maybe<QueueCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryRenamesArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<RenamesOrderBy>>
  condition?: Maybe<RenameCondition>
}

/** The root query type which gives access points into the data universe. */
export type QueryRunsArgs = {
  first?: Maybe<Scalars['Int']>
  last?: Maybe<Scalars['Int']>
  offset?: Maybe<Scalars['Int']>
  before?: Maybe<Scalars['Cursor']>
  after?: Maybe<Scalars['Cursor']>
  orderBy?: Maybe<Array<RunsOrderBy>>
  condition?: Maybe<RunCondition>
}

/** The root query type which gives access points into the data universe. */
export type Query_TypeormMigrationArgs = {
  id: Scalars['Int']
}

/** The root query type which gives access points into the data universe. */
export type QueryCategory1Args = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryCategory2Args = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryCategory3Args = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryConcreteEventArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryConcreteMarketArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryConcreteOutcomeArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryEventArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryEventViewArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryMarketArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryMarketCollectionArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryMarketCollectionJoinMarketArgs = {
  marketCollectionId: Scalars['BigInt']
  marketId: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryMarketViewArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaCategory1Args = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaCategory2Args = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaCategory3Args = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaConcreteEventArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaConcreteMarketArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaConcreteOutcomeArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaEventArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaMarketArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaMarketCollectionArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaOutcomeArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryOutcomeArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryOutcomeViewArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryQueueArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryRenameArgs = {
  id: Scalars['BigInt']
}

/** The root query type which gives access points into the data universe. */
export type QueryRunArgs = {
  id: Scalars['UUID']
}

/** The root query type which gives access points into the data universe. */
export type QueryCanonicaliseArgs = {
  value: Scalars['String']
}

/** The root query type which gives access points into the data universe. */
export type QueryEventByCanonicalisedNameUniqueQueryArgs = {
  canonicalisedNameUnique?: Maybe<Scalars['String']>
}

/** The root query type which gives access points into the data universe. */
export type Query_TypeormMigrationByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryCategory1ByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryCategory2ByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryCategory3ByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryConcreteEventByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryConcreteMarketByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryConcreteOutcomeByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryEventByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryEventViewByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryMarketByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryMarketCollectionByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryMarketCollectionJoinMarketByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryMarketViewByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaCategory1ByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaCategory2ByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaCategory3ByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaConcreteEventByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaConcreteMarketByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaConcreteOutcomeByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaEventByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaMarketByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaMarketCollectionByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryMetaOutcomeByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryOutcomeByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryOutcomeViewByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryQueueByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryRenameByNodeIdArgs = {
  nodeId: Scalars['ID']
}

/** The root query type which gives access points into the data universe. */
export type QueryRunByNodeIdArgs = {
  nodeId: Scalars['ID']
}

export type Queue = Node & {
  __typename?: 'Queue'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  id: Scalars['BigInt']
  data: Scalars['JSON']
  createdAt: Scalars['Datetime']
}

/** A condition to be used against `Queue` object types. All fields are tested for equality and combined with a logical ‘and.’ */
export type QueueCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `data` field. */
  data?: Maybe<Scalars['JSON']>
  /** Checks for equality with the object’s `createdAt` field. */
  createdAt?: Maybe<Scalars['Datetime']>
}

/** An input for mutations affecting `Queue` */
export type QueueInput = {
  id?: Maybe<Scalars['BigInt']>
  data: Scalars['JSON']
  createdAt?: Maybe<Scalars['Datetime']>
}

/** A connection to a list of `Queue` values. */
export type QueuesConnection = {
  __typename?: 'QueuesConnection'
  /** A list of `Queue` objects. */
  nodes: Array<Maybe<Queue>>
  /** A list of edges which contains the `Queue` and cursor to aid in pagination. */
  edges: Array<QueuesEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `Queue` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `Queue` edge in the connection. */
export type QueuesEdge = {
  __typename?: 'QueuesEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `Queue` at the end of the edge. */
  node?: Maybe<Queue>
}

/** Methods to use when ordering `Queue`. */
export enum QueuesOrderBy {
  Natural = 'NATURAL',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  DataAsc = 'DATA_ASC',
  DataDesc = 'DATA_DESC',
  CreatedAtAsc = 'CREATED_AT_ASC',
  CreatedAtDesc = 'CREATED_AT_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

export type Rename = Node & {
  __typename?: 'Rename'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  id: Scalars['BigInt']
  entityName: EntityNameEnum
  regexSearch: Scalars['String']
  regexReplace: Scalars['String']
  displayOrder: Scalars['Int']
}

/** A condition to be used against `Rename` object types. All fields are tested for equality and combined with a logical ‘and.’ */
export type RenameCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['BigInt']>
  /** Checks for equality with the object’s `entityName` field. */
  entityName?: Maybe<EntityNameEnum>
  /** Checks for equality with the object’s `regexSearch` field. */
  regexSearch?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `regexReplace` field. */
  regexReplace?: Maybe<Scalars['String']>
  /** Checks for equality with the object’s `displayOrder` field. */
  displayOrder?: Maybe<Scalars['Int']>
}

/** A connection to a list of `Rename` values. */
export type RenamesConnection = {
  __typename?: 'RenamesConnection'
  /** A list of `Rename` objects. */
  nodes: Array<Maybe<Rename>>
  /** A list of edges which contains the `Rename` and cursor to aid in pagination. */
  edges: Array<RenamesEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `Rename` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `Rename` edge in the connection. */
export type RenamesEdge = {
  __typename?: 'RenamesEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `Rename` at the end of the edge. */
  node?: Maybe<Rename>
}

/** Methods to use when ordering `Rename`. */
export enum RenamesOrderBy {
  Natural = 'NATURAL',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  EntityNameAsc = 'ENTITY_NAME_ASC',
  EntityNameDesc = 'ENTITY_NAME_DESC',
  RegexSearchAsc = 'REGEX_SEARCH_ASC',
  RegexSearchDesc = 'REGEX_SEARCH_DESC',
  RegexReplaceAsc = 'REGEX_REPLACE_ASC',
  RegexReplaceDesc = 'REGEX_REPLACE_DESC',
  DisplayOrderAsc = 'DISPLAY_ORDER_ASC',
  DisplayOrderDesc = 'DISPLAY_ORDER_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

/** All input for the `retrieveConcreteEntity` mutation. */
export type RetrieveConcreteEntityInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  tableName?: Maybe<Scalars['String']>
  metaParam?: Maybe<MetaInput>
}

/** The output of our `retrieveConcreteEntity` mutation. */
export type RetrieveConcreteEntityPayload = {
  __typename?: 'RetrieveConcreteEntityPayload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  string?: Maybe<Scalars['String']>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
}

/** All input for the `retrieveProcessedEntityByCanonicalised` mutation. */
export type RetrieveProcessedEntityByCanonicalisedInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  tableName?: Maybe<Scalars['String']>
  metaParam?: Maybe<MetaInput>
}

/** The output of our `retrieveProcessedEntityByCanonicalised` mutation. */
export type RetrieveProcessedEntityByCanonicalisedPayload = {
  __typename?: 'RetrieveProcessedEntityByCanonicalisedPayload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  string?: Maybe<Scalars['String']>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
}

/** All input for the `retrieveProcessedEntityWithConcrete` mutation. */
export type RetrieveProcessedEntityWithConcreteInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  tableName?: Maybe<Scalars['String']>
  metaParam?: Maybe<MetaInput>
}

/** The output of our `retrieveProcessedEntityWithConcrete` mutation. */
export type RetrieveProcessedEntityWithConcretePayload = {
  __typename?: 'RetrieveProcessedEntityWithConcretePayload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  string?: Maybe<Scalars['String']>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
}

/** All input for the `retrieveProcessedEntityWithoutConcrete` mutation. */
export type RetrieveProcessedEntityWithoutConcreteInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  tableName?: Maybe<Scalars['String']>
  metaParam?: Maybe<MetaInput>
}

/** The output of our `retrieveProcessedEntityWithoutConcrete` mutation. */
export type RetrieveProcessedEntityWithoutConcretePayload = {
  __typename?: 'RetrieveProcessedEntityWithoutConcretePayload'
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars['String']>
  string?: Maybe<Scalars['String']>
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>
}

export type Run = Node & {
  __typename?: 'Run'
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars['ID']
  id: Scalars['UUID']
  processed: Scalars['Boolean']
  createdAt: Scalars['Datetime']
  updatedAt?: Maybe<Scalars['Datetime']>
}

/** A condition to be used against `Run` object types. All fields are tested for equality and combined with a logical ‘and.’ */
export type RunCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars['UUID']>
  /** Checks for equality with the object’s `processed` field. */
  processed?: Maybe<Scalars['Boolean']>
  /** Checks for equality with the object’s `createdAt` field. */
  createdAt?: Maybe<Scalars['Datetime']>
  /** Checks for equality with the object’s `updatedAt` field. */
  updatedAt?: Maybe<Scalars['Datetime']>
}

/** A connection to a list of `Run` values. */
export type RunsConnection = {
  __typename?: 'RunsConnection'
  /** A list of `Run` objects. */
  nodes: Array<Maybe<Run>>
  /** A list of edges which contains the `Run` and cursor to aid in pagination. */
  edges: Array<RunsEdge>
  /** Information to aid in pagination. */
  pageInfo: PageInfo
  /** The count of *all* `Run` you could get from the connection. */
  totalCount: Scalars['Int']
}

/** A `Run` edge in the connection. */
export type RunsEdge = {
  __typename?: 'RunsEdge'
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars['Cursor']>
  /** The `Run` at the end of the edge. */
  node?: Maybe<Run>
}

/** Methods to use when ordering `Run`. */
export enum RunsOrderBy {
  Natural = 'NATURAL',
  IdAsc = 'ID_ASC',
  IdDesc = 'ID_DESC',
  ProcessedAsc = 'PROCESSED_ASC',
  ProcessedDesc = 'PROCESSED_DESC',
  CreatedAtAsc = 'CREATED_AT_ASC',
  CreatedAtDesc = 'CREATED_AT_DESC',
  UpdatedAtAsc = 'UPDATED_AT_ASC',
  UpdatedAtDesc = 'UPDATED_AT_DESC',
  PrimaryKeyAsc = 'PRIMARY_KEY_ASC',
  PrimaryKeyDesc = 'PRIMARY_KEY_DESC',
}

export type Settings = {
  __typename?: 'Settings'
  layoutSize?: Maybe<LayoutSize>
}

export type SettingsInput = {
  layoutSize?: Maybe<LayoutSize>
}

export enum StatusEnum {
  Active = 'ACTIVE',
  Suspended = 'SUSPENDED',
}
