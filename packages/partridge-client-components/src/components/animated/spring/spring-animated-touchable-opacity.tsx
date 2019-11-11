import {TouchableOpacity, TouchableOpacityProps} from '../../common/library/touchable-opacity'
import {createSpringAnimatedComponent} from './helpers'

export interface SpringAnimatedTouchableOpacityProps extends TouchableOpacityProps {}

export const SpringAnimatedTouchableOpacity = createSpringAnimatedComponent(TouchableOpacity)
;(SpringAnimatedTouchableOpacity as any).displayName = 'SpringAnimatedTouchableOpacity'
