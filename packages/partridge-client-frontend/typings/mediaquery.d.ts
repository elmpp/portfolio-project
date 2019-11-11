// https://goo.gl/S9E3i4

// --- must keep in sync with `media-type-constants.ts`
enum MEDIA_SIZES {
  extraSmall = 'extraSmall',
  small = 'small',
  medium = 'medium',
  large = 'large',
  infinity = 'infinity',
}
interface CustomRules {
  [index: string]: Scalar
}
type Breakpoints = {
  [p in MEDIA_SIZES]: Scalar
} & CustomRules
type BreakpointsMediaQuery = {
  [p in MEDIA_SIZES]: MediaQuery
}
type MediaQuery = string
type MediaQueryTuple = [MEDIA_SIZES, MediaQuery]
type MediaQueryCustom = {
  [index: string]: MediaQuery
}
// --- must keep in sync with `media-type-constants.ts` EOF

declare namespace MQ {
  function asArray(obj: Breakpoints): MediaQueryTuple[]; // https://goo.gl/fq42b2
  function asObject(obj: Breakpoints): BreakpointsMediaQuery; // https://goo.gl/pTB6MT
  function getBreakpoints(obj: Breakpoints): Breakpoints; // https://goo.gl/5dTk4N
  function getCustomQueries(obj: Breakpoints): MediaQueryCustom; // https://goo.gl/RXs5xJ
}

declare module "mediaquery" {
  export = MQ
}