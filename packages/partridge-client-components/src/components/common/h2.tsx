import {Headline} from '../../libs/headline'

import React from 'react'
import { StyleSheet } from 'react-native'
import { styleVariables } from '../../styles/variables/small'

type H2Props = React.ComponentProps<typeof Headline> & {}

export const H2: React.FC<H2Props> = props => {
  return (
    <Headline style={styles.container} {...props} />
  )
}

const styles = StyleSheet.create({
  container: {
    // fontSize: styleVariables.fontScale[6],
    // ...sharedStyle.
    fontFamily: 'Roboto Condensed',
    fontWeight: '600',
    fontSize: styleVariables.fontScale[4],
  },
})
