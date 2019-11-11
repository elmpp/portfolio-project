/**
 * Simple hook to retrieve supply dimensions data from apollo.
 */

import {DIMENSIONS_QUERY, DimensionsQueryQuery} from 'partridge-client-core'
import {useApolloClient} from 'react-apollo'

export const useDimensions = () => {
  const result: DimensionsQueryQuery | null = useApolloClient().readQuery({query: DIMENSIONS_QUERY})
  return result!.dimensions
}
