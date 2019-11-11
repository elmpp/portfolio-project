/**
 * styled-components/native styled function source (guts thereof) - https://tinyurl.com/y37qlbwh
 * styled-components/native docs - https://tinyurl.com/y27rtjq7
 * styled-components styled() api for wrapping our (composite) components - https://tinyurl.com/y27rtjq7
 * adding in typescript types = https://tinyurl.com/y3ojs79f
 */

import React from 'react'
import {Provider as ReactNativePaperThemeProvider} from 'react-native-paper'
import * as styledComponents from 'styled-components/native' // the /native isn't absolutely necessary - https://tinyurl.com/y2mucqvu

import {Theme} from './theme/__types__'

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
