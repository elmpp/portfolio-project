import React from 'react'
import {animated, SpringConfig} from 'react-spring/native'
import {config as springConfig} from 'react-spring'

export function createSpringAnimatedComponent<T extends React.ElementType<any>>(component: T): T {
  return (animated(component) as unknown) as T
}

/**
 * Defines behaviour of react-spring
 *
 *  - presets - https://tinyurl.com/yxo9heg5
 */
export const getSpringPropsConfig = (config?: Partial<SpringConfig>): SpringConfig => ({
  friction: 35,
  tension: 340,
  // ...springConfig.molasses,
  ...config,
})
