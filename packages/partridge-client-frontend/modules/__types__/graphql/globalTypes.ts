/* tslint:disable */
/* eslint-disable */
// This file was automatically generated and should not be edited.

//==============================================================
// START Enums and Input Objects
//==============================================================

export enum ConcreteEventFeedSupplierEnum {
  CORAL = "CORAL",
  SKY = "SKY",
}

export enum ConcreteEventStatusEnum {
  ACTIVE = "ACTIVE",
  SUSPENDED = "SUSPENDED",
}

export enum ConcreteMarketBettingStatusEnum {
  PRICED = "PRICED",
}

export enum ConcreteMarketFeedSupplierEnum {
  CORAL = "CORAL",
  SKY = "SKY",
}

export enum ConcreteMarketStatusEnum {
  ACTIVE = "ACTIVE",
  SUSPENDED = "SUSPENDED",
}

export enum ConcreteOutcomeFeedSupplierEnum {
  CORAL = "CORAL",
  SKY = "SKY",
}

export enum ConcreteOutcomeStatusEnum {
  ACTIVE = "ACTIVE",
  SUSPENDED = "SUSPENDED",
}

export enum EventTypeEnum {
  MATCH_2_TEAMS = "MATCH_2_TEAMS",
  OUTRIGHT = "OUTRIGHT",
}

export interface ResponsiveInput {
  lessThan?: Responsive_computedInput | null;
  greaterThan?: Responsive_computedInput | null;
  is?: Responsive_computedInput | null;
  mediaType?: string | null;
  orientation?: string | null;
}

export interface Responsive_computedInput {
  extraSmall?: boolean | null;
  small?: boolean | null;
  medium?: boolean | null;
  large?: boolean | null;
  infinity?: boolean | null;
}

//==============================================================
// END Enums and Input Objects
//==============================================================
