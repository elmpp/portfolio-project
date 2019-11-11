/**
 * Horizontally-opening accordion using spring animation
 * Allows for setting a closed size to show some content by default
 *
 *  - devhub production - https://tinyurl.com/y6svr9qm
 *  - react-spring example of animating 'auto' - https://tinyurl.com/y6pmskks
 */

import React, { useCallback, useRef, useState } from 'react'
import { LayoutChangeEvent, ScrollView, View, ViewStyle } from 'react-native'
import { ReactSpringHook, useSpring } from 'react-spring/native'

// import { constants } from '@devhub/core'
import { usePrevious } from '../../../hooks/use-previous'
import { Platform } from '../../../libs/platform'
import { getSpringPropsConfig } from '../../animated/spring/helpers'
import { SpringAnimatedView } from '../../animated/spring/spring-animated-view'

export type Transition = ReactSpringHook

export interface ExpansionPanelProps {
  plane?: 'height' | 'width'
  isOpen?: boolean
  closedSize?: number
  style?: ViewStyle
}

export interface ExpansionPanel {}

export const ExpansionPanel: React.FC<ExpansionPanelProps> = React.memo((props) => {
  const { children, isOpen, plane = 'height', closedSize = 0, style} = props

  const hasCompletedAnimationRef = useRef(false)

  const wasOpen = usePrevious(isOpen)
  const [size, setSize] = useState<number | 'auto'>(isOpen ? 'auto' : closedSize)

  // const immediate = constants.DISABLE_ANIMATIONS
  const animatedStyles = useSpring<any>({
    immediate: false,
    config: getSpringPropsConfig(),
    from: { [plane]: 0 },
    to: { [plane]: isOpen ? size : closedSize },
    // onStart: () => {
    //   hasCompletedAnimationRef.current = false
    // },
    onRest: () => {
      hasCompletedAnimationRef.current = !!isOpen
    },
  })

  const handleContentSizeChange = useCallback(
    (...args: [number, number]) => {
      const val = args[plane === 'width' ? 0 : 1]
      if (size !== val && val > closedSize) setSize(val)
    },
    [size],
  )

  const onLayout = useCallback((e: LayoutChangeEvent) => {
    const { width, height } = e.nativeEvent.layout
    handleContentSizeChange(width, height)
  }, [])

  // const planeStyle = {[plane]:
  //   isOpen && isOpen === wasOpen && hasCompletedAnimationRef.current
  //     ? 'auto'
  //     : animatedStyles[plane].interpolate((value: number | 'auto') =>
  //         value === 'auto' || value > closedSize ? value : closedSize
  //       ),}

  return (
    <SpringAnimatedView
      style={[{
        [plane]:
          isOpen && isOpen === wasOpen && hasCompletedAnimationRef.current
            ? 'auto'
            : animatedStyles[plane].interpolate((value: number | 'auto') =>
                value === 'auto' || value > closedSize ? value : closedSize
              ),
        overflow: 'hidden',
        opacity: closedSize ? 1 : animatedStyles[plane].interpolate((value: number | 'auto') =>
          value === 'auto' || value > 0 ? 1 : 0,
        ),

        // [web] disable keyboard focus for this tree when accordion is collapsed
        ['visibility' as any]: closedSize ? 'visible' : animatedStyles[plane].interpolate(
          (value: number | 'auto') =>
            value === 'auto' || value > closedSize ? 'visible' : 'hidden',
        ),
        // bottom: 0,
        // right: 0,
        // position: isOpen ? 'absolute' : 'relative',
        // position: animatedStyles[plane].interpolate(
        //   (value: number | 'auto') =>
        //     value === closedSize ? 'absolute' : 'relative',
        // ),
      }, style]}
    >
      {Platform.OS === 'web' ? (
        <View onLayout={onLayout} style={{[plane]: isOpen ? 'auto' : '100%', alignSelf: 'flex-start'}}>{children}</View>
      ) : (
        <ScrollView
          horizontal={plane === 'width'}
          bounces={false}
          onContentSizeChange={handleContentSizeChange}
          scrollEnabled={false}
          showsHorizontalScrollIndicator={false}
          showsVerticalScrollIndicator={false}
        >
          {children}
        </ScrollView>
      )}
    </SpringAnimatedView>
  )
})

ExpansionPanel.displayName = 'ExpansionPanel'
