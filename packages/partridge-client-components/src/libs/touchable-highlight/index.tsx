import React from 'react'
import {TouchableHighlight as RNTouchableHighlight} from 'react-native'
import {withTheme} from 'react-native-paper'
import {Theme} from '../../react-native-paper/__types__'

type TouchableHightlightWrappableProps = React.ComponentProps<typeof RNTouchableHighlight> & {
  theme: Theme
}
const TouchableHightlightWrappable: React.FC<TouchableHightlightWrappableProps> = ({theme, ...otherProps}) => (
  <RNTouchableHighlight underlayColor={theme.colors.disabled} {...otherProps} />
)

export const TouchableHighlight = withTheme(TouchableHightlightWrappable)
