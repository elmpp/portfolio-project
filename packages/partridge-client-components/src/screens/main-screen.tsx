import {Screen} from '../components/common/screen'

import React from 'react'
import {View, StyleSheet, ViewStyle} from 'react-native'
import {useDimensions} from '../hooks/use-dimensions'
import { Orientation } from 'partridge-client-core'

interface MainScreenProps {
  statusBarBackgroundColor: string
  style?: ViewStyle
}
export const MainScreen: React.FC<MainScreenProps> = ({statusBarBackgroundColor, children, style}) => {
  const {orientation} = useDimensions()

  return (
    <Screen style={style} statusBarBackgroundColor={statusBarBackgroundColor} useSafeArea={false}>
      <View
        style={[
          styles.container,
          {
            flexDirection: orientation === Orientation.Landscape ? 'row' : 'column',
          },
        ]}
      >{children}</View>
    </Screen>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  innerContainer: {
    flex: 1,
    flexDirection: 'row',
  },
})
