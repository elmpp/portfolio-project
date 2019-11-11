import React, { ReactNode, useEffect, useLayoutEffect } from 'react'
import {
  KeyboardAvoidingView,
  StatusBar,
  StyleProp,
  StyleSheet,
  View,
  ViewStyle,
} from 'react-native'
import SplashScreen from 'react-native-splash-screen'

// import { Theme, ThemeColors } from '@devhub/core'
import { Platform } from '../../../libs/platform'
// import { getColumnHeaderThemeColors } from '../columns/ColumnHeader'
import { useTheme, Theme } from '../../../styles'
import { SafeAreaView } from '../../../libs/safe-area-view'
// import { ThemedSafeAreaView } from '../themed/ThemedSafeAreaView'
// import { ThemedView } from '../themed/ThemedView'
import { ConditionalWrap } from '../../../hoc/conditional-wrap'

export interface ScreenProps {
  children?: ReactNode
  statusBarBackgroundColor?: string
  style?: StyleProp<ViewStyle>
  useSafeArea?: boolean
}

const styles = StyleSheet.create({
  wrapper: {
    flex: 1,
  },
  container: {
    flex: 1,
  },
})

export function Screen(props: ScreenProps) {
  const {
    statusBarBackgroundColor,
    useSafeArea = true,
    style,
    ...viewProps
  } = props

  const theme = useTheme()

  useLayoutEffect(() => {
    updateThemeForEnv({
      statusBarBackgroundColor,
      theme,
    })
  }, [statusBarBackgroundColor, theme])

  useEffect(() => {
    if (SplashScreen) {
      SplashScreen.hide()
    }
  }, [])

  return (
    <ConditionalWrap
      condition
      wrap={children =>
        Platform.select({
          ios: (
            <KeyboardAvoidingView behavior="padding" style={styles.wrapper}>
              {children}
            </KeyboardAvoidingView>
          ),
          default: <View style={styles.wrapper}>{children}</View>,
        })
      }
    >
      {useSafeArea ? (
        <SafeAreaView
          {...viewProps}
          style={[styles.container, style]}
        />
      ) : (
        <View
          {...viewProps}
          style={[styles.container, style]}
        />
      )}
    </ConditionalWrap>
  )
}


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

  StatusBar.setBackgroundColor(color, false)
}