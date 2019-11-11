/**
 * We are defining our theme to be an intersection of RNP theme (which follows Material Design)
 * and styled-system. This is to support the use of RNP components whilst our own design system
 * takes shape
 *
 * Following the advice in Refactoring UI, the RNP
 * primary/accent etc should be [5] of the color scale so have a lighter/darker range = 4
 *
 * The SS scales are taken from Primer Primitives which offer good palettes etc and are designed
 * for use with SS
 *
 *  - styled-system theme docs - https://tinyurl.com/y2bw7yp7
 *  - Primer Primitives - https://tinyurl.com/y6baghts
 *  - Primer Primitives colors - https://tinyurl.com/y2hjbzyh
 *
 *  - theming in RNP - https://tinyurl.com/y25rrr94
 *  - Default RNP theme source - https://tinyurl.com/y23dawtw
 *  - Under the covers RNP uses this library for theming - https://tinyurl.com/y3ny7h42
 *  - Google's Material Design theme generator - https://tinyurl.com/yx9nafee
 *
 *  - DevHub's theme definition - https://tinyurl.com/y2js5rzz
 */

import color from 'color'
import configureFonts from '../fonts'
import _ from 'lodash'
import {colors, space, lineHeights, fontSizes} from '@primer/primitives'
import {opacityCalc} from './utils'

import {Theme, ReactNativePaperTheme, StyledSystemTheme, CustomStyledSystemStyleProps} from '../__types__'

const ssTheme: StyledSystemTheme = {
  dark: false,
  colors,
  space,
  lineHeights,
  fontSizes,
}
// now we can create our aliases that'll be referenced within components
ssTheme.colors.primaries = ssTheme.colors.red
ssTheme.colors.accents = ssTheme.colors.yellow

const rnpTheme: ReactNativePaperTheme = {
  dark: false,
  roundness: 4,
  colors: {
    primary: ssTheme.colors.primaries![5],
    accent: ssTheme.colors.accents![5],
    background: ssTheme.colors.gray[1],
    surface: ssTheme.colors.white,
    error: ssTheme.colors.red[7],
    text: ssTheme.colors.black,
    onBackground: ssTheme.colors.black,
    onSurface: ssTheme.colors.black,
    disabled: color(ssTheme.colors.black)
      .alpha(0.26)
      .rgb()
      .string(),
    placeholder: color(ssTheme.colors.black)
      .alpha(0.54)
      .rgb()
      .string(),
    backdrop: color(ssTheme.colors.black)
      .alpha(0.5)
      .rgb()
      .string(),
    notification: ssTheme.colors.yellow[6],
  },
  // colors: {
  //   primary: '#6200ee',
  //   accent: '#03dac4',
  //   background: '#f6f6f6',
  //   surface: white,
  //   error: '#B00020',
  //   text: black,
  //   onBackground: '#000000',
  //   onSurface: '#000000',
  //   disabled: color(black)
  //   .alpha(0.26)
  //     .rgb()
  //     .string(),
  //   placeholder: color(black)
  //     .alpha(0.54)
  //     .rgb()
  //     .string(),
  //   backdrop: color(black)
  //     .alpha(0.5)
  //     .rgb()
  //     .string(),
  //   notification: pinkA400,
  // },
  fonts: configureFonts(),
  animation: {
    scale: 1.0,
  },

  // additional elements by us ----
  mode: 'adaptive',
}

const themeUtilFuncs: CustomStyledSystemStyleProps = {
  util: {
    opacity: opacityCalc(false, {
      dark: [0, 0.06, 0.12, 0.22, 0.34, 0.5, 0.66, 0.84],
      light: [0, 0.03, 0.06, 0.11, 0.17, 0.25, 0.33, 0.42],
    }),
  },
}

export const defaultTheme: Theme = _.merge(rnpTheme, ssTheme, themeUtilFuncs)

