/**
 * TODO - remove as doesn't use context theme
 */

import {StyleSheet, ViewStyle, TextStyle, ImageStyle} from 'react-native'
import {defaultTheme, Theme} from './theme'

type StyleSheetDef<T> = {[P in keyof T]: ViewStyle | TextStyle | ImageStyle}
type StyleSheetCreateArg = (theme: Theme) => StyleSheetDef<any>
export const createStyleSheet = (wrappedFunc: StyleSheetCreateArg) => StyleSheet.create(wrappedFunc(defaultTheme))
