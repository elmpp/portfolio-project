import {StyleVariables} from '../__types__'
import {common} from './common'

export const styleVariables = {
  listRowHeight: 70,
  buttonRadius: 16,
  fontScale: [10, 12, 14, 16, 20, 24, 34, 48, 60, 96], // material design type scale - https://tinyurl.com/ybpluhut
  spacingScale: [0, 4, 8, 16, 32, 64, 128, 256, 512], // spacing scale from styled-system - https://tinyurl.com/y5mtb36p
  buttonSize: 16,
  ...common,
}
