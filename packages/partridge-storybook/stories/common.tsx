import * as React from 'react'
import {StoryApi} from '@storybook/addons'
import {StoryFnReactReturnType} from '@storybook/react/dist/client/preview/types'
import {withKnobs} from '@storybook/addon-knobs' // knobs - https://tinyurl.com/y3qbsptb
import {mockApolloDecorator} from '../decorators/mock-apollo-decorator'
import {themeProviderDecorator} from '../decorators/theme-provider-decorator'
import {LayoutContainer} from '../decorators/layout-container'
import {INITIAL_VIEWPORTS} from '@storybook/addon-viewport'
import {View} from 'react-native'

export const addCommonDecorators = (storyApi: StoryApi<StoryFnReactReturnType>, _options: any = {}) => {
  return storyApi
    .addDecorator(
      mockApolloDecorator({dimensions: {width: 0, height: 0, isSSR: false}, settings: {layoutSize: null}}) // eslint-disable-line
    )
    .addDecorator(withKnobs)
    .addDecorator(themeProviderDecorator)
    .addDecorator(LayoutContainer)
}

export const addCommonParameters = (storyApi: StoryApi<StoryFnReactReturnType>, options: any = {}) => {
  storyApi.addParameters({
    viewport: {
      // https://tinyurl.com/y4f7lv7x
      viewports: INITIAL_VIEWPORTS,
      defaultViewport: 'responsive',
      ...options.viewport,
    },
  })
  return storyApi
}

export const VerticalSpace: React.FC<any> = ({children}) => (
  <View
    style={{
      // height: 500,
      // width: '100%',
      flex: 1,
      flexDirection: 'column',
      justifyContent: 'space-between',
      alignItems: 'center',
      alignContent: 'center',
    }}
  >
    {children}
  </View>
)
