/**
 * _document.js are executed only on the server and gives the ability to alter
 * the Server Side rendered markup
 *
 *  - react-native-web integration - https://tinyurl.com/y3z79akm
 */

import React from 'react'
import Document, {DocumentContext, Head, Main, NextScript} from 'next/document'
import {AppRegistry, Platform} from 'react-native'
// import Icon from 'react-native-vector-icons/dist/MaterialIcons'

// Resolution order
//
// On the server:
// 1. app.getInitialProps
// 2. page.getInitialProps
// 3. document.getInitialProps
// 4. app.render
// 5. page.render
// 6. document.render
//
// On the server with error:
// 1. document.getInitialProps
// 2. app.render
// 3. page.render
// 4. document.render
//
// On the client
// 1. app.getInitialProps
// 2. page.getInitialProps
// 3. app.render
// 4. page.render

// Force Next-generated DOM elements to fill their parent's height
const normalizeNextElements = `
  #__next {
    display: flex;
    flex-direction: column;
    height: 100%;
  }
`

export default class MyDocument extends Document {
  static async getInitialProps({renderPage}: DocumentContext) {
    AppRegistry.registerComponent('Main', () => Main)
    const {getStyleElement} = AppRegistry.getApplication('Main')
    const page = renderPage()
    const styles = [
      <style key="0" dangerouslySetInnerHTML={{__html: normalizeNextElements}} />,
      getStyleElement({}),
    ] as React.ReactElement[]
    return {...page, styles: React.Children.toArray(styles)}
  }

  render() {
    return (
      <html style={{height: '100%'}}>
        <Head>
          <meta name="viewport" content="width=device-width, initial-scale=1" />
        </Head>
        <body style={{height: '100%', overflow: 'hidden'}}>
          <Main />
          {Platform.OS === 'web' ? (
            <style type="text/css">{`
            @font-face {
              font-family: MaterialIcons;
              src: url(${require('react-native-vector-icons/Fonts/MaterialIcons.ttf')});
            }
            `}</style>
            ) : undefined}
          <NextScript />
        </body>
      </html>
    )
  }
}
