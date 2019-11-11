/**
 * This "stateful" package makes the current device dimensions and a "mediaquery"
 * style set of breakpoint flags available in apollo.
 * Supports setting of dimensions explicitly when SSR
 *
 *  - react-native dimensions api - https://tinyurl.com/y5vyamr5
 *  - interesting insight by Necolas re. progressive RNW - https://tinyurl.com/y2aj259m
 *  - breakpoints calculation inspired by - https://tinyurl.com/y4e8a3yt
 */

import resolvers from './resolver'
import typeDefs from './__graphql__/types.graphql'
import {Duck} from '../ducks'
import {DimensionsInput, Dimensions} from '../../__types__/graphql/__generated__/types'
import {getDimensions, handler, calculateInputFromDimensions} from './handler'
import {noop} from 'org-common/util'

export interface Options {
  width?: number
  height?: number
  isSSR: boolean
}

const dimensions = (options: Options): Duck => {
  let defaults: Dimensions
  if (options.isSSR) {
    defaults = calculateInputFromDimensions({
      width: options.width!,
      height: options.height!,
      scale: 1,
      fontScale: 1,
    })
  } else {
    defaults = getDimensions()
  }

  return {
    resolvers,
    defaults: {
      __typename: 'Settings',
      ...defaults,
    },
    typeDefs,
    cb: options.isSSR ? noop : handler, // once apollo is initialised the eventListener will be added
  }
}

export default dimensions
