/**
 * HOC to abstract the loading/error views during query fetching
 *
 *  - typing and writing HOCs in TS - https://tinyurl.com/y6xm5mkq
 *  - apollo-hooks useQuery docs - https://tinyurl.com/y6asej3l
 */

import React from 'react'
import {useQuery} from 'react-apollo'
import {Text} from '../libs/text'
import {DocumentNode} from 'graphql'

type ComponentProps = any // can supply these with React.ComponentProps<typeof ImportedComponent>
type QueryProps = any // can supply these with React.ComponentProps<typeof ImportedComponent>
type VariableProps = any

export const withQuery = <T extends ComponentProps, U extends QueryProps, V = VariableProps>(
  WrappedComponent: React.ComponentType<T>,
  QUERY: DocumentNode
) => {
  type WithQueryProps = OptionalizeIntersection<T, U> & {
    variables?: V
  }
  const WithQuery: React.FC<WithQueryProps> = ({variables, ...otherProps}) => {
    const {loading, error, data} = useQuery<U>(QUERY, {variables})

    if (loading) return <Text>Loading...</Text>
    if (error) return <Text>Error {`${error.message}`}...</Text>

    // console.log('data :', data);

    return <WrappedComponent {...data!} {...otherProps} />
  }
  // prettier-ignore
  WithQuery.displayName = `WithQuery(${getDisplayName(
    WrappedComponent
  )})`

  return WithQuery
}

function getDisplayName<T>(WrappedComponent: React.ComponentType<T>) {
  return WrappedComponent.displayName || WrappedComponent.name || 'Component'
}
