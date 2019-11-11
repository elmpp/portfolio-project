/**
 * A button but spring animated
 *
 *  - devhub production - https://tinyurl.com/y3de83zq
 *  - originally inspired by RN Button, seemingly - https://tinyurl.com/yxway5ps
 *  - theme stuff inspired by RNP Button - https://tinyurl.com/yxway5ps
 */

import React, {useCallback, useLayoutEffect, useRef} from 'react'
import {ViewProps} from 'react-native'
import {AnimatedValue, useSpring} from 'react-spring/native'

import {useHover} from '../../../hooks/use-hover'
import {Platform} from '../../../libs/platform'
import {getSpringPropsConfig} from '../../animated/spring/helpers'
import {
  SpringAnimatedActivityIndicator,
  SpringAnimatedActivityIndicatorProps,
} from '../../animated/spring/spring-animated-activity-indicator'
import {SpringAnimatedText, SpringAnimatedTextProps} from '../../animated/spring/spring-animated-text'
import {
  SpringAnimatedTouchableOpacity,
  SpringAnimatedTouchableOpacityProps,
} from '../../animated/spring/spring-animated-touchable-opacity'
import {SpringAnimatedView} from '../../animated/spring/spring-animated-view'
import {useTheme} from '../../../styles'
import {styleVariables} from '../../../styles'
import color from 'color'
// import {white, black} from '../../../styles/color'

export const defaultButtonSize = 36

export interface ButtonProps extends SpringAnimatedTouchableOpacityProps {
  // backgroundThemeColor?: keyof ThemeColors
  color?: string
  children:
    | string
    | React.ReactNode
    | ((params: {
        springAnimatedStyles: AnimatedValue<{
          touchableBackgroundColor: string
          touchableBorderColor: string
          innerContainerBackgroundColor: string
          textColor: string
        }>
      }) => React.ReactNode)
  contentContainerStyle?: ViewProps['style']
  disabled?: boolean
  fontSize?: number
  // foregroundThemeColor?: keyof ThemeColors
  // hoverBackgroundThemeColor?: keyof ThemeColors
  // hoverForegroundThemeColor?: keyof ThemeColors
  loading?: boolean
  loadingIndicatorStyle?: SpringAnimatedActivityIndicatorProps['style']
  onPress: SpringAnimatedTouchableOpacityProps['onPress']
  round?: boolean
  showBorder?: boolean
  size?: number | null
  style?: SpringAnimatedTouchableOpacityProps['style']
  textStyle?: SpringAnimatedTextProps['style']
  transparent?: boolean
  uppercase?: boolean
}

