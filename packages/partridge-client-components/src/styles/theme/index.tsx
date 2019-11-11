/**
 * Define the theme here
 *
 *  - theming in RNP - https://tinyurl.com/y25rrr94
 *  - Default theme here - https://tinyurl.com/y23dawtw
 *  - Under the covers it uses this library for theming - https://tinyurl.com/y3ny7h42
 */

import {useTheme as RNPUseTheme} from 'react-native-paper'
// import {DefaultTheme, DarkTheme, useTheme as RNPUseTheme} from 'react-native-paper'

import {Theme} from './__types__'

// export const theme: Theme = {
//   ...DefaultTheme,
//   // ...DarkTheme,
//   mode: 'adaptive',
// }
// export const darkTheme: Theme = {
//   ...DarkTheme,
//   mode: 'adaptive',
// }

export {defaultTheme} from './themes/default-theme'

export * from './__types__'

export const useTheme = RNPUseTheme as (overrides?: DeepPartial<Theme> | undefined) => Theme



// export {
//   Theme
// }

// export {
//   useTheme
// }
