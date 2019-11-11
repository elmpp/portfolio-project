// a reworking of the createReducers function of redux-responsive - http://bit.ly/2ILBWQI
import MediaQuery from 'mediaquery'
import {
  Breakpoints,
  BreakpointsNumber,
  BreakpointsBoolean,
  MEDIA_SIZES,
  BreakpointsMediaQuery,
  MEDIA_ORIENTATIONS,
  orientations,
} from './media-type-constants'
import {Options} from './__types__'
import { ResponsiveQuery_responsive } from './../__types__/graphql/ResponsiveQuery';

// // orientation to default to when no `window` present
const defaultOrientation = MEDIA_ORIENTATIONS['portrait']

type BreakpointsUnion = Breakpoints | BreakpointsNumber | BreakpointsBoolean

// a lightweight version of lodash.transform
const transform = (
  obj: Breakpoints,
  f: (internal: BreakpointsUnion, value: Scalar, key: MEDIA_SIZES) => void
): BreakpointsUnion => {
  // a place to mutate
  const internal = {...obj}
  // basically we have to reduce the keys down to an object and pass the k/v pairs to each f
  Object.keys(obj).forEach((key) => f(internal, obj[key], key as MEDIA_SIZES))

  return internal
}

/**
 * Compute a mapping of media type to its ordering where ordering is defined
 * such that large > medium > small.
 */
export function getOrderMap(bps: Breakpoints): BreakpointsNumber {
  // grab the keys in the appropriate order
  const keys = Object.keys(bps).sort((a, b) => {
    const valueA = bps[a]
    const valueB = bps[b]

    // if a is a number and b is a string
    if (typeof valueA === 'number' && typeof valueB === 'string') {
      // put the number first
      return -1
    } else if (typeof valueB === 'number' && typeof valueA === 'string') {
      // return the number first
      return 1
    }

    // otherwise treat it like normal
    return valueA >= valueB ? 1 : -1
  })

  // map the original breakpoint object
  const transformed = transform(bps, (result, _breakpoint, mediaType) => {
    // figure out the index of the mediatype
    const index: number = keys.indexOf(mediaType)

    // if there is an entry in the sort for this
    if (index !== -1) {
      // to its index in the sorted list
      result[mediaType] = index
    }
  })

  return transformed as BreakpointsNumber
}

/**
 * Compute the `lessThan` object based on the browser width.
 * @returns {object} The `lessThan` object.  Its keys are the same as the
 * keys of the breakpoints object.  The value for each key indicates whether
 * or not the browser width is less than the breakpoint.
 */
export function getLessThan(currentMediaType: MEDIA_SIZES, breakpointsOrdered: Breakpoints): BreakpointsBoolean {
  // get the ordering of the current media type
  const currentOrder = breakpointsOrdered[currentMediaType]

  const transformed = transform(breakpointsOrdered, (result, breakpoint, mediaType) => {
    // if the breakpoint is a number
    if (typeof breakpoint === 'number' && breakpointsOrdered[mediaType]) {
      // store wether or not it is less than the breakpoint
      result[mediaType] = currentOrder < breakpointsOrdered[mediaType]
      // handle non numerical breakpoints specially
    } else {
      result[mediaType] = false
    }
  })

  return transformed as BreakpointsBoolean
}

/**
 * Compute the `lessThan` object based on the browser width.
 * @arg {object} breakpoints - The breakpoints object.
 * @arg {currentMediaType} breakpoints - The curent media type.
 * @returns {object} The `lessThan` object.  Its keys are the same as the
 * keys of the breakpoints object.  The value for each key indicates whether
 * or not the browser width is less than the breakpoint.
 */
export function getIs(currentMediaType: MEDIA_SIZES, breakpoints: Breakpoints): BreakpointsBoolean {
  const transformed = transform(breakpoints, (result, breakpoint, mediaType) => {
    // if the breakpoint is a number
    if (typeof breakpoint === 'number' && breakpoints[mediaType]) {
      // store wether or not it is less than the breakpoint
      result[mediaType] = mediaType === currentMediaType
      // handle non numerical breakpoints specially
    } else {
      result[mediaType] = false
    }
  })

  return transformed as BreakpointsBoolean
}

