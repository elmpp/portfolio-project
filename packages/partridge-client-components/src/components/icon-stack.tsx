/**
 * Creates a stack effect for icons
 *
 *  - inspired by -
 */

import React from 'react'
import {View, StyleSheet, ViewStyle} from 'react-native'
import {sharedStyle} from '../styles'
import {BookieLogoProps} from './bookie-logo/__types__'
import {useSmallDimensions} from '../hooks/use-small-dimensions'

const styles = StyleSheet.create({
  container: {
    // position: 'absolute',
    // ...shared.flex,
    flexDirection: 'row-reverse',
    justifyContent: 'flex-end',
    // width: 30,
    // paddingLeft: 50,
  },
  // icon: {
  //   marginLeft: -25,
  //   position: 'relative',
  //   borderWidth: 1,
  //   borderColor: '#fff',
  //   borderRadius: 4,
  //   overflow: 'hidden',
  //   // width: 50,
  //   // height: 50,
  // },
})

interface IconStackProps {
  children: React.ReactElement<BookieLogoProps>[]
  style?: ViewStyle
}

export const IconStack: React.FC<IconStackProps> = ({children, style}) => {
  const marginWidth = (useSmallDimensions() ? 57 / 2 : 57) / 2

  return (
    <View style={[styles.container, style, {}]}>
      {React.Children.map(children, icon => {
        // console.log('icon.props.style :', icon.props);
        const style: ViewStyle = {
          ...icon.props.style,
          marginLeft: -marginWidth,
          position: 'relative',
          // borderWidth: 1,
          // borderColor: '#fff',
          // borderRadius: 4,
          // overflow: 'hidden',
        }
        return React.cloneElement(icon, {style})
      })}
    </View>
  )
}
