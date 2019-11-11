import * as React from 'react'
import {BuildUrlArgs, buildUrl, UrlPart} from '../../util/url'
import Link from 'next/link' // https://goo.gl/TDMmDr
import { withRouter } from 'next/router'
// import { LinkProps } from 'next-routes';
import { WithRouterProps } from 'next/dist/client/with-router';

// type UrlLinkProps = {newParts?: BuildUrlArgs['newParts'], newHref: string} & {href?: URL} & Partial<LinkProps> & WithRouterProps

// export class UrlLink extends React.Component<UrlLinkProps> {
export class UrlLink extends React.Component<any> {

  getNewHrefUrl(newHref: string): URL {
    try {
      return new URL(newHref)
    }
    catch (error) {
      throw new Error(`Unable to parse newHref. ${JSON.stringify({newHref, message: error.message})}`)
    }
  }
  getHrefUrl(newHref: URL): URL {
    let href, newHrefOrigin
    try {
      href = this.props.router.asPath || ''
      newHrefOrigin = newHref.origin
      
      return new URL(href, newHrefOrigin)
    }
    catch (error) {
      throw new Error(`Unable to parse current href from router. ${JSON.stringify({href, newHref, newHrefOrigin}, (_k, v) => v === undefined ? null : v)}`)
    }
  }
  
  render() {
    let {href, newHref, newParts, router, ...others} = this.props // tslint:disable-line
    const newHrefUrl = this.getNewHrefUrl(newHref)
    href = href || this.getHrefUrl(newHrefUrl)
    const newUrl = buildUrl({href, newHref: newHrefUrl, newParts})
    return <Link href={newUrl} {...others} />
  }
}

export {
  UrlPart as UrlPart
}

export default withRouter(UrlLink)
