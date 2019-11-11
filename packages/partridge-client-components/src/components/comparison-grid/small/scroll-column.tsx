import React, { useState, useCallback } from 'react'
import { OutcomeFragmentFragment } from "partridge-client-core"
import { NativeScrollEvent, NativeSyntheticEvent, ScrollView, StyleSheet } from "react-native"
import { Surface } from "../../../libs/surface"
import { BestPriceGrid } from './best-price-grid'
import { BookieGrid } from './bookie-grid'
import { sharedStyle } from '../../../styles'


interface ScrollColumnProps {
  outcomes: OutcomeFragmentFragment[]
  names: string[]
  width: number
  // pressHandler: (event: GestureResponderEvent) => void
  disabled?: boolean
}
export const ScrollColumn: React.FC<ScrollColumnProps> = React.memo(props => {
  const {width, disabled, ...otherProps} = props

  const [isAtStart, setIsAtStart] = useState(true)

  // example of a scrollHandler - https://tinyurl.com/y249f3os
  const scrollHandler = useCallback(
    (e: NativeSyntheticEvent<NativeScrollEvent>) => {
      if (_.get(e, 'nativeEvent.contentOffset.x') === 0) {
        setIsAtStart(true)
        return
      }
      if (isAtStart === true) {
        setIsAtStart(false)
      }
    },
    [setIsAtStart, isAtStart]
  )
  // const _pressHandler = useCallback(
  //   (e: GestureResponderEvent) => {
  //     if (disabled) {
  //       pressHandler(e)
  //       e.preventDefault()
  //     }
  //   },
  //   [pressHandler, disabled]
  // )

  return (
    <Surface style={[styles.container, disabled && styles.disabled]}>
      <ScrollView
        horizontal
        decelerationRate="fast"
        showsHorizontalScrollIndicator={false}
        snapToAlignment="start"
        snapToOffsets={[width]}
        onScroll={scrollHandler}
        scrollEventThrottle={100}
        // onScrollBeginDrag={scrollBeginDragHandler} // https://tinyurl.com/y6b6wgrj
        // onScrollEndDrag={scrollEndDragHandler}
        snapToEnd={false}
        style={{flex: 1, flexDirection: 'row', width}}
        contentContainerStyle={{flexDirection: 'row', alignItems: 'center'}}
      >
        <>
          <BestPriceGrid scrollAtStart={isAtStart} width={width} {...otherProps} />
          <BookieGrid width={width} {...otherProps} />
        </>
      </ScrollView>
    </Surface>
  )
})
ScrollColumn.displayName = 'ScrollColumn'
ScrollColumn.whyDidYouRender = true


const styles = StyleSheet.create({
  container: {
    ...sharedStyle.activeSurface,
    marginBottom: sharedStyle.activeSurface.elevation, // to match margin bottom of left-column
  },
  disabled: {
    ...sharedStyle.muted,
    elevation: 3,
  },
})
