/**
 * Intended to be as low-level as TouchableOpacity but using react-native-paper#TouchableRipple
 * for its design aspect
 *
 *  - RN TouchableOpacity - https://tinyurl.com/yy63dvq5
 *  - RNP TouchableRipple - https://tinyurl.com/y3qzbd4a
 *  - RNW source - https://tinyurl.com/y2u7xh3q
 */

import React from 'react'
// import {TouchableOpacity as TouchableComponent} from 'react-native'
import {TouchableRipple as TouchableComponent} from 'react-native-paper'
import {Touchable, TouchableProps} from './touchable'
import {styleVariables} from '../../../styles'

export type TouchableOpacityProps = Optionalize<TouchableProps, 'TouchableComponent'>

export const TouchableOpacity = React.forwardRef(
  (props: TouchableOpacityProps, ref) => {
    return (
      <Touchable
        ref={ref}
        TouchableComponent={TouchableComponent}
        activeOpacity={props.onPress ? styleVariables.mutedOpacity : 1}
        {...props}
      />
    )
  },
)

TouchableOpacity.displayName = 'TouchableOpacity'
