// types for our CommonEntity structure
import {EntityMeta} from './entity'
import {EventType, EventBettingStatus, EntityName, Status} from 'partridge-models'
import Big from 'big.js'

export {EventType, EventBettingStatus, EntityName}

/**
 *  - 'processed' infers 'concrete'
 *
 */
export enum CrunchAction {
  update_and_create_processed = 'UPDATE_AND_CREATE_PROCESSED', // always writes/updates
  update_and_create_concrete = 'UPDATE_AND_CREATE_CONCRETE', // writes/updates concrete only (processed must be present)
  create_concrete = 'CREATE_CONCRETE', // skips concrete if exists
}

export interface CrunchTmp {
  // we are forcing the upfront declaration of an entity's canonicalised_name_unique append.
  // @see `partridge-importer/schema/outcome.json5`
  unique_append: string
  // this will define the action the crunch phase should take on the entity
  action: CrunchAction
  suggest_rename_rules?: boolean // when the runtime argv suggestRenameRules is set
}

// @see example in ../schema/event.json5
export interface CommonEntity<T, U> {
  meta: EntityMeta
  associations: U
  fields: T
  import_tmp?: any // this will not be persisted to queue
  crunch_tmp: CrunchTmp // this will be persisted to queue but not through to processed
  type: EntityName
}

export interface MergeableEntity<T, U> extends CommonEntity<T, U> {}

export interface EntityContext extends Formattable {
  category1: (ent?: Category1CommonEntity) => Category1CommonEntity
  category2: (ent?: Category2CommonEntity) => Category2CommonEntity
  category3: (ent?: Category3CommonEntity) => Category3CommonEntity
  event: (ent?: EventCommonEntity) => EventCommonEntity
  market: (ent?: MarketCommonEntity) => MarketCommonEntity
  outcome: (ent?: OutcomeCommonEntity) => OutcomeCommonEntity
  marketCollection: (ent?: MarketCollectionCommonEntity) => MarketCollectionCommonEntity

  category1s: (ent?: Category1CommonEntity[], replace?: boolean) => Category1CommonEntity[]
  category2s: (ent?: Category2CommonEntity[], replace?: boolean) => Category2CommonEntity[]
  category3s: (ent?: Category3CommonEntity[], replace?: boolean) => Category3CommonEntity[]
  events: (ent?: EventCommonEntity[], replace?: boolean) => EventCommonEntity[]
  markets: (ent?: MarketCommonEntity[], replace?: boolean) => MarketCommonEntity[]
  outcomes: (ent?: OutcomeCommonEntity[], replace?: boolean) => OutcomeCommonEntity[]
  marketCollections: (ent?: MarketCollectionCommonEntity[], replace?: boolean) => MarketCollectionCommonEntity[]

  asFormat: Formattable['asFormat'] // why not include through extends?
}

// export type EntityContext = {
//   [K in EntityName]?: CommonEntity<any>
// } & {
//   category1s?: CommonEntity<any>[]
//   category2s?: CommonEntity<any>[]
//   category3s?: CommonEntity<any>[]
//   events?: CommonEntity<any>[]
//   marketCollections?: CommonEntity<any>[]
//   markets?: CommonEntity<any>[]
//   outcomes?: CommonEntity<any>[]
// }

export interface Category1Fields {
  processed: {
    display_order: number
  }
}
export interface Category2Fields {
  processed: {
    display_order: number
  }
}
export interface Category3Fields {
  processed: {
    display_order: number
  }
}
export interface EventFields {
  processed: {
    event_date: Date
    type: EventType
    display_order: number
  }
  concrete: {
    displayed: boolean
    status: Status
    url?: string
  }
}
export interface MarketFields {
  processed: {}
  concrete: {
    bet_in_play: boolean
    bet_till: Date
    betting_status: EventBettingStatus
    cashout_available: boolean
    eachway_available: boolean
    first_four_available: boolean
    forecast_available: boolean
    guaranteed_price_available: boolean
    place_available: boolean
    quinella_available: boolean
    status: Status
    tricast_available: boolean
    url?: string
    display_order: number
    // computed
    is_default?: boolean
  }
}
export interface OutcomeFields {
  processed: {}
  concrete: {
    odds?: string
    odds_decimal?: Big
    runner_number?: number
    handicap?: string
    live_price_available: boolean
    starting_price_available: boolean
    status: Status
    display_order: number
    // computed
    is_home?: boolean
  }
}
export interface MarketCollectionFields {
  processed: {
    display_order: number
  }
}

export interface Association {
  [index: string]: EntityMeta[]
}

export type Category1Associations = {} // tslint:disable-line
export type Category2Associations = Association
export type Category3Associations = Association
export type EventAssociations = Association
export type MarketAssociations = Association
export type OutcomeAssociations = Association
export type MarketCollectionAssociations = Association
export type AssociationsUnion =
  | Category1Associations
  | Category2Associations
  | Category3Associations
  | EventAssociations
  | MarketAssociations
  | OutcomeAssociations
  | MarketCollectionAssociations

export type Category1CommonEntity = CommonEntity<Category1Fields, Category1Associations>
export type Category2CommonEntity = CommonEntity<Category2Fields, Category2Associations>
export type Category3CommonEntity = CommonEntity<Category3Fields, Category3Associations>
export type EventCommonEntity = MergeableEntity<EventFields, EventAssociations>
export type MarketCommonEntity = MergeableEntity<MarketFields, MarketAssociations>
export type OutcomeCommonEntity = MergeableEntity<OutcomeFields, OutcomeAssociations>
export type MarketCollectionCommonEntity = CommonEntity<MarketCollectionFields, MarketCollectionAssociations>

// export type FieldsUnion = Category1Fields | Category2Fields | Category3Fields | EventFields | MarketCollectionFields | MarketFields | OutcomeFields
export type MergeableCommonEntityUnion = EventCommonEntity | MarketCommonEntity | OutcomeCommonEntity
export type CommonEntityUnion =
  | Category1CommonEntity
  | Category1CommonEntity
  | Category3CommonEntity
  | EventCommonEntity
  | MarketCommonEntity
  | OutcomeCommonEntity
  | MarketCollectionCommonEntity
export type CommonEntityUnionArray = CommonEntityUnion[] // @see `generate-jsonschema.ts`
