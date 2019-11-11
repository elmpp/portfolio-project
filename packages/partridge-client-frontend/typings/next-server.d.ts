import {Config} from 'partridge-config'

declare module "next/config" {
  export interface RuntimeConfig {
    publicRuntimeConfig: Config['frontend']
    serverRuntimeConfig: any
  }
  export default function(): RuntimeConfig
}