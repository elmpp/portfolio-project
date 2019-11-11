require('node-libs-react-native/globals') // polyfill RN env - https://tinyurl.com/yyxekw6g
// console.log('process-app :', process);

/**
 * Bootstraps the component tree up to the point where the screens can be pulled
 * in from react-client-component package.
 *
 *  - react-router setup for rn -
 *  - preloading images and fonts - expo docs - https://tinyurl.com/yycdxtlp
 */

import React, {useState} from 'react'
// import Local from './Local'
import {StyleSheet, Image} from 'react-native'
import {Router, ThemeProvider, routesSmall as staticRoutesSmall, RouteDef} from 'partridge-client-components'
import {initApollo, ApolloProvider, LayoutSize} from 'partridge-client-core'
import {Route, BackButton} from 'react-router-native'
import {AppLoading} from 'expo'
import * as Font from 'expo-font'
import {Asset} from 'expo-asset'

const apolloClient = initApollo(
  {},
  {dimensions: {width: 1200, height: 800, isSSR: false}, settings: {layoutSize: LayoutSize.Small}}
)

// console.log('process-app :', process);

const Routes = () => (
  <React.Fragment>
    {staticRoutesSmall.map((route: RouteDef) => (
      <Route key={route.path.replace('/', '')} {...route} />
    ))}
  </React.Fragment>
)

const images: any[] = [
  // require("./assets/images/local-image.png"),
  // "https://images.pexels.com/photos/2157841/pexels-photo-2157841.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
]

const fonts = [
  {
    'Roboto Condensed': require('./assets/fonts/roboto-condensed/RobotoCondensed-Regular.ttf'), // key must match style reference in /partridge-client-components
  },
]

function cacheImages(images: any[]) {
  return images.map(image => {
    if (typeof image === 'string') {
      return Image.prefetch(image)
    } else {
      return Asset.fromModule(image).downloadAsync()
    }
  })
}

function cacheFonts(fonts: {[key: string]: string}[]) {
  return fonts.map(font => Font.loadAsync(font))
}

const loadAssetsAsync = async () => {
  const imageAssets = cacheImages(images)
  const fontAssets = cacheFonts(fonts)

  await Promise.all([...imageAssets, ...fontAssets])
}

export default function App() {
  const [isReady, setReady] = useState(false)

  if (!isReady) {
    return <AppLoading startAsync={loadAssetsAsync} onFinish={() => setReady(true)} onError={console.warn} />
  }

  return (
    <Router>
      <BackButton>
        <ApolloProvider client={apolloClient}>
          <ThemeProvider>
            <Routes />
          </ThemeProvider>
        </ApolloProvider>
      </BackButton>
    </Router>
  )
}

const styles = StyleSheet.create({
  container: {
    // flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
})
