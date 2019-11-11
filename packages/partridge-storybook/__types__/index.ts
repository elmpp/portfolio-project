import {DecoratorFunction, StoryFn} from '@storybook/addons'
import {StoryFnReactReturnType} from '@storybook/react/dist/client/preview/types'

export type StoryDecorator = StoryFn<StoryFnReactReturnType>
export type DecoratorFunction = DecoratorFunction<StoryFnReactReturnType>
// export type StoryDecorator = DecoratorFunction<StoryFnReactReturnType>
