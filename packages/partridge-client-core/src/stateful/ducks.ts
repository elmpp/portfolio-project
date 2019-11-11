import {ClientStateConfig} from 'apollo-link-state'
import dimensions, {Options as DimensionsOptions} from './dimensions'
import settings, {Options as SettingsOptions} from './settings'

import {Client} from '../__types__'

export type DUCK_NAMES = 'dimensions' | 'settings'

export interface StateShape {
  dimensions: DimensionsOptions // don't use enum here as harder to key within queries
  settings: SettingsOptions
  // dimensions: DimensionsInput // don't use enum here as harder to key within queries
  // settings: SettingsInput
}

export interface Duck {
  // stateShape: any
  resolvers: ClientStateConfig['resolvers'] // the apollo resolvers
  // defaults: Partial<StateShape> // default values for the state slice - https://tinyurl.com/y4av8ol7
  defaults: ValueOf<StateShape> // default values for the state slice - https://tinyurl.com/y4av8ol7
  typeDefs: GRAPHQL_DOCUMENT
  cb?: (client: Client) => void // allows a module to affect the apollo bootstrap
}
export type DuckFun = (options: any) => Duck

export type Ducks = {
  [moduleName in DUCK_NAMES]: DuckFun
}

const ducks: Ducks = {
  dimensions,
  settings,
}

export interface Options {
  dimensions: DimensionsOptions
  settings: SettingsOptions
}

export default ducks
