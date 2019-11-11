import React from 'react';
import { Text } from '../../../libs/text'

import { createSpringAnimatedComponent } from './helpers'

export type SpringAnimatedTextProps = React.ComponentProps<typeof Text>

export const SpringAnimatedText = createSpringAnimatedComponent(Text)
;(SpringAnimatedText as any).displayName = 'SpringAnimatedText'

export type SpringAnimatedText = typeof SpringAnimatedText
