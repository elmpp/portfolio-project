/**
 * After.js latest is 1.3.1 and hasn't release latest typings - https://tinyurl.com/yxod6dr6
 */

import {RouteProps, RouteComponentProps, match as Match} from 'react-router-dom'
import {HelmetData} from 'react-helmet'
import {Request, Response} from 'express'
import {IncomingMessage, ServerResponse} from 'http'
import {History, Location} from 'history'
import {Config} from 'partridge-config'

export interface Assets {
  [name: string]: {
    [ext: string]: string
  }
}

export type EnhancerReturn = {
  html: string
} & Dictionary<any>
type Enhancer = (App: React.ComponentType) => (props: any) => EnhancerReturn

export interface DocumentProps {
  req: Request
  res: Response
  helmet: HelmetData
  assets: Assets
  data: Promise<any>[]
  renderPage: (enhancer?: Enhancer) => Promise<EnhancerReturn>
  match: Match<any> | null
}

// export interface DocumentRenderProps {
//   helmet: HelmetData
//   assets: Assets
//   data: Promise<any>[]
// }

export interface DocumentRenderProps extends Pick<DocumentProps, 'assets' | 'helmet' | 'data'> {
  apolloState: any
  styleElement: React.ReactElement
  partridgeConfig: Config
}

export interface CtxBase {
  req?: IncomingMessage
  res?: ServerResponse
  history?: History
  location?: Location
}
export interface Ctx<P> extends CtxBase {
  match: Match<P>
}
