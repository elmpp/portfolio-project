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
import {Image, Text} from 'react-native'
import {AppLoading} from 'expo'
import * as Font from 'expo-font'
import {Asset} from 'expo-asset'
import StoryBookUI from 'partridge-storybook/storybook-mobile/config'

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

// export default function App() {
//   const [isReady, setReady] = useState(false)

//   if (!isReady) {
//     return <AppLoading startAsync={loadAssetsAsync} onFinish={() => setReady(true)} onError={console.warn} />
//   }

//   return (
//     <StoryBookUI />
//   )
// }

// must be a class component to support HMR - https://tinyurl.com/y4womlge
export default class App extends React.Component<{}, {isReady: boolean}> {
  constructor(props: any, state: any) {
    super(props, state)
    this.state = {
      isReady: false,
    }
  }

  render() {
    if (!this.state.isReady) {
      return (
        <AppLoading
          startAsync={loadAssetsAsync}
          onFinish={() => this.setState(state => ({...state, isReady: !state.isReady}))}
          onError={console.warn}
        />
      )
    }

    return <StoryBookUI />
    // return <Text>shite shite shite shite shite shite shite shite shite shite shite</Text>;
  }
}