export const Button: ReactFCSpecifyChildren<ButtonProps> = React.memo(props => {
  const {
    // backgroundThemeColor,
    color: buttonColor,
    children,
    contentContainerStyle,
    disabled,
    fontSize,
    // foregroundThemeColor,
    // hoverBackgroundThemeColor,
    // hoverForegroundThemeColor,
    loading,
    loadingIndicatorStyle,
    round = false,
    showBorder,
    size: _size,
    style,
    textStyle,
    transparent,
    uppercase = true,
    ...otherProps
  } = props

  const theme = useTheme()

  const size = typeof _size === 'number' || _size === null ? _size || undefined : styleVariables.buttonSize

  const cacheRef = useRef({
    isHovered: false,
    isPressing: false,
  })

  const getStyles = useCallback(
    ({forceImmediate}: {forceImmediate: boolean}) => {
      const {isHovered: _isHovered, isPressing} = cacheRef.current

      const isHovered = _isHovered && !disabled

      const immediate =
        forceImmediate ||
        // constants.DISABLE_ANIMATIONS ||
        Platform.realOS !== 'web'

      // const backgroundColor = getThemeColorOrItself(
      //   theme,
      //   backgroundThemeColor || 'backgroundColorLess2',
      // )!
      const backgroundColor = buttonColor || theme.colors.primary
      // RNP calculate dynamic color - https://tinyurl.com/y3bezccf
      const hoverBackgroundColor =
        (transparent && backgroundColor) ||
        color(backgroundColor)
          .alpha(theme.dark ? 0.32 : 0.2)
          .rgb()
          .string()

      // const hoverBackgroundColor = getThemeColorOrItself(
      //   theme,
      //   hoverBackgroundThemeColor ||
      //     (transparent && backgroundThemeColor) ||
      //     (!backgroundThemeColor && 'backgroundColorLess4') ||
      //     undefined,
      // )
      const foregroundColor =
        (disabled &&
          color(theme.dark ? white : black)
            .alpha(0.32)
            .rgb()
            .string()) ||
        (transparent && (buttonColor || theme.colors.primary)) ||
        (!transparent && theme.dark ? white : color(backgroundColor).isDark() ? white : black)

      // const foregroundColor =
      //   (!transparent &&
      //     `${backgroundColor}`.toLowerCase() === `${theme.primaryBackgroundColor}`.toLowerCase() &&
      //     theme.primaryForegroundColor) ||
      //   (foregroundThemeColor && getThemeColorOrItself(theme, foregroundThemeColor)) ||
      //   (transparent
      //     ? Math.abs(getLuminance(backgroundColor) - getLuminance(theme.foregroundColor)) <= 0.5
      //       ? backgroundColor
      //       : isHovered || isPressing
      //       ? theme.foregroundColor
      //       : theme.foregroundColorMuted60
      //     : theme.foregroundColor)

      const hoverForegroundColor = color(color(hoverBackgroundColor).isDark ? white : foregroundColor)
        .alpha(0.6)
        .rgb()
        .string()

      // const hoverForegroundColor =
      //   (`${hoverBackgroundColor || (transparent && backgroundColor) || ''}`.toLowerCase() ===
      //     `${theme.primaryBackgroundColor}`.toLowerCase() &&
      //     theme.primaryForegroundColor) ||
      //   (hoverForegroundThemeColor && getThemeColorOrItself(theme, hoverForegroundThemeColor)) ||
      //   foregroundColor

      const textColor = isHovered || isPressing ? hoverForegroundColor : foregroundColor

      return {
        config: getSpringPropsConfig(),
        immediate,
        touchableBackgroundColor: transparent
          ? isHovered || isPressing
            ? backgroundColor
            : color(backgroundColor)
                .alpha(0)
                .rgb()
                .string()
          : backgroundColor,
        touchableBorderColor: isHovered || isPressing ? hoverBackgroundColor || backgroundColor : backgroundColor,
        innerContainerBackgroundColor:
          isHovered || isPressing
            ? hoverBackgroundColor ||
              (transparent
                ? color(backgroundColor)
                    .alpha(0)
                    .rgb()
                    .string()
                : color(textColor)
                    .alpha(0.1)
                    .rgb()
                    .string())
            : color(transparent ? hoverBackgroundColor || backgroundColor : backgroundColor)
                .alpha(0)
                .rgb()
                .string(),
        textColor,
      }
    },
    [
      // backgroundThemeColor,
      disabled,
      // foregroundThemeColor,
      // hoverBackgroundThemeColor,
      // hoverForegroundThemeColor,
      showBorder,
      theme,
      transparent,
    ]
  )

  const [springAnimatedStyles, setSpringAnimatedStyles] = useSpring<ReturnType<typeof getStyles>>(() =>
    getStyles({forceImmediate: true})
  )

  const updateStyles = useCallback(
    ({forceImmediate}: {forceImmediate: boolean}) => {
      setSpringAnimatedStyles(getStyles({forceImmediate}))
    },
    [getStyles]
  )

  const touchableRef = useRef(null)
  const initialIsHovered = useHover(touchableRef, isHovered => {
    cacheRef.current.isHovered = isHovered
    updateStyles({forceImmediate: false})
  })
  cacheRef.current.isHovered = initialIsHovered

  useLayoutEffect(() => {
    updateStyles({forceImmediate: true})
  }, [updateStyles])

  return (
    <SpringAnimatedTouchableOpacity
      ref={touchableRef}
      {...otherProps}
      activeOpacity={Platform.realOS !== 'web' ? 1 : otherProps.activeOpacity}
      disabled={disabled}
      onPressIn={() => {
        if (Platform.realOS === 'web') return

        cacheRef.current.isPressing = true
        updateStyles({forceImmediate: true})
      }}
      onPressOut={() => {
        if (Platform.realOS === 'web') return

        cacheRef.current.isPressing = false
        updateStyles({forceImmediate: true})
      }}
      style={[
        {
          height: size,
          backgroundColor: springAnimatedStyles.touchableBackgroundColor,
          borderColor: springAnimatedStyles.touchableBorderColor,
          borderWidth: showBorder ? 1 : 0,
          borderRadius: round ? (size || defaultButtonSize) / 2 : 0,
        },
        style,
      ]}
    >
      <SpringAnimatedView
        style={[
          {
            flex: 1,
            alignItems: 'center',
            justifyContent: 'center',
            height: size,
            paddingHorizontal: styleVariables.spacingScale[3],
            backgroundColor: springAnimatedStyles.innerContainerBackgroundColor,
            borderWidth: 0,
            borderRadius: round ? (size || defaultButtonSize) / 2 : 0,
          },
          contentContainerStyle,
        ]}
      >
        {loading ? (
          <SpringAnimatedActivityIndicator
            color={springAnimatedStyles.textColor}
            size="small"
            style={loadingIndicatorStyle}
          />
        ) : typeof children === 'string' ? (
          <SpringAnimatedText
            style={[{
              lineHeight: Platform.select({web: fontSize}),
              fontSize,
              fontWeight: '500',
              color: springAnimatedStyles.textColor,
              textTransform: uppercase ? 'uppercase' : 'none',
            }, textStyle]}
          >
            {children}
          </SpringAnimatedText>
        ) : typeof children === 'function' ? (
          children({springAnimatedStyles})
        ) : (
          children
        )}
      </SpringAnimatedView>
    </SpringAnimatedTouchableOpacity>
  )
})

Button.displayName = 'Button'
