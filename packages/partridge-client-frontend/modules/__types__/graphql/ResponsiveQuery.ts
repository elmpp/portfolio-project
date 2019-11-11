/* tslint:disable */
/* eslint-disable */
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL query operation: ResponsiveQuery
// ====================================================

export interface ResponsiveQuery_responsive_lessThan {
  __typename: "Responsive_computed";
  extraSmall: boolean;
  small: boolean;
  medium: boolean;
  large: boolean;
  infinity: boolean;
}

export interface ResponsiveQuery_responsive_greaterThan {
  __typename: "Responsive_computed";
  extraSmall: boolean;
  small: boolean;
  medium: boolean;
  large: boolean;
  infinity: boolean;
}

export interface ResponsiveQuery_responsive_is {
  __typename: "Responsive_computed";
  extraSmall: boolean;
  small: boolean;
  medium: boolean;
  large: boolean;
  infinity: boolean;
}

export interface ResponsiveQuery_responsive {
  __typename: "Responsive";
  lessThan: ResponsiveQuery_responsive_lessThan;
  greaterThan: ResponsiveQuery_responsive_greaterThan;
  is: ResponsiveQuery_responsive_is;
  mediaType: string;
  orientation: string;
}

export interface ResponsiveQuery {
  responsive: ResponsiveQuery_responsive;
}
