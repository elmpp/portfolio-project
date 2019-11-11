import * as React from 'react'
// import { Ctx } from '@jaredpalmer/after';
import {useQuery} from '@apollo/react-hooks'
import {
  ComparisonGrid as ComparisonGridPresentational,
  ComparisonGridProps as PresentationalProps,
} from '../components/comparison-grid'
import {EventByCanonicalisedNameUniqueQuery} from 'partridge-client-core'
import EVENT_QUERY from '../__graphql__/event-by-canonicalised-name-unique.graphql'
import {withQuery} from '../hoc/with-query'

export const ComparisonGrid = withQuery<
  React.ComponentProps<typeof ComparisonGridPresentational>,
  EventByCanonicalisedNameUniqueQuery
>(ComparisonGridPresentational, EVENT_QUERY)
