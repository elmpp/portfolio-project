
/**
 * RN text input docs - https://tinyurl.com/y62qbexq
 * RN base component source - https://tinyurl.com/y2lgb7fd
 */

import React, { useRef, useState } from 'react'
import {
  TextInput as TextInputOriginal,
  TextInputProps as TextInputOriginalProps,
} from 'react-native'

// import { ThemeTransformer } from '@devhub/core'
import { useHover } from '../../../hooks/use-hover'
// import { contentPadding } from '../../styles/variables'
import { useTheme } from '../../../styles'
import { styleVariables } from '../../../styles/variables/small'
import color from 'color'

export interface TextInputProps extends Omit<TextInputOriginalProps, 'style'> {
  backgroundColor?: string
  backgroundFocusColor?: string
  backgroundHoverColor?: string
  borderColor?: string
  borderFocusColor?: string
  borderHoverColor?: string
  disableBlurOnEsc?: boolean
  fontSize?: number
  placeholderTextColor?: string
  size?: number
  style?: Omit<
    TextInputOriginalProps['style'],
    'backgroundColor' | 'borderColor' | 'color' | 'fontSize' | 'height'
  >
  textColor?: string
  textFocusColor?: string
  textHoverColor?: string
  textInputKey: string
  // themeTransformer?: ThemeTransformer
}

export const defaultTextInputHeight = styleVariables.fontScale[6]

export const TextInput = React.forwardRef(
  (props: TextInputProps, receivedRef: any) => {
    const {
      disableBlurOnEsc,
      fontSize = styleVariables.fontScale[3],
      size = defaultTextInputHeight,
      style,
      textInputKey,
      // themeTransformer,
      ..._otherProps
    } = props

    const [isFocused, setIsFocused] = useState(false)

    const theme = useTheme()

    const fallbackRef = useRef(null)
    const ref = receivedRef || fallbackRef
    const isHovered = useHover(ref)
    const lightPrimary = color(theme.colors.primary).alpha(0.32).rgb().string()

    const {
      backgroundFocusColor,
      backgroundHoverColor,
      backgroundColor: _backgroundColor = 'transparent',
      borderFocusColor = theme.colors.primary,
      borderHoverColor = theme.colors.background,
      borderColor: _borderColor = lightPrimary,
      placeholderTextColor = lightPrimary,
      textFocusColor,
      textHoverColor,
      textColor: _textColor = theme.colors.onSurface,
      ...otherProps
    } = _otherProps

    const backgroundColor =
      (isFocused && backgroundFocusColor) ||
      (isHovered && backgroundHoverColor) ||
      _backgroundColor ||
      'transparent'

    const borderColor =
      (isFocused && borderFocusColor) ||
      (isHovered && borderHoverColor) ||
      _borderColor ||
      'transparent'

    const _color =
      (isFocused && textFocusColor) ||
      (isHovered && textHoverColor) ||
      _textColor ||
      theme.foregroundColor

    return (
      <TextInputOriginal
        key={textInputKey}
        ref={ref}
        placeholderTextColor={placeholderTextColor}
        {...otherProps}
        onBlur={e => {
          setIsFocused(false)
          if (otherProps.onBlur) otherProps.onBlur(e)
        }}
        onFocus={e => {
          setIsFocused(true)
          if (otherProps.onFocus) otherProps.onFocus(e)
        }}
        onKeyPress={e => {
          if (!disableBlurOnEsc && e.nativeEvent.key === 'Escape') {
            if (ref && ref.current && ref.current.blur) ref.current.blur()
          }

          if (otherProps.onKeyPress) otherProps.onKeyPress(e)
        }}
        style={[
          {
            lineHeight: Math.min(fontSize + 4, size),
            height: size,
            margin: 0,
            paddingVertical: 0,
            paddingHorizontal: styleVariables.spacingScale[3],
            borderRadius: size / 2,
            borderWidth: 1,
            fontSize,
          },
          style,
          {
            backgroundColor,
            borderColor,
            color: _color,
          },
        ]}
      />
    )
  },
)

TextInput.displayName = 'TextInput'

