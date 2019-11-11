/**
 * Supplies the Context Provider for react-native-paper (allowing theming etc)
 *
 *  - bit hacky atm - waiting for dynamic theme switching - https://tinyurl.com/y5h52fgp
 */

import * as React from 'react'
import {ThemeProvider, defaultTheme} from 'partridge-client-components'
import {DecoratorFunction} from '../__types__'
import {select} from '@storybook/addon-knobs' // knobs - https://tinyurl.com/y3qbsptb
import {Surface} from 'react-native-paper'


export const themeProviderDecorator: DecoratorFunction = storyFn => {
  const themeKnobSelect = select(
    'Theme',
    {
      light: 'light',
      // dark: 'dark',
    },
    'light'
  )
  const RNPProvider: React.FC<any> = ({children}) => (
    <ThemeProvider theme={{light: defaultTheme}[themeKnobSelect]}>
      <Surface
        style={{
          flex: 1,
          flexDirection: 'column',
          justifyContent: 'flex-start',
          alignItems: 'center',
          paddingVertical: 50,
        }}
      >
        {children}
      </Surface>
    </ThemeProvider>
  )

  return <RNPProvider>{storyFn()}</RNPProvider>
}
