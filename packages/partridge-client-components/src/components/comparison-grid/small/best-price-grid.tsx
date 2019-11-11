/**
 * Shows the best priced odds across bookies
 */


import React from 'react'
import { OutcomeFragmentFragment } from "partridge-client-core"
import { View, StyleSheet, ViewStyle } from 'react-native'
import { HeaderRow } from './header-row'
import { Icon } from '../../common/icon'
import { sharedStyle } from '../../../styles'
import { styleVariables } from '../../../styles/variables/small'
import {
  bestPriced,
  partitionByField,
} from '../../../collections/outcome-collection'
import { OddsButtonWithIcons } from '../../common/odds-button-with-icons'


interface BestPriceGridProps {
  outcomes: OutcomeFragmentFragment[]
  names: string[]
  width: number
  scrollAtStart: boolean
}

export const BestPriceGrid: React.FC<BestPriceGridProps> = React.memo(({outcomes, names, width, scrollAtStart}) => {


  const partitioned = partitionByField(outcomes, 'name')
  const rows = names.map(name => {
    const bestPricedOutcomes = bestPriced(partitioned[name])
    return <BestPriceGridRow key={`best-price-grid-row-${name}`} outcomes={bestPricedOutcomes} />
  })

  return (
    <View style={[styles.container, {width}]}>
      <View style={styles.innerContainer}>
        <HeaderRow />
        <View style={[sharedStyle.horizontal]}>
          <View style={styles.paddingColumn} />
          <View>{rows}</View>
          <View style={styles.paddingColumn} />
        </View>
      </View>
      <SwipePrompt style={styles.swipePrompt} active={scrollAtStart} />
    </View>
  )
})
BestPriceGrid.displayName = 'BestPriceGrid'

interface BestPriceGridRowProps {
  outcomes: OutcomeFragmentFragment[]
}
const BestPriceGridRow: React.FC<BestPriceGridRowProps> = ({outcomes}) => {
  return (
    <View style={styles.row}>
      <OddsButtonWithIcons outcomes={outcomes} />
    </View>
  )
}

interface SwipePromptProps {
  pulse?: boolean
  style?: ViewStyle
  active: boolean
}
const SwipePrompt: React.FC<SwipePromptProps> = ({pulse, active}) => {
  return (
    <View style={[styles.swipePrompt, pulse ? sharedStyle.interactionPrompt : {}, {width: styleVariables.spacingScale[3]}]}>
      {active && <Icon name="chevron-right" size={styleVariables.spacingScale[3]} />}
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    ...sharedStyle.horizontal,
  },
  innerContainer: {
    ...sharedStyle.flex,
  },
  paddingColumn: {
    ...sharedStyle.flexGrow,
  },
  row: {
    height: styleVariables.listRowHeight,
    ...sharedStyle.horizontalAndVerticallyAligned,
  },
  swipePrompt: {
    ...sharedStyle.horizontalAndVerticallyAligned,
  },
})
