import React, { useLayoutEffect } from 'react'
import { StyleProp, StyleSheet, ViewStyle, View } from 'react-native'

// import { Theme, ThemeColors } from '@devhub/core'
// import { getColumnHeaderThemeColors } from '../columns/ColumnHeader'
import { useTheme, Theme } from '../../../styles'
// import { ThemedView } from '../themed/ThemedView'

export interface ScreenProps {
  children?: React.ReactNode
  // statusBarBackgroundThemeColor?: keyof ThemeColors | 'header'
  statusBarBackgroundColor?: string
  style?: StyleProp<ViewStyle>
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
})

export const Screen = React.memo((props: ScreenProps) => {
  const { statusBarBackgroundColor, ...viewProps } = props

  const theme = useTheme()

  useLayoutEffect(() => {
    updateThemeForEnv({
      statusBarBackgroundColor,
      theme,
    })
  }, [statusBarBackgroundColor, theme])

  return (
    <View
      {...viewProps}
      style={[styles.container, props.style]}
    />
    // <ThemedView
    //   {...viewProps}
    //   backgroundColor="backgroundColor"
    //   style={[styles.container, props.style]}
    // />
  )
})

Screen.displayName = 'Screen'

/**
 * Updates themeable elements on this (web) env
 */
function updateThemeForEnv({
  theme,
  statusBarBackgroundColor,
}: {
  theme: Theme
  statusBarBackgroundColor?: string
}) {
  const color =
  statusBarBackgroundColor || theme.colors.background

  const metas = document.getElementsByTagName('meta') as any

  // metas['theme-color'].content = color
  // metas['msapplication-navbutton-color'].content = color

  if (metas['theme-color']) metas['theme-color'].content = color
  if (metas['msapplication-navbutton-color']) metas['msapplication-navbutton-color'].content = color
}
