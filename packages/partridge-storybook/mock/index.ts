/**
 * Mocking manually some responses
 *
 *  - casual - https://tinyurl.com/yxm9jbsc
 *
 */

import casualModule from 'casual-browserify'
import {OutcomeView, MarketView, EventView} from 'partridge-client-core'

const casual = casualModule.functions()
casualModule.define('feedSupplier', () =>
  casualModule.random_element([
    'coral',
    'sky',
    'boylesports',
    'test1',
    'test2',
    'test3',
    'test4',
    'test5',
    'test6',
    'test7',
    'test8',
    'test9',
    'test10',
  ])
)
casualModule.define('status', () => casualModule.random_element(['ACTIVE', 'SUSPENDED']))
casualModule.define('eventType', () => casualModule.random_element(['MATCH_2_TEAMS', 'OUTRIGHT']))
casualModule.define('odds', () => `${casualModule.integer(0, 10)}/1`)
casualModule.define('oddsDecimal', () => casualModule.random_element([2, 3]))
casualModule.define('outcomeName', () =>
  casualModule.random_element(['Manchester United.', 'Aberdeenshire Foundationals', 'draw'])
)

export const mockEventView = (nbOutcomes = 3): EventView => {
  return {
    __typename: 'EventView',
    nodeId: casual.integer(0, 10000000),
    id: casual.integer(0, 10000000),
    displayed: casual.boolean(),
    url: casual.url(),
    feedSupplier: casualModule.feedSupplier,
    status: casualModule.status,
    name: casual.company_name(),
    canonicalisedName: casual.company_name(),
    canonicalisedNameUnique: casual.company_name(),
    eventDate: casual.date(),
    type: casualModule.eventType,
    category3Id: casual.integer(0, 10000000),
    // category3Id: casual.integer(0, 10000000),
    displayOrder: casual.integer(0, 10000000),
    /** Reads and enables pagination through a set of `MarketView`. */
    markets: {
      __typename: 'MarketViewsConnection',
      edges: [],
      pageInfo: {},
      totalCount: casual.integer(0, 10000000),
      nodes: [mockMarketView(nbOutcomes)],
    },
  }
}
export const mockMarketView = (nbOutcomes: number): MarketView => {
  return {
    __typename: 'MarketView',
    nodeId: casual.integer(0, 10000000),
    id: casual.integer(0, 10000000),
    cashoutAvailable: casual.boolean(),
    eachwayAvailable: casual.boolean(),
    firstFourAvailable: casual.boolean(),
    forecastAvailable: casual.boolean(),
    guaranteedPriceAvailable: casual.boolean(),
    placeAvailable: casual.boolean(),
    quinellaAvailable: casual.boolean(),
    tricastAvailable: casual.boolean(),
    eventId: casual.integer(0, 10000000),
    displayOrder: casual.integer(0, 10000000),
    isDefault: casual.boolean(),
    betInPlay: casual.boolean(),
    betTill: casual.date(),
    bettingStatus: 'PRICED',
    feedSupplier: casualModule.feedSupplier,
    status: casualModule.status,
    name: 'match result',
    canonicalisedName: 'match-result',
    canonicalisedNameUnique: 'match-result',
    /** Reads and enables pagination through a set of `MarketView`. */
    outcomes: {
      __typename: 'OutcomeViewsConnection',
      edges: [],
      pageInfo: {},
      totalCount: casual.integer(0, 10000000),
      nodes: Array(nbOutcomes)
        .fill(null)
        .map(() => mockOutcomeView()),
    },
  }
}
export const mockOutcomeView = (): OutcomeView => {
  const outcomeName = casualModule.outcomeName

  return {
    __typename: 'OutcomeView',
    nodeId: casual.integer(0, 10000000),
    id: casual.integer(0, 10000000),
    odds: casualModule.odds,
    oddsDecimal: casualModule.oddsDecimal,
    handicap: casual.sentence(),
    displayOrder: casual.integer(0, 10000000),
    isHome: casual.boolean(),
    marketId: casual.integer(0, 10000000),
    livePriceAvailable: casual.boolean(),
    startingPriceAvailable: casual.boolean(),
    feedSupplier: casualModule.feedSupplier,
    status: casualModule.status,
    // name: casual.company_name(),
    // canonicalisedName: casual.company_name(),
    // canonicalisedNameUnique: casual.company_name(),
    name: outcomeName,
    canonicalisedName: outcomeName,
    canonicalisedNameUnique: outcomeName,
    /** Reads and enables pagination through a set of `MarketView`. */
  }
}
