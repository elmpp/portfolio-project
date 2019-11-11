/**
 * For styling properties not covered by SS's standard style prop categories
 *
 *  - SS system() API docs - https://tinyurl.com/y3pdsc9r
 *  - SS reference for existing style prop categories - https://tinyurl.com/yymrm6at
 */

import React from 'react'
import {Theme} from './theme/__types__'


/**
 * Defines a style prop for setting opacity but based on theme's dark mode. Uses
 * an opacity scale that we've defined also
 */
export const opacity = ()


const {
  default: styled,
  // css,
  ThemeProvider: StyledComponentsThemeProvider,
} = styledComponents as styledComponents.ReactNativeThemedStyledComponentsModule<Theme>

const ThemeProvider: React.FC<{theme: Theme}> = ({children, theme}) => (
  <StyledComponentsThemeProvider theme={theme}>
    <ReactNativePaperThemeProvider theme={theme}>
      {children}
    </ReactNativePaperThemeProvider>
  </StyledComponentsThemeProvider>
)

export {
  styled,
  ThemeProvider,
}
