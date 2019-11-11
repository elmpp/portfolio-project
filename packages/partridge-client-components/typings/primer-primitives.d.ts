declare module '@primer/primitives' {
  type Colors = DictionaryUnion<
    string[],
    'gray' | 'blue' | 'green' | 'yellow' | 'orange' | 'red' | 'purple'
  > & {white: string, black: string}
  type Space = number[]
  type FontSizes = number[]
  type LineHeights = DictionaryUnion<number, 'condensedUltra' | 'condensed' | 'default'>

  type Theme = {
    colors: Colors
    space: Space
    typography: {
      fontSizes: FontSizes
      lineHeights: LineHeights
    }
  }

  export const colors: Colors
  export const space: Space
  export const fontSizes: FontSizes
  export const lineHeights: LineHeights

  export const theme: Theme
}
