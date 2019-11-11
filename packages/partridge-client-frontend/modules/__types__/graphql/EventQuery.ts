/* tslint:disable */
/* eslint-disable */
// This file was automatically generated and should not be edited.

import { ConcreteEventFeedSupplierEnum, ConcreteEventStatusEnum, EventTypeEnum, ConcreteMarketFeedSupplierEnum, ConcreteMarketBettingStatusEnum, ConcreteMarketStatusEnum, ConcreteOutcomeFeedSupplierEnum, ConcreteOutcomeStatusEnum } from "./globalTypes";

// ====================================================
// GraphQL query operation: EventQuery
// ====================================================

export interface EventQuery_eventView_markets_pageInfo {
  __typename: "PageInfo";
  /**
   * When paginating forwards, are there more items?
   */
  hasNextPage: boolean;
}

export interface EventQuery_eventView_markets_nodes_outcomes_nodes {
  __typename: "OutcomeView";
  odds: string | null;
  oddsDecimal: number | null;
  handicap: string | null;
  displayOrder: number | null;
  isHome: boolean | null;
  feedSupplier: ConcreteOutcomeFeedSupplierEnum | null;
  livePriceAvailable: boolean | null;
  startingPriceAvailable: boolean | null;
  status: ConcreteOutcomeStatusEnum | null;
  name: string | null;
  canonicalisedName: string | null;
}

export interface EventQuery_eventView_markets_nodes_outcomes {
  __typename: "OutcomeViewsConnection";
  /**
   * A list of `OutcomeView` objects.
   */
  nodes: (EventQuery_eventView_markets_nodes_outcomes_nodes | null)[];
}

export interface EventQuery_eventView_markets_nodes {
  __typename: "MarketView";
  cashoutAvailable: boolean | null;
  eachwayAvailable: boolean | null;
  firstFourAvailable: boolean | null;
  forecastAvailable: boolean | null;
  guaranteedPriceAvailable: boolean | null;
  placeAvailable: boolean | null;
  quinellaAvailable: boolean | null;
  tricastAvailable: boolean | null;
  displayOrder: number | null;
  isDefault: boolean | null;
  feedSupplier: ConcreteMarketFeedSupplierEnum | null;
  betInPlay: boolean | null;
  betTill: any | null;
  bettingStatus: ConcreteMarketBettingStatusEnum | null;
  status: ConcreteMarketStatusEnum | null;
  name: string | null;
  canonicalisedName: string | null;
  /**
   * Reads and enables pagination through a set of `OutcomeView`.
   */
  outcomes: EventQuery_eventView_markets_nodes_outcomes;
}

export interface EventQuery_eventView_markets {
  __typename: "MarketViewsConnection";
  /**
   * Information to aid in pagination.
   */
  pageInfo: EventQuery_eventView_markets_pageInfo;
  /**
   * A list of `MarketView` objects.
   */
  nodes: (EventQuery_eventView_markets_nodes | null)[];
}

export interface EventQuery_eventView {
  __typename: "EventView";
  id: any;
  displayed: boolean | null;
  url: string | null;
  feedSupplier: ConcreteEventFeedSupplierEnum | null;
  status: ConcreteEventStatusEnum | null;
  name: string | null;
  canonicalisedName: string | null;
  eventDate: any | null;
  type: EventTypeEnum | null;
  displayOrder: number | null;
  /**
   * Reads and enables pagination through a set of `MarketView`.
   */
  markets: EventQuery_eventView_markets;
}

export interface EventQuery {
  eventView: EventQuery_eventView | null;
}
