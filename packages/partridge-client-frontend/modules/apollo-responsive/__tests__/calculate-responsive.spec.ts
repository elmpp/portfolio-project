// http://bit.ly/2Hh0oDK (defers internally to css-mediaquery - http://bit.ly/2Hj6LXc)
import {MEDIA_SIZES} from '../media-type-constants'
import responsiveCalculator, {getLessThan, getGreaterThan, getIs, getOrderMap} from '../calculate-responsive'
import { Options } from "../__types__";

require('matchmedia-polyfill')

export const breakpoints = {
  [MEDIA_SIZES.extraSmall]: 480,
  [MEDIA_SIZES.small]: 768,
  [MEDIA_SIZES.medium]: 992,
  [MEDIA_SIZES.large]: 1200,
  [MEDIA_SIZES.infinity]: Infinity,
}
const defaultOptions: Options = {
  staticMediaType: undefined,
  defaultMediaType: MEDIA_SIZES.infinity,
  breakpoints,
}
const matchMediaSpy = jest.spyOn(window, 'matchMedia')

function setup(options = {}) {
  const optionsWithDefault = {...defaultOptions, ...options}
  return responsiveCalculator(optionsWithDefault)
}

function matchMediaCallsFilter(calls: string[][], regex: RegExp) {
  return calls.reduce((acc, callSet) => {
    if (callSet[0].match(regex)) {
      acc.push(callSet[0])
    }
    return acc
  }, [])
}

describe('responsiveCalculator', () => {
  describe('smoke tests', () => {
    it('returns a function', () => {
      const calculator = setup()
      expect(typeof calculator).toBe('function')
    })
  })

  describe('response object', () => {
    it('does not require a valid (window.)matchMedia argument when staticMediaType is supplied', () => {
      const calculator = setup({staticMediaType: MEDIA_SIZES.large})
      const calculatorArgs = {matchMedia: undefined}

      expect(calculator(calculatorArgs)).toEqual({
        greaterThan: {
          [MEDIA_SIZES.extraSmall]: true,
          [MEDIA_SIZES.small]: true,
          [MEDIA_SIZES.medium]: true,
          [MEDIA_SIZES.large]: false,
          [MEDIA_SIZES.infinity]: false,
          __typename: 'Responsive_computed',
          // __typename: 'responsive_greaterThan',
        },
        is: {
          [MEDIA_SIZES.extraSmall]: false,
          [MEDIA_SIZES.small]: false,
          [MEDIA_SIZES.medium]: false,
          [MEDIA_SIZES.large]: true,
          [MEDIA_SIZES.infinity]: false,
          __typename: 'Responsive_computed',
          // __typename: 'responsive_is',
        },
        lessThan: {
          [MEDIA_SIZES.extraSmall]: false,
          [MEDIA_SIZES.small]: false,
          [MEDIA_SIZES.medium]: false,
          [MEDIA_SIZES.large]: false,
          [MEDIA_SIZES.infinity]: true,
          __typename: 'Responsive_computed',
          // __typename: 'responsive_lessThan',
        },
        mediaType: 'large',
        orientation: 'portrait',
        __typename: 'Responsive',
        // __typename: 'responsive',
      })
    })
  })

  describe('behaviour of calculator', () => {
    it('does no width calculations when staticMediaType option supplied', () => {
      const calc = setup({staticMediaType: 'md'})
      const match = calc(window)
      expect(matchMediaCallsFilter(matchMediaSpy.mock.calls, /^((?!orientation).)*$/)).toHaveLength(0)
      expect(match.mediaType).toEqual('md')
    })
  })
  describe('ancilary functions', () => {
    it('getOrderMap() - correctly orders two breakpoints', () => {
      // the breakpoints to test against
      const breakpointOrdered = getOrderMap({
        [MEDIA_SIZES.extraSmall]: 200,
        [MEDIA_SIZES.small]: 500,
        [MEDIA_SIZES.medium]: 800,
        [MEDIA_SIZES.large]: 1000,
        [MEDIA_SIZES.infinity]: Infinity,
        foo: "custom media query('wfwe')",
      })

      // make sure the larger order is bigger than the smaller
      expect(breakpointOrdered).toEqual({
        [MEDIA_SIZES.extraSmall]: 0,
        [MEDIA_SIZES.small]: 1,
        [MEDIA_SIZES.medium]: 2,
        [MEDIA_SIZES.large]: 3,
        [MEDIA_SIZES.infinity]: 4,
        foo: 5,
      })
    })

    // the breakpoints to test against
    const breakpointsOrdered = {
      [MEDIA_SIZES.extraSmall]: 0,
      [MEDIA_SIZES.small]: 1,
      [MEDIA_SIZES.medium]: 2,
      [MEDIA_SIZES.large]: 3,
      [MEDIA_SIZES.infinity]: 4,
      foo: 'bar',
    }
    // the current media type
    const currentType = MEDIA_SIZES.medium

    it('getLessThan() - can compute the less than object', () => {
      // the expectation lessThan
      const expected = {
        [MEDIA_SIZES.extraSmall]: false,
        [MEDIA_SIZES.small]: false,
        [MEDIA_SIZES.medium]: false,
        [MEDIA_SIZES.large]: true,
        [MEDIA_SIZES.infinity]: true,
        foo: false,
      }
      // make sure the computed lessThan object matches exepctation
      expect(getLessThan(currentType, breakpointsOrdered)).toEqual(expected)
    })

    it('getGreaterThan() - can compute the greater than object', () => {
      // the expectation lessThan
      const expected = {
        [MEDIA_SIZES.extraSmall]: true,
        [MEDIA_SIZES.small]: true,
        [MEDIA_SIZES.medium]: false,
        [MEDIA_SIZES.large]: false,
        [MEDIA_SIZES.infinity]: false,
        foo: false,
      }
      // make sure the computed lessThan object matches exepctation
      expect(getGreaterThan(currentType, breakpointsOrdered)).toEqual(expected)
    })

    it('is() - can compute the is object', () => {
      // the expectation lessThan
      const expected = {
        [MEDIA_SIZES.extraSmall]: false,
        [MEDIA_SIZES.small]: false,
        [MEDIA_SIZES.medium]: true,
        [MEDIA_SIZES.large]: false,
        [MEDIA_SIZES.infinity]: false,
        foo: false,
      }
      // make sure the computed lessThan object matches exepctation
      expect(getIs(currentType, breakpointsOrdered)).toEqual(expected)
    })
  })
})
