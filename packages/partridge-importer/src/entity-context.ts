import {
  EntityContext,
  CommonEntity,
  Category1Fields,
  Category2Fields,
  Category3Fields,
  EventFields,
  MarketFields,
  OutcomeFields,
  MarketCollectionFields,
  Category1CommonEntity,
  Category2CommonEntity,
  Category3CommonEntity,
  MarketCommonEntity,
  OutcomeCommonEntity,
  MarketCollectionCommonEntity,
  EventCommonEntity,
} from './__types__'

export const createEntityContext = (): EntityContext => {
  let category1: Category1CommonEntity
  let category2: Category2CommonEntity
  let category3: Category3CommonEntity
  let event: EventCommonEntity
  let market: MarketCommonEntity
  let outcome: OutcomeCommonEntity
  let marketCollection: MarketCollectionCommonEntity

  let category1s: Category1CommonEntity[] = []
  let category2s: Category2CommonEntity[] = []
  let category3s: Category3CommonEntity[] = []
  let events: EventCommonEntity[] = []
  let markets: MarketCommonEntity[] = []
  let outcomes: OutcomeCommonEntity[] = []
  let marketCollections: MarketCollectionCommonEntity[] = []

  return {
    category1: (ent: Category1CommonEntity) => {
      if (ent) category1 = ent
      return category1
    },
    category2: (ent: Category2CommonEntity) => {
      if (ent) category2 = ent
      return category2
    },
    category3: (ent: Category3CommonEntity) => {
      if (ent) category3 = ent
      return category3
    },
    event: (ent: EventCommonEntity) => {
      if (ent) event = ent
      return event
    },
    market: (ent: MarketCommonEntity) => {
      if (ent) market = ent
      return market
    },
    outcome: (ent: OutcomeCommonEntity) => {
      if (ent) outcome = ent
      return outcome
    },
    marketCollection: (ent: MarketCollectionCommonEntity) => {
      if (ent) marketCollection = ent
      return marketCollection
    },

    category1s: (ents: Category1CommonEntity[], replace?: boolean) => {
      if (ents) category1s = replace ? ents : category1s.concat(ents)
      return category1s
    },
    category2s: (ents: Category2CommonEntity[], replace?: boolean) => {
      if (ents) category2s = replace ? ents : category2s.concat(ents)
      return category2s
    },
    category3s: (ents: Category3CommonEntity[], replace?: boolean) => {
      if (ents) category3s = replace ? ents : category3s.concat(ents)
      return category3s
    },
    events: (ents: EventCommonEntity[], replace?: boolean) => {
      if (ents) events = replace ? ents : events.concat(ents)
      return events
    },
    markets: (ents: MarketCommonEntity[], replace?: boolean) => {
      if (ents) markets = replace ? ents : markets.concat(ents)
      return markets
    },
    outcomes: (ents: OutcomeCommonEntity[], replace?: boolean) => {
      if (ents) outcomes = replace ? ents : outcomes.concat(ents)
      return outcomes
    },
    marketCollections: (ents: MarketCollectionCommonEntity[], replace?: boolean) => {
      if (ents) marketCollections = replace ? ents : marketCollections.concat(ents)
      return marketCollections
    },

    asFormat: (_logLevel: LogLevel) => ({
      category1s: category1s.length,
      category2s: category2s.length,
      category3s: category3s.length,
      events: events.length,
      markets: markets.length,
      outcomes: outcomes.length,
      marketCollections: marketCollections.length,
    }),
  }
}
