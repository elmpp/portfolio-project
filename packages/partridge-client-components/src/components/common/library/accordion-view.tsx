/**
 * Horizontally-opening accordion using spring animation
 *
 * ! see also ./expansion-panel.tsx as it does what this does
 *
 *  - devhub production - https://tinyurl.com/y6svr9qm
 *  - react-spring example of animating 'auto' - https://tinyurl.com/y6pmskks
 */

import React, { useCallback, useRef, useState } from 'react'
import { LayoutChangeEvent, ScrollView, View } from 'react-native'
import { ReactSpringHook, useSpring } from 'react-spring/native'
import { usePrevious } from '../../../hooks/use-previous'
import { Platform } from '../../../libs/platform'
import { getSpringPropsConfig } from '../../animated/spring/helpers'
import { SpringAnimatedView } from '../../animated/spring/spring-animated-view'

export type Transition = ReactSpringHook

export interface AccordionViewProps {
  plane?: 'height' | 'width'
  isOpen?: boolean
}

export interface AccordionView {}

export const AccordionView: React.FC<AccordionViewProps> = React.memo((props) => {
  const { children, isOpen, plane = 'height'} = props

  const hasCompletedAnimationRef = useRef(false)

  const wasOpen = usePrevious(isOpen)
  const [size, setSize] = useState<number | 'auto'>(isOpen ? 'auto' : 0)

  const animatedStyles = useSpring<any>({
    immediate: false,
    config: getSpringPropsConfig(),
    from: { [plane]: 0 },
    to: { [plane]: isOpen ? size : 0 },
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
      if (size !== val && val > 0) setSize(val)
    },
    [size],
  )

  const onLayout = useCallback((e: LayoutChangeEvent) => {
    const { width, height } = e.nativeEvent.layout
    handleContentSizeChange(width, height)
  }, [])

  return (
    <SpringAnimatedView
      style={{
        [plane]:
          isOpen && wasOpen && hasCompletedAnimationRef.current
            ? 'auto'
            : animatedStyles[plane].interpolate((value: number | 'auto') =>
                value === 'auto' || value > 0 ? value : 0
              ),
        overflow: 'hidden',
        opacity: animatedStyles[plane].interpolate((value: number | 'auto') =>
          value === 'auto' || value > 0 ? 1 : 0,
        ),

        // [web] disable keyboard focus for this tree when accordion is collapsed
        ['visibility' as any]: animatedStyles[plane].interpolate(
          (value: number | 'auto') =>
            value === 'auto' || value > 0 ? 'visible' : 'hidden',
        ),
      }}
    >
      {Platform.OS === 'web' ? (
        <View onLayout={onLayout} style={{alignSelf: 'flex-start'}}>{children}</View>
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

AccordionView.displayName = 'AccordionView'
