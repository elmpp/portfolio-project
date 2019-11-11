// apollo resolvers - https://goo.gl/oJ1GNW

// import DIMENSIONS_FRAGMENT from '../__graphql__/DimensionsFragment.graphql'
import DIMENSIONS_QUERY from './__graphql__/dimensions-query.graphql'
import {DimensionsQueryQuery} from '../../__types__/graphql/__generated__/types'
import {Cache} from '../../__types__/apollo'
/**
 * An apollo2 resolver to maintain a local state representation of the dimensions aspect
 * of the apollo-dimensions state.
 */
export default {
  Mutation: {
    // dimensionsObj - http://bit.ly/2ILBWQI
    updateDimensions: (_: any, {dimensionsInput}: {dimensionsInput: DimensionsQueryQuery}, {cache}: {cache: Cache}) => {
      // https://goo.gl/qght29
      cache.writeQuery({
        query: DIMENSIONS_QUERY,
        data: {dimensions: dimensionsInput},
      })
      // cache.writeFragment({
      //   fragment: DIMENSIONS_FRAGMENT,
      //   id: `dimensions`,
      //   data: dimensionsObj,
      // })

      return null // tslint:disable-line
    },
  },
}
