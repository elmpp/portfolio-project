import {Theme as ReactNativePaperThemeOrig} from 'react-native-paper'
import {Theme as StyledSystemThemeOrig} from 'styled-system'
import {Colors as PrimerColors, Space as PrimerSpace, LineHeights as PrimerLineHeights, FontSizes as PrimerFontSizes} from '@primer/primitives'

type ScaleAliases<K extends string = '', T = string> = DictionaryUnionOptional<T, K> // SS allows us to add references back to scale values - https://tinyurl.com/y5sj2o7x
interface PrimerThemeParts {
  colors: PrimerColors & ScaleAliases<'primaries' | 'accents', string | string[]>
  space: PrimerSpace & ScaleAliases
  lineHeights: PrimerLineHeights & ScaleAliases
  fontSizes: PrimerFontSizes & ScaleAliases
}

export type ReactNativePaperTheme = ReactNativePaperThemeOrig & {
  mode: 'adaptive' | 'exact' // missing in rnp types - https://tinyurl.com/y27qmsc4
}
export type StyledSystemTheme = OmitUnion<StyledSystemThemeOrig, 'colors' | 'space' | 'lineHeights' | 'fontSizes'> & PrimerThemeParts & {
  dark: boolean // this is missing in RNP types
}
export type CustomStyledSystemStyleProps = {
  util: {
    opacity: (scaleKey: number, comparisonColor?: string) => string,
  }
}


export type Theme = Omit<Omit<ReactNativePaperTheme, 'color'>, 'fonts'> & Omit<Omit<StyledSystemTheme, 'color'>, 'fonts'> & {
  mode: 'adaptive' | 'exact' // missing in rnp types - https://tinyurl.com/y27qmsc4
  colors: ReactNativePaperTheme['colors'] & StyledSystemTheme['colors']
  fonts: ReactNativePaperTheme['fonts'] & StyledSystemTheme['fonts']
} & CustomStyledSystemStyleProps

export type ScaleForDarkAndLight<T> = {
  dark: T[]
  light: T[]
}


