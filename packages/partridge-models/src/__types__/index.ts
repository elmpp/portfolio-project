export enum EventType {
  match_2_teams = 'MATCH_2_TEAMS',
  outright = 'OUTRIGHT',
}

export enum EventBettingStatus {
  priced = 'PRICED',
}

// export enum EventStatus {
//   active = 'ACTIVE',
//   suspended = 'SUSPENDED',
// }

// export enum MarketStatus {
//   active = 'ACTIVE',
//   suspended = 'SUSPENDED',
// }

// export enum OutcomeStatus {
//   active = 'ACTIVE',
//   suspended = 'SUSPENDED',
// }

export enum Status {
  active = 'ACTIVE',
  suspended = 'SUSPENDED',
}

// export type MergeableName = 'event' | 'market' | 'outcome'

// export type CategoryName = 'category1' | 'category2' | 'category3'

// export type EntityName = MergeableName | CategoryName | 'marketCollection'

export enum EntityName {
  category1 = 'CATEGORY1',
  category2 = 'CATEGORY2',
  category3 = 'CATEGORY3',
  event = 'EVENT',
  market = 'MARKET',
  outcome = 'OUTCOME',
  marketCollection = 'MARKETCOLLECTION',
}
