import EVENT_QUERY from '../__graphql__/event-query.graphql'
import React from 'react'
import {EventQuery_eventView as Events, EventQuery} from '../../__types__/graphql/EventQuery'
import { QueryHookOptions, useQuery } from 'react-apollo-hooks';

const styles = {

}

interface ComparisonGridProps<TVariables = any> extends QueryHookOptions<TVariables> {
  data: EventQuery
}

export const ComparisonGrid = (_props: ComparisonGridProps) => {
  const {data, loading, error} = useQuery(EVENT_QUERY)

  if (error) return <div>Error...</div>
  if (loading) return <div>Loading...</div>
  if (!data) return <div>Not found...</div>

  return 
}