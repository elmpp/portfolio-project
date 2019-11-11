import {SETTINGS_QUERY} from 'partridge-client-core'
import {useApolloClient} from 'react-apollo'

export const useSettings = () => {
  const result = useApolloClient().readQuery({query: SETTINGS_QUERY})
  return result.settings
}
