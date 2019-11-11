import {ClientStateConfig} from 'apollo-link-state'
import {Client} from '../__types__'
import {ResponsiveQuery_responsive} from './__types__/graphql/ResponsiveQuery'
import {DocumentNode} from 'graphql'

export enum DUCK_NAMES {
  Responsive = 'responsive',
}
export interface StateShape {
  responsive: ResponsiveQuery_responsive // don't use enum here as harder to key within queries
}

export interface Duck {
  // stateShape: any
  resolvers: ClientStateConfig['resolvers'] // the apollo resolvers
  defaults: Partial<StateShape> // default values for the state slice - https://tinyurl.com/y4av8ol7
  typeDefs: DocumentNode | string // the graphql types. @todo - can this be better typed
  cb?: (client: Client) => Client // allows a module to affect the apollo bootstrap
}
export interface Ducks {
  [moduleName: string]: Duck
}
