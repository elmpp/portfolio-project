import React from 'react'
import { View, StyleSheet, ViewStyle } from 'react-native'
import { styleVariables } from '../../../styles/variables/small'

const styles = StyleSheet.create({
  headerRow: {
    minHeight: styleVariables.listRowHeight,
    height: styleVariables.listRowHeight,
  },
})

interface HeaderRowProps {style?: ViewStyle}
export const HeaderRow: React.FC<HeaderRowProps> = ({ children, style }) => {
  return (
    <View style={[styles.headerRow, style]}>{children}</View>
  )
}
