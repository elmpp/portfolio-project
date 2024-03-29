import React from 'react'
import {View} from 'react-native'
import {useSpring} from 'react-spring/native'
import {getSpringPropsConfig} from '../animated/spring/helpers'
import {SpringAnimatedView} from '../animated/spring/spring-animated-view'
import {useTheme} from '../../styles'

export const progressBarHeight = 1

export interface ProgressBarProps {
  color?: string
  indeterminate?: boolean
  indeterminateSize?: number
  progress?: number
}

export const ProgressBar = React.memo((props: ProgressBarProps) => {
  const {
    color,
    indeterminate: _indeterminate,
    indeterminateSize = 90,
    progress: _progress,
  } = props

  const indeterminate = !!(_indeterminate || typeof _progress !== 'number')
  const progress = indeterminate ? 100 : typeof _progress === 'number' ? Math.min(Math.max(0, _progress), 100) : 0

  const theme = useTheme()

  const springAnimatedStyles = useSpring<any>({
    config: getSpringPropsConfig(),
    from: {
      left: '0%',
      width: '0%',
    },
    to: async (next: any) => {
      while (1) {
        if (indeterminate) {
          await next({
            immediate: true,
            left: `-${indeterminateSize}%`,
            width: `${indeterminateSize}%`,
          })
          await next({immediate: false})

          await next({
            left: '100%',
            width: `${indeterminateSize}%`,
          })

          // await next({
          //   left: `-${indeterminateSize}%`,
          //   width: `${indeterminateSize}%`,
          // })

          continue
        }

        await next({left: '0%', width: `${progress}%`})
      }
    },
  })

  return (
    <View style={{width: '100%', height: progressBarHeight, overflow: 'hidden'}}>
      <SpringAnimatedView
        style={{
          top: 0,
          bottom: 0,
          left: springAnimatedStyles.left,
          width: springAnimatedStyles.width,
          height: progressBarHeight,
          backgroundColor: color || theme.colors.primary,
        }}
      />
    </View>
  )
})

ProgressBar.displayName = 'ProgressBar'