/**
 * Compute the `greaterThan` object based on the browser width.
 * @arg {number} browserWidth - Width of the browser.
 * @arg {object} breakpoints - The breakpoints object.
 * @returns {object} The `greaterThan` object.  Its keys are the same as the
 * keys of the breakpoints object.  The value for each key indicates whether
 * or not the browser width is greater than the breakpoint.
 */
export function getGreaterThan(currentMediaType: MEDIA_SIZES, breakpointsOrdered: Breakpoints): BreakpointsBoolean {
  // get the ordering of the current media type
  const currentOrder = breakpointsOrdered[currentMediaType]

  const transformed = transform(breakpointsOrdered, (result, breakpoint, mediaType) => {
    // if the breakpoint is a number
    if (typeof breakpoint === 'number') {
      // store wether or not it is less than the breakpoint
      result[mediaType] = currentOrder > breakpointsOrdered[mediaType]
      // handle non numerical breakpoints specially
    } else {
      result[mediaType] = false
    }
  })

  return transformed as BreakpointsBoolean
}

/**
 * Gets the current media type from the global `window`.
 * @arg {object} mediaQueries - The media queries object.
 * @arg {string} infinityMediaType - The infinity media type.
 * @returns {string} The window's current media type.  This is the key of the
 * breakpoint that is the next breakpoint larger than the window.
 */
function getMediaType(
  matchMedia: Window['matchMedia'] | undefined,
  mediaQueries: BreakpointsMediaQuery,
  infinityMediaType: MEDIA_SIZES
): MEDIA_SIZES {
  // if there's no window
  if (typeof matchMedia === 'undefined') {
    // return the infinity media type
    return infinityMediaType
  }

  // there is a window, so compute the true media type
  return Object.keys(mediaQueries).reduce((result, key) => {
    const matched: MediaQueryList = matchMedia(mediaQueries[key as MEDIA_SIZES])
    if (matched.matches) {
      return key
    }
    return result
  }, infinityMediaType) as MEDIA_SIZES
}

/**
 * Gets the current media type from the global `window`.
 * @arg {object} mediaQueries - The media queries object.
 * @returns {string} The window's current media type.  This is the key of the
 * breakpoint that is the next breakpoint larger than the window.
 */
function getOrientation(matchMedia: Window['matchMedia'] | undefined): MEDIA_ORIENTATIONS {
  // if there's no window
  if (typeof matchMedia === 'undefined') {
    // return the default
    return defaultOrientation
  }

  // there is a window, so compute the true orientation
  return Object.keys(orientations).reduce((result, key: string) => {
    const matched: MediaQueryList = matchMedia(orientations[key as MEDIA_ORIENTATIONS])
    if (matched.matches) {
      return key
    }
    return result
  }, defaultOrientation) as MEDIA_ORIENTATIONS
}

/**
 * This "responsive calculator" is responsible for performing a ["media query"](http://bit.ly/2s4tt0L)
 * This will be called for each breakpoint supplied
 */
export default ({staticMediaType, breakpoints}: Options) => {
  // media queries associated with the breakpoints
  const mediaQueries = MediaQuery.asObject(breakpoints)
  // figure out the ordering
  const mediaOrdering = getOrderMap(breakpoints)

  // @param matchMedia (from Window) - https://mzl.la/2ISBi47
  return ({matchMedia}: {matchMedia?: Window['matchMedia']}): ResponsiveQuery_responsive => {
    // if told to recalculate state or state has not yet been initialized
    // if the state has never been set before and we have an initial type
    const mediaType = staticMediaType || getMediaType(matchMedia, mediaQueries, MEDIA_SIZES.infinity)
    // the current orientation
    const orientation = getOrientation(matchMedia)
    // build the responsive state
    return {
      __typename: 'Responsive',
      lessThan: {...getLessThan(mediaType, mediaOrdering), __typename: 'Responsive_computed'},
      greaterThan: {...getGreaterThan(mediaType, mediaOrdering), __typename: 'Responsive_computed'},
      is: {...getIs(mediaType, breakpoints), __typename: 'Responsive_computed'},
      mediaType,
      orientation,
    }
  }
}
