// these are the types codegen'd from graphql schema. Represent the response type from the apollo resolver
import {ResponsiveQuery_responsive_is as BreakpointsBoolean} from '../__types__/graphql/ResponsiveQuery'

export enum MEDIA_SIZES {
  extraSmall = 'extraSmall',
  small = 'small',
  medium = 'medium',
  large = 'large',
  infinity= 'infinity',
}

export enum MEDIA_ORIENTATIONS {
  portrait = 'portrait',
  landscape = 'landscape',
}

interface CustomRules {
  [index: string]: Scalar
}
export type Breakpoints = {
  [p in MEDIA_SIZES]: Scalar
} & CustomRules
export type BreakpointsNumber = {
  [p in MEDIA_SIZES]: number
}
export type BreakpointsBoolean = {
  [p in MEDIA_SIZES]: boolean
}
export type BreakpointsMediaQuery = {
  [p in MEDIA_SIZES]: MediaQuery
}

export type Orientations = {
  [p in MEDIA_ORIENTATIONS]: MediaQuery
}

export type MediaQuery = string // e.g. 'screen and (max-width: 300px)' / https://goo.gl/KKDGkN

// ultimately, used as input to here - https://goo.gl/xeSb7Z
export const breakpoints: Breakpoints = {
  [MEDIA_SIZES.extraSmall]: 480,
  [MEDIA_SIZES.small]: 768,
  [MEDIA_SIZES.medium]: 992,
  [MEDIA_SIZES.large]: 1200,
  [MEDIA_SIZES.infinity]: Infinity,
}

export const orientations: Orientations = {
  portrait: '(orientation: portrait)',
  landscape: '(orientation: landscape)',
}

export const isMobile = (mediaType: MEDIA_SIZES): boolean => [MEDIA_SIZES.extraSmall, MEDIA_SIZES.small].includes(mediaType)
