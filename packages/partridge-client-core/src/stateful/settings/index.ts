/**
 * This "stateful" package is meant for holding bucket of values from the server to the
 * client
 */

// import resolvers from './resolver'
import {Duck} from '../ducks'
import typeDefs from './__graphql__/types.graphql'
import {Settings} from '../../__types__/graphql/__generated__/types'
import {noop} from 'org-common/util'

export type Options = Omit<Settings, 'layoutSize'> & {layoutSize: Settings['layoutSize'] | null}

const settings = (options: Options): Duck => {
  return {
    resolvers: [],
    defaults: {
      __typename: 'Settings',
      layoutSize: null,
      ...options,
    },
    typeDefs,
    cb: noop,
  }
}

export default settings
