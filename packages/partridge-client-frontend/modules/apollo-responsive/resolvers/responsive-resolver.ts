// apollo resolvers - https://goo.gl/oJ1GNW

// import RESPONSIVE_FRAGMENT from '../__graphql__/ResponsiveFragment.graphql'
import RESPONSIVE_QUERY from '../__graphql__/responsive-query.graphql'
import {ResponsiveQuery_responsive} from '../../__types__/graphql/ResponsiveQuery'
import {Cache} from '../../../__types__'

/**
 * An apollo2 resolver to maintain a local state representation of the responsive aspect
 * of the apollo-responsive state.
 */
export default {
  Mutation: {
    // responsiveObj - http://bit.ly/2ILBWQI
    updateResponsive: (_: any, {responsiveObj}: {responsiveObj: ResponsiveQuery_responsive}, {cache}: {cache: Cache}) => {
      // https://goo.gl/qght29
      cache.writeQuery({
        query: RESPONSIVE_QUERY,
        data: {responsive: responsiveObj},
      })
      // cache.writeFragment({
      //   fragment: RESPONSIVE_FRAGMENT,
      //   id: `responsive`,
      //   data: responsiveObj,
      // })

      return null // tslint:disable-line
    },
  },
}
