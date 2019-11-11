/**
 * Layout Decorator
 *
 *  - inspired by this storybook setup - https://tinyurl.com/yxeanqee
 */

import React from 'react'
import {View} from 'react-native'
import {StoryDecorator, DecoratorFunction} from '../__types__'
import color from 'color'

interface LayoutContainerProps {
  story: StoryDecorator
  width: number
}
export const LayoutContainer: DecoratorFunction = storyFn => {
  return (
      <View
        key="layout-decorator"
        style={{
          height: '100vh',
          display: 'flex',
        }}
      >
        {storyFn()}
      </View>
  )
}
