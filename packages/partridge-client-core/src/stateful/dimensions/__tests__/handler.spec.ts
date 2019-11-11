import {calculateInputFromDimensions} from '../handler'
import {ScaledSize} from 'react-native'
import {DimensionsSetInput} from '../../../__types__/graphql/__generated__/types'

describe('calculateInputFromDimensions', () => {
  it('calculates correctly', () => {
    const inputs: [
      ScaledSize,
      keyof DimensionsSetInput,
      keyof DimensionsSetInput | undefined,
      keyof DimensionsSetInput | undefined
    ][] = [
      [{width: 1, height: 9999, scale: 1, fontScale: 1}, 'xs', 'sm', undefined],
      [{width: 410, height: 9999, scale: 1, fontScale: 1}, 'xs', 'sm', undefined],
      [{width: 411, height: 9999, scale: 1, fontScale: 1}, 'sm', 'md', 'xs'],
      [{width: 1279, height: 9999, scale: 1, fontScale: 1}, 'xl', 'xxl', 'lg'],
      [{width: 1280, height: 9999, scale: 1, fontScale: 1}, 'xxl', undefined, 'xl'],
      [
        {width: 411, height: 9999, scale: 2, fontScale: 1}, // double scale
        'lg',
        'xl',
        'md',
      ],
      [
        {width: 411, height: 99, scale: 1, fontScale: 1}, // orientated
        'sm',
        'md',
        'xs',
      ],
    ]

    inputs.forEach(([scaledSize, expectedIs, expectedLessThan, expectedGreaterThan]) => {
      const ret = calculateInputFromDimensions(scaledSize)
      expect(ret.is[expectedIs]).toBeTruthy()

      if (expectedLessThan) {
        expect(ret.lessThan[expectedLessThan]).toBeTruthy()
      }
      if (expectedGreaterThan) {
        expect(ret.greaterThan[expectedGreaterThan]).toBeTruthy()
      }
    })
  })
})
