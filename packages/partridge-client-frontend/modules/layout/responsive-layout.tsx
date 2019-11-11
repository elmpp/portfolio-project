/**
 * Next.js Layout pattern
 *  - https://goo.gl/zdHPo1
 *  - https://goo.gl/KH8ofa
 *
 * Responsibilities:
 *  - Acts as main body template for site
 *  - As it acts as a decorator for matched Page components, we can clone and provide "common props"
 *  - Can pass in the title which then uses next `Head` component
 */

import React, {FunctionComponent} from 'react'
import Head from 'next/head'
import dynamic from 'next/dynamic'
import Context from './context'
import RESPONSIVE_QUERY from '../apollo-responsive/__graphql__/responsive-query-media-type.graphql'
import {isMobile} from '../apollo-responsive/media-type-constants'
import {ResponsiveQuery} from '../__types__/graphql/ResponsiveQuery'
import UrlLink, { UrlPart } from '../buttons-and-links/url-link'

import {config} from 'partridge-config'
import {useQuery} from 'react-apollo-hooks'

/* eslint-disable no-unused-vars */
const HeaderWeb = dynamic((() => import('../header/components/Header')) as any) // https://goo.gl/cYeZSQ / https://goo.gl/mMDdEd
const HeaderMobile = dynamic((() => import('../header/components-mobile/Header')) as any)
/* eslint-enable no-unused-vars */

type ResponsiveLayoutProps = {
  data: ResponsiveQuery
} & ResponsiveLayoutWithQueryProps

const ResponsiveLayout: React.FunctionComponent<ResponsiveLayoutProps> = props => {
  const {children, title = 'This is the default title', data} = props
  const collapsed = isMobile(data.responsive.mediaType as MEDIA_SIZES)

  return (
    <Context collapsed={collapsed}>
      <Head>
        <title>{title}</title>
        <meta charSet="utf-8" />
        <meta name="viewport" content="minimum-scale=1, initial-scale=1, width=device-width, shrink-to-fit=no" />
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:200,300,400,500" />
      </Head>
      <div>
        <div>{collapsed ? <HeaderMobile /> : <HeaderWeb />}</div>
        <main key="b">
          {children}
          <div />
        </main>
        <aside key="a">This is left gutter</aside>
        <aside key="c">This is right gutter</aside>
        <section>
          <VersionOfApp />
          <br />
          <DomainSwitcher />
        </section>
      </div>
    </Context>
  )
}

interface ResponsiveLayoutWithQueryProps {
  title: string
}

const ResponsiveLayoutWithQuery: FunctionComponent<ResponsiveLayoutWithQueryProps> = props => {
  const {data, error, loading} = useQuery<ResponsiveQuery>(RESPONSIVE_QUERY) // https://tinyurl.com/yyata34g

  if (error) return <div>Error! {error.message}</div>
  if (loading) return <div>Loading...</div>
  if (!data) return <div>Naffin found...</div>

  return <ResponsiveLayout data={data} {...props} />
}

export default ResponsiveLayoutWithQuery

const VersionOfApp = () => {
  const {version} = require('../../package.json')
  return <strong>{version}</strong>
}

const DomainSwitcher = () => {
  return (
    <>
      <UrlLink newHref={config.frontend.FRONTEND_HOST_WWW} newParts={{[UrlPart.PORT]: config.frontend.FRONTEND_HOST_WWW_PORT}}>
        <a>Web</a>
      </UrlLink>
      {`  `}
      <UrlLink newHref={config.frontend.FRONTEND_HOST_WWW_MOBILE} newParts={{[UrlPart.PORT]: config.frontend.FRONTEND_HOST_WWW_PORT}}>
        <a>Mobile</a>
      </UrlLink>
    </>
  )
}
