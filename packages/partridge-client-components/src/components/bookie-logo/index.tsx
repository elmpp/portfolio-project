/**
 * Represents a bookie logo image, displayable on the web.
 *  - should be responsive (based on apollo dimensions)
 *  - should accept props for vertical/horizontal
 *  - should passthrough usual image props
 */

import * as React from 'react'
import {ImageBackground} from 'react-native'
import {BookieLogoProps} from './__types__'
import {imgs, imgStyles} from './load-generated'
import _ from 'lodash'
import {useSmallDimensions} from '../../hooks/use-small-dimensions'

const nameMap: {[P in NonNullable<BookieLogoProps['mode']>]: string} = {
  horizontal: 'hz',
  vertical: 'vt',
  square: 'square',
  circle: 'circle',
}

export const BookieLogo: React.FC<BookieLogoProps> = props => {
  const size = useSmallDimensions() ? 'sm' : 'lg'

  let {mode, name, children, style, imageStyle} = props // tslint:disable-line

  const imgKeyName = _.camelCase(`${name}-${nameMap[mode!]}-${size}`)

  // console.log('imgs :', imgs);
  // console.log('imgStyles :', imgStyles);
  // console.log('imgKeyName :', imgKeyName);
  // console.log('`${name}-${mode}` :', `${name}-${mode}`);

  const img = imgs[imgKeyName]
  const imgStyle = imgStyles[imgKeyName][`${name}-${mode}`]

  const imageProps = {
    style: {
      width: imgStyle.width,
      height: imgStyle.height,
      ...style,
    },
    imageStyle: {
      // resizeMode: "cover",
      // alignSelf: "flex-end",
      ...imageStyle,
    },
  }

  return (
    <ImageBackground {...imageProps} source={img}>
      {children}
    </ImageBackground>
  )
}

BookieLogo.defaultProps = {
  mode: 'horizontal',
}
