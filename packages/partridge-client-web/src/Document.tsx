import React from 'react'
import {AfterRoot, AfterData} from '@jaredpalmer/after'
import * as AfterJs from './__types__/afterjs'
// import {ThemeProvider} from 'partridge-client-components'
import {Platform} from 'react-native'
import serialize from 'serialize-javascript'

// @todo - look to some better baseline
const globalCss = `
	html, body, #root {
		height: 100%;
		overflow: hidden;
	}
	#root {
		display: flex;
	}
`

class Document extends React.Component<AfterJs.DocumentRenderProps> {
  static async getInitialProps({assets, data, renderPage}: AfterJs.DocumentProps) {
    const page = await renderPage()
    return {assets, data, ...page}
  }

  render() {
    const {helmet, assets, data, apolloState, styleElement, partridgeConfig} = this.props

    // get attributes from React Helmet
    const htmlAttrs = helmet.htmlAttributes.toComponent()
    const bodyAttrs = helmet.bodyAttributes.toComponent()
    // set server apollo state
    const serializedApolloState = serialize(apolloState || '')
    const setApolloStateScript = `window.__APOLLO_STATE__ = ${serializedApolloState};`

    return (
      <html {...htmlAttrs}>
        <head>
          <meta httpEquiv="X-UA-Compatible" content="IE=edge" />
          <meta charSet="utf-8" />
          <title>Welcome to the Afterparty</title>
          <meta name="viewport" content="width=device-width, initial-scale=1" />
          {helmet.title.toComponent()}
          {helmet.meta.toComponent()}
          {helmet.link.toComponent()}
          {styleElement}
          <style>{globalCss}</style>
          // JUST NEED TO IMPORT ICON (SEE CLIENT-COMPONETNS/LIB/VECTOR-ICONS)
          {/* {Platform.OS === 'web' ? (
            <style
              type="text/css"
              dangerouslySetInnerHTML={{
                __html: `
            @font-face {
              font-family: "MaterialCommunityIcons";
              src: url("${require('react-native-vector-icons/Fonts/MaterialCommunityIcons.ttf')}") format("truetype");
            }
          `,
              }}
            />
          ) : (
            undefined
          )} */}
          <script dangerouslySetInnerHTML={{__html: setApolloStateScript}} />
        </head>
        <body {...bodyAttrs}>
          <script
            dangerouslySetInnerHTML={{__html: `window.__CONFIG = '${serialize(partridgeConfig, {isJSON: true})}'`}}
          />
          <AfterRoot />
          <AfterData data={data} />
          <script type="text/javascript" src={assets.client.js} defer={true} crossOrigin="anonymous" />
        </body>
      </html>
    )
  }
}

export default Document
