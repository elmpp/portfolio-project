import {FeedSupplierName} from 'partridge-config'
import {ImageBackgroundProps, ViewStyle} from 'react-native'

export interface BookieLogoProps {
  mode?: 'vertical' | 'horizontal' | 'square' | 'circle'
  name: FeedSupplierName
  // imageProps?: Partial<ImageBackgroundProps>
  style?: Partial<ViewStyle>
  imageStyle?: Partial<ImageBackgroundProps>
}
