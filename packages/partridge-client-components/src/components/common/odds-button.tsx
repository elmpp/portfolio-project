import React from 'react'
import {OutcomeFragmentFragment} from 'partridge-client-core'
import {StyleSheet, ViewStyle} from 'react-native'
import {Button} from './library/button'
import {styleVariables} from '../../styles/variables/small'

type OddsButtonProps = React.ComponentProps<typeof Button> & {
  outcome: OutcomeFragmentFragment
  style?: ViewStyle
}
export const OddsButton: React.FC<OddsButtonProps> = ({outcome, style, ...props}) => {
  return (
    <Button style={style} textStyle={styles.text} round={false} round transparent showBorder {...props}>
      {outcome.odds}
    </Button>
  )
}

const styles = StyleSheet.create({
  text: {
    fontFamily: 'Roboto Condensed',
    fontWeight: '600',
    fontSize: styleVariables.fontScale[4],
  },
})
