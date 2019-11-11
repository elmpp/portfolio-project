// import {TestHero} from './test-hero'
// import {Provider as ThemeProvider} from 'react-native-paper'
// import {Provider as ThemeProvider} from 'react-native-paper' // needed when bootstrapping in web/mobile
import {defaultTheme, Theme, ThemeProvider} from './styles'

// export * from './react-native-paper/__types__'
export * from './routes'
import {Router} from './libs/router'

import * as Components from './components'
// import * as Containers from './containers'
// import * as Screens from './screens'

export {
  // TestHero,
  ThemeProvider,
  defaultTheme,
  // darkTheme,
  Theme,
  Router,
  Components,
  // Containers,
}
