import {Dimensions, ScaledSize} from 'react-native'
import {Breakpoints} from './__types__'
import {Client} from '../../__types__'
import DIMENSIONS_MUTATION from './__graphql__/dimensions-mutation.graphql'
import _ from 'lodash'
import {DimensionsInput, DimensionsSet, Orientation} from '../../__types__/graphql/__generated__/types'

export const breakpoints: Breakpoints = {
  sm: 411,
  md: 568,
  lg: 768,
  xl: 1024,
  xxl: 1280,
}

/**
 * window here is minus the status and bottom nav bar on android only
 *  - window vs screen - https://tinyurl.com/yxtxm3a5
 */
export const getDimensions = () => calculateInputFromDimensions(Dimensions.get('window'))

/**
 * Updates the story when an eventListener fires
 *  - dimensions docs - https://tinyurl.com/y5vyamr5
 */
export const handler = (client: Client) => {
  Dimensions.addEventListener('change', ({window: windowScaledSize}) => {
    client.mutate({
      mutation: DIMENSIONS_MUTATION, // http://bit.ly/2s42IcC
      variables: {
        // http://bit.ly/2IYmSLy
        dimensionsInput: calculateInputFromDimensions(windowScaledSize),
      },
      // note here that we do not need an update function as apollo will just use the
      // unique identifier (normally __typename and id/_id - http://bit.ly/2JoJepF)
      // however we will define a rule for this `Responsive` type in `dataIdFromObject` when setting up client cache
      // update: () => {} // http://bit.ly/2xprjh1
    })
  })
}

/**
 * Takes a ScaledSize object from the dimensions api and
 * creates a DimensionsInput object with all the breakpoint goodness.
 */
export const calculateInputFromDimensions = (dimensions: ScaledSize): DimensionsInput => {
  const effectiveWidth = dimensions.width
  const effectiveHeight = dimensions.height
  // const effectiveWidth = dimensions.width * dimensions.scale
  // const effectiveHeight = dimensions.height * dimensions.scale

  const orientation = effectiveWidth > effectiveHeight ? Orientation.Landscape : Orientation.Portrait
  // const comparison = (effectiveWidth > effectiveHeight) ? effectiveWidth : effectiveHeight
  const comparison = effectiveWidth

  const breakpointsValArr = Object.values(breakpoints)
  const breakpointsNameArr = Object.keys(breakpoints) as (keyof Breakpoints)[]

  const lessThan: Partial<DimensionsSet> = {
    __typename: 'DimensionsSet',
    xs: false,
  }
  const greaterThan: Partial<DimensionsSet> = {
    __typename: 'DimensionsSet',
    xs: breakpointsValArr[0] <= comparison,
  }
  const is: Partial<DimensionsSet> = {
    __typename: 'DimensionsSet',
    xs: breakpointsValArr[0] > comparison,
  }

  breakpointsNameArr.forEach((name, index) => {
    const breakpointValIndexMinus1 = index === 0 ? -1 : breakpointsValArr[index - 1]
    const breakpointValIndexPlus1 = index === breakpointsNameArr.length - 1 ? Infinity : breakpointsValArr[index + 1]

    lessThan[name] = breakpointsValArr[index] > comparison
    greaterThan[name] = breakpointsValArr[index] <= comparison
    is[name] = breakpointsValArr[index] <= comparison && breakpointValIndexPlus1 > comparison
  })

  return {
    ...dimensions,
    lessThan: lessThan as DimensionsSet,
    greaterThan: greaterThan as DimensionsSet,
    is: is as DimensionsSet,
    orientation,
  }

  // const lessThan = _.transform(breakpoints, (acc, breakpointVal, breakpointName: keyof Breakpoints) => {
  //   acc[breakpointName] = breakpointVal < comparison
  // }, {} as DimensionsSet)

  // const greaterThan = _.transform(breakpoints, (acc, breakpointVal, breakpointName: keyof Breakpoints) => {
  //   acc[breakpointName] = breakpointVal < comparison
  // }, {} as DimensionsSet)
}
