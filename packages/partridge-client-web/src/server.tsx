require('./env-check')
import React from 'react'
import {render} from '@jaredpalmer/after'
import express from 'express'
import MyDocument from './Document'
// import routes from './routes'
import {routesLarge, ThemeProvider} from 'partridge-client-components'
import {AppRegistry} from 'react-native'
import ReactDOMServer from 'react-dom/server'
import {request as requestMiddleware, error as errorMiddleware} from 'partridge-logging/middleware'
import {initApollo, ApolloProvider, getMarkupFromTree, Client as ApolloClient, LayoutSize} from 'partridge-client-core'
import {config, Config} from 'partridge-config'

const assets = require(process.env.RAZZLE_ASSETS_MANIFEST)
let apolloClient: ApolloClient

const reduceConfigForClient = (config: Config): Partial<Config> => ({
  frontend: config.frontend,
  logging: config.logging,
  environment: config.environment,
})

/**
 *  - afterJs customRenderer for wrapping content - https://tinyurl.com/y5qkk6yb
 *  - apollo integration with afterjs/rnw - https://tinyurl.com/y6l6bguv
 */
const customRenderer = async (node: React.ReactElement) => {
  const tree = (
    <ApolloProvider client={apolloClient}>
      <ThemeProvider>{node}</ThemeProvider>
    </ApolloProvider>
  )
  const App = () => tree

  AppRegistry.registerComponent('App', () => App)

  // react-native-web styles collection - https://tinyurl.com/yxpucvpe
  const {element, getStyleElement} = AppRegistry.getApplication('App', {initialProps: {}})

  // const html = ReactDOMServer.renderToString(element)
  const html = await getMarkupFromTree({
    tree,
    renderFunction: ReactDOMServer.renderToString,
  })
  const styleElement = getStyleElement()
  const apolloState = apolloClient.extract()

  return {html, styleElement, apolloState, partridgeConfig: reduceConfigForClient(config)} // these will be available in Document
}

const server = express()
server
  .disable('x-powered-by')
  .use(errorMiddleware)
  .use(requestMiddleware)
  .use(express.static(process.env.RAZZLE_PUBLIC_DIR)) // https://tinyurl.com/yxmubfjo (via https://tinyurl.com/y2jplfcr)
  .get('/*', async (req, res) => {
    // after.js apollo integration - https://tinyurl.com/yxdykg52
    apolloClient = initApollo(
      {},
      {dimensions: {width: 1200, height: 800, isSSR: true}, settings: {layoutSize: undefined}}
    )
    // @todo - add request logging

    try {
      const html = await render({
        req,
        res,
        routes: routesLarge,
        assets,
        customRenderer,
        document: MyDocument, // after.js integration - https://tinyurl.com/y6b7j3te
        // Anything else you add here will be made available
        // within getInitialProps(ctx)
        // e.g a redux store...
      })
      res.send(html)
    } catch (error) {
      console.info('server.js error: ')
      console.error(error)
      res.json(error)
    }
  })

export default server
