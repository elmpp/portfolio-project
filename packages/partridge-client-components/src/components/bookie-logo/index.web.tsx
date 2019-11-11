/**
 * Represents a bookie logo image, displayable on the web.
 *  - should be responsive (based on apollo dimensions)
 *  - should accept props for vertical/horizontal
 *  - should passthrough usual image props
 */

import * as React from 'react'
import {BookieLogoProps} from './__types__'
import {useSmallDimensions} from '../../hooks/use-small-dimensions'

// we can load all these upfront as webpack's file-loader will only replace with urls
// and not bloat the bundle. We are free to then dynamically create the url below
require('../../../assets/__generated__/spritesheet/allbookies-hz-lg.png')
require('../../../assets/__generated__/spritesheet/allbookies-hz-sm.png')
require('../../../assets/__generated__/spritesheet/allbookies-vt-lg.png')
require('../../../assets/__generated__/spritesheet/allbookies-vt-sm.png')
require('../../../assets/__generated__/spritesheet/allbookies-icon-lg.png')
require('../../../assets/__generated__/spritesheet/allbookies-icon-sm.png')

const nameMap: {[P in NonNullable<BookieLogoProps['mode']>]: string} = {
  horizontal: 'hz',
  vertical: 'vt',
  square: 'icon',
  circle: 'icon',
}

export const BookieLogo: React.FC<BookieLogoProps> = props => {
  let {mode, name, children, style} = props // tslint:disable-line
  const size = useSmallDimensions() ? 'sm' : 'lg'

  const spritesheetSource = require(`../../../assets/__generated__/spritesheet/allbookies-${
    nameMap[mode!]
  }-${size}.png`)
  const spritesheetStyles = require(`../../../assets/__generated__/spritesheet-style/allbookies-${
    nameMap[mode!]
  }-${size}.js`)[`${name}-${mode}`]

  const styles = {
    backgroundSize: 'cover',
    backgroundImage: `url('${spritesheetSource}')`,
    width: spritesheetStyles.width,
    height: spritesheetStyles.height,
    backgroundPositionX: -spritesheetStyles.x,
    backgroundPositionY: -spritesheetStyles.y,
    borderStyle: 'none',
    ...style,
  }

  return <div style={styles as any}>{children}</div>
}

BookieLogo.defaultProps = {
  mode: 'horizontal',
}
