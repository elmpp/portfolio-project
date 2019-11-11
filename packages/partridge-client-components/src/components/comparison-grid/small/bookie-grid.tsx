/**
 * Shows columns of individual outcomes
 */

import React from 'react'
import {OutcomeFragmentFragment} from 'partridge-client-core'
import {partitionByFeedSupplierAndField} from '../../../collections/outcome-collection'
import {FeedSupplierName} from 'partridge-config'
import {OddsButton} from '../../common/odds-button'
import {sharedStyle} from '../../../styles'
import {StyleSheet, View} from 'react-native'
import {HeaderRow} from './header-row'
import {DeleteableBookieLogo} from '../../common/deleteable-bookie-logo'
import {styleVariables} from '../../../styles/variables/small'

const gridColumnWidth = 80

interface BookieGridProps {
  outcomes: OutcomeFragmentFragment[]
  width: number
  names: string[]
}
export const BookieGrid: React.FC<BookieGridProps> = React.memo(({outcomes}) => {
  const partitioned = partitionByFeedSupplierAndField(outcomes, 'name')
  const columns = Object.entries(partitioned).map(
    ([feedSupplier, nameMap]: [FeedSupplierName, Dictionary<OutcomeFragmentFragment | undefined>]) => (
      <BookieGridColumn key={`bookie-grid-column-${feedSupplier}`} feedSupplier={feedSupplier} nameMap={nameMap} />
    )
  )

  return <View style={styles.bookieGrid}>{columns}</View>
})
BookieGrid.displayName = 'BookieGrid'

interface BookieGridColumnProps {
  feedSupplier: FeedSupplierName
  nameMap: Dictionary<OutcomeFragmentFragment | undefined>
}
const BookieGridColumn: React.FC<BookieGridColumnProps> = ({feedSupplier, nameMap}) => {
  return (
    <View style={[styles.bookieGrid_column]}>
      <HeaderRow style={styles.bookieGrid_header}>
        <DeleteableBookieLogo mode="square" name={feedSupplier} />
      </HeaderRow>
      {Object.entries(nameMap).map(([name, outcome]) => (
        <BookieGridItem key={`bookie-grid-column-${feedSupplier}-${name}`} outcome={outcome} />
      ))}
    </View>
  )
}

interface BookieGridItemProps {
  outcome: OutcomeFragmentFragment | undefined
}
const BookieGridItem: React.FC<BookieGridItemProps> = ({outcome}) => {
  return (
    <View style={[styles.bookieGrid_item]}>{outcome ? <OddsButton outcome={outcome} /> : null}</View>
  )
}

const styles = StyleSheet.create({
  bookieGrid: {
    ...sharedStyle.flex,
    ...sharedStyle.horizontalAndVerticallyAligned,
  },
  bookieGrid_column: {
    width: gridColumnWidth,
  },
  bookieGrid_header: {
    ...sharedStyle.horizontalAndVerticallyAligned,
    ...sharedStyle.center,
  },
  bookieGrid_item: {
    ...sharedStyle.horizontalAndVerticallyAligned,
    ...sharedStyle.center,
    height: styleVariables.listRowHeight,
  },
})
