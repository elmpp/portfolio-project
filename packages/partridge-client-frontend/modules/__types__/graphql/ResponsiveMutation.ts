/* tslint:disable */
/* eslint-disable */
// This file was automatically generated and should not be edited.

import { ResponsiveInput } from "./globalTypes";

// ====================================================
// GraphQL mutation operation: ResponsiveMutation
// ====================================================

export interface ResponsiveMutation_updateResponsive_lessThan {
  __typename: "Responsive_computed";
  extraSmall: boolean;
  small: boolean;
  medium: boolean;
  large: boolean;
  infinity: boolean;
}

export interface ResponsiveMutation_updateResponsive_greaterThan {
  __typename: "Responsive_computed";
  extraSmall: boolean;
  small: boolean;
  medium: boolean;
  large: boolean;
  infinity: boolean;
}

export interface ResponsiveMutation_updateResponsive_is {
  __typename: "Responsive_computed";
  extraSmall: boolean;
  small: boolean;
  medium: boolean;
  large: boolean;
  infinity: boolean;
}

export interface ResponsiveMutation_updateResponsive {
  __typename: "Responsive";
  lessThan: ResponsiveMutation_updateResponsive_lessThan;
  greaterThan: ResponsiveMutation_updateResponsive_greaterThan;
  is: ResponsiveMutation_updateResponsive_is;
  mediaType: string;
  orientation: string;
}

export interface ResponsiveMutation {
  updateResponsive: ResponsiveMutation_updateResponsive | null;
}

export interface ResponsiveMutationVariables {
  responsiveObj?: ResponsiveInput | null;
}
