import React from 'react'
import * as express from 'express'
import initApollo from './init-apollo'
import Head from 'next/head'
import {getMarkupFromTree} from 'react-apollo-hooks'
import {Client} from '../../__types__'
import {AppContext} from 'next/app'
import { renderToString } from 'react-dom/server'
import {logger} from 'partridge-logging'
import {NextClassComponent} from 'next'
import _ from 'lodash'
import { MEDIA_SIZES } from '../../modules/apollo-responsive/media-type-constants';

export interface AppProps {
  apolloClient?: Client
  [index: string]: any
}

export const getMediaType = (res: express.Response): MEDIA_SIZES => _.get(res, 'locals.initialResponsiveType', MEDIA_SIZES.infinity)

export default (App: NextClassComponent<any>) => {
  return class Apollo extends React.Component<AppProps> {
    constructor(props: AppProps) {
      super(props)
      this.apolloClient = initApollo({initialState: props.apolloState, staticMediaType: props.staticMediaType})
    }

    apolloClient: Client

    static displayName = 'withApollo(App)'

    static async getInitialProps(appCtx: AppContext) {
      const {Component, router} = appCtx

      // integration with our responsive mediatype library
      const mediaType = appCtx.ctx.res ? getMediaType(appCtx.ctx.res as express.Response) : MEDIA_SIZES.infinity

      const appProps = await App.getInitialProps(appCtx)

      // Run all GraphQL queries in the component tree
      // and extract the resulting data
      const apollo = initApollo({initialState: {}, staticMediaType: mediaType})
      if (!process.browser) {
        try {
          // Run all GraphQL queries
          await getMarkupFromTree({
            renderFunction: renderToString,
            tree: <App
              {...appProps}
              Component={Component}
              router={router}
              apolloClient={apollo}
              staticMediaType={mediaType}
            />,
          })
        } catch (error) {
          // Prevent Apollo Client GraphQL errors from crashing SSR.
          // Handle them in components via the data.error prop:
          // https://www.apollographql.com/docs/react/api/react-apollo.html#graphql-query-data-error
          logger.log('error', 'Error while running `getDataFromTree`', {runtime_label: 'APOLLO', dumpables: {error: [error]}})
        }

        // getDataFromTree does not call componentWillUnmount
        // head side effect therefore need to be cleared manually
        Head.rewind()
      }

      // Extract query data from the Apollo store
      const apolloState = apollo.cache.extract()

      return {
        ...appProps,
        apolloState,
        staticMediaType: mediaType,
      }
    }

    render() {
      return <App {...this.props} apolloClient={this.apolloClient} />
    }
  }
}
