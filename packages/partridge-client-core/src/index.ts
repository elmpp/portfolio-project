import initApollo, {mergeDucks} from './apollo/init-apollo'
import {ApolloProvider} from '@apollo/react-hooks'
import {getMarkupFromTree} from '@apollo/react-ssr'
import {calculateInputFromDimensions} from './stateful/dimensions/handler'

import DIMENSIONS_QUERY from './stateful/dimensions/__graphql__/dimensions-query.graphql'
import SETTINGS_QUERY from './stateful/settings/__graphql__/settings-query.graphql'

export * from './__types__/'

export {
  initApollo,
  mergeDucks,
  ApolloProvider,
  getMarkupFromTree,
  DIMENSIONS_QUERY,
  SETTINGS_QUERY,
  calculateInputFromDimensions,
}
