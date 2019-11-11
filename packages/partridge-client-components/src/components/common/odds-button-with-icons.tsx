/**
 * Button with an icon stack for same-priced outcomes
 */

import React from 'react'
import { TouchableHighlight } from "../../libs/touchable-highlight"
import { sharedStyle, createStyleSheet } from "../../styles"
import { styleVariables } from "../../styles/variables/small"
import { IconStack } from "../icon-stack"
import { View } from 'react-native'
import { OddsButton } from './odds-button'
import { OutcomeFragmentFragment } from 'partridge-client-core'
import { DeleteableBookieLogo } from './deleteable-bookie-logo'


interface OddsButtonWithIconsProps {
  outcomes: OutcomeFragmentFragment[]
  onPressHandler?: () => {}
}
export const OddsButtonWithIcons: React.FC<OddsButtonWithIconsProps> = ({outcomes, onPressHandler = () => {}}) => {
  return (
    <TouchableHighlight onPress={onPressHandler} style={[styles.oddsButtonWithIcons, {overflow: 'hidden'}]}>
      <View style={[styles.oddsButtonWithIcons_container]}>
        <OddsButton outcome={outcomes[0]} style={{marginRight: styleVariables.spacingScale[3]}} transparent showBorder={false} />
        <IconStack style={styles.iconStack}>
          {outcomes.map(outcome => (
            <DeleteableBookieLogo key={`bookie-logo-${outcome.id}`} mode="circle" name={outcome.feedSupplier} />
          ))}
        </IconStack>
      </View>
    </TouchableHighlight>
  )
}


const styles = createStyleSheet(theme => ({
  oddsButtonWithIcons: {
    borderColor: theme.colors.disabled,
    borderRadius: styleVariables.buttonRadius,
    borderWidth: 1,
    minHeight: 10,
  },
  oddsButtonWithIcons_container: {
    paddingHorizontal: styleVariables.spacingScale[2],
    ...sharedStyle.horizontalAndVerticallyAligned,
  },
}))
