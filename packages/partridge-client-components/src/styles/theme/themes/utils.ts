import {ScaleForDarkAndLight} from '../__types__'
import colorUtil from 'color'

/**
 * Defines a style prop for setting opacity but based on theme's dark mode. Uses
 * an opacity scale that we're providing
 */
export const opacityCalc = (isDark: boolean, scale: ScaleForDarkAndLight<number>) => (
  scaleKey: number,
  comparisonColor?: string
): string => {
  if (comparisonColor) {
    const comparedColor = colorUtil(comparisonColor)
    return comparedColor
      .alpha(comparedColor.isDark() ? scale.dark[scaleKey] : scale.light[scaleKey])
      .rgb()
      .string()
  }

  return isDark
    ? colorUtil('white')
        .alpha(scale.light[scaleKey])
        .rgb()
        .string()
    : colorUtil('black')
        .alpha(scale.dark[scaleKey])
        .rgb()
        .string()
}
