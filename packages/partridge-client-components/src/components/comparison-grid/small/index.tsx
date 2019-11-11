/**
 * Implementation of the comparison grid, suitable for small viewports
 */

import React, {useState, useCallback, useMemo} from 'react'
import {
  EventByCanonicalisedNameUniqueQuery,
  OutcomeFragmentFragment,
  EventByCanonicalisedNameUniqueQueryVariables,
} from 'partridge-client-core'
import _ from 'lodash'
import {View, StyleSheet, GestureResponderEvent} from 'react-native'
import {Text} from '../../../libs/text'
import {withQuery} from '../../../hoc/with-query'
import EVENT_BY_CANONICALISED_NAME_UNIQUE_QUERY from '../../../__graphql__/event-by-canonicalised-name-unique.graphql'
import {discreteByField} from '../../../collections/outcome-collection'
import {sharedStyle} from '../../../styles'
import {useDimensions} from '../../../hooks/use-dimensions'
import {TouchableOpacity} from '../../common/library/touchable-opacity'
import {LeftColumn} from './left-column'
import {ScrollColumn} from './scroll-column'
// // whydidyourender - https://tinyurl.com/y3ath2vp

const leftColumnWidth = 100


interface OutcomeGridProps {
  outcomes: OutcomeFragmentFragment[]
}

const OutcomeGrid: React.FC<OutcomeGridProps> = ({outcomes}) => {
  const {width: viewportWidth} = useDimensions()
  const [leftColumnExpanded, setLeftColumnExpanded] = useState(false)
  const leftColumnPressHandler = useCallback(() => {
    setLeftColumnExpanded(!leftColumnExpanded)
  }, [leftColumnExpanded])
  const scrollColumnPressHandler = useCallback(
    (e: GestureResponderEvent) => {
      if (leftColumnExpanded) {
        setLeftColumnExpanded(false)
        // e.preventDefault()
      }
    },
    [leftColumnExpanded]
  )

  const discreteDisplayNames = useMemo(() => discreteByField(outcomes, 'name'), [outcomes]) // @todo - add in a displayName
  const rightColumnWidth = useMemo(() => viewportWidth - leftColumnWidth - StyleSheet.hairlineWidth, [viewportWidth])

  return (
    <View style={[styles.container, {width: viewportWidth}]}>
      <LeftColumn
        key="outcome-grid-left-column"
        pressHandler={leftColumnPressHandler}
        names={discreteDisplayNames}
        width={leftColumnWidth}
        isOpen={leftColumnExpanded}
      />
      <TouchableOpacity
        activeOpacity={1}
        onPress={scrollColumnPressHandler}
        style={[styles.rightColumn, {width: rightColumnWidth}]}
        disabled={!leftColumnExpanded}
      >
        <ScrollColumn
          width={rightColumnWidth}
          key="outcome-grid-scroll-column"
          outcomes={outcomes}
          names={discreteDisplayNames}
          disabled={leftColumnExpanded}
        />
      </TouchableOpacity>
    </View>
  )
}

type ComparisonGrid404Props = Disjunction<ComparisonGridProps, EventByCanonicalisedNameUniqueQuery>

const ComparisonGrid404: React.FC<ComparisonGrid404Props> = _props => (
  <View>
  >Noice 404 blaired>
  import {Text} from '../../../libs/text'
  </View>
)

interface ComparisonGridProps extends EventByCanonicalisedNameUniqueQuery {}

const ComparisonGrid: React.FC<ComparisonGridProps> = ({eventByCanonicalisedNameUniqueQuery, ...otherProps}) => {
  if (!eventByCanonicalisedNameUniqueQuery) {
    return <ComparisonGrid404 {...otherProps} />
  }

  return <OutcomeGrid outcomes={_.get(eventByCanonicalisedNameUniqueQuery, 'markets.nodes[0].outcomes.nodes')} />
}

export const ComparisonGridSmall = withQuery<
  ComparisonGridProps,
  EventByCanonicalisedNameUniqueQuery,
  EventByCanonicalisedNameUniqueQueryVariables
>(ComparisonGrid, EVENT_BY_CANONICALISED_NAME_UNIQUE_QUERY)


const styles = StyleSheet.create({
  container: {
    ...sharedStyle.horizontal,
  },
  rightColumn: {
    position: 'absolute',
    right: 0,
    bottom: 0,
    height: 'auto',
    zIndex: 1,
    opacity: 1,
  },
})