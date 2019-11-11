/**
 * A chip component with logo of the required bookie
 *
 * RNP Chip - https://tinyurl.com/y6l8lanc
 */

import * as React from 'react'
import {ChipProps, Chip} from 'react-native-paper'
import {withQuery} from '../hoc/with-query'
import {BookieLogo} from './bookie-logo'
import {DimensionsQueryQuery, DIMENSIONS_QUERY} from 'partridge-client-core'

interface BookieLogoChipProps {
  bookieLogoProps: React.ComponentProps<typeof BookieLogo>
  chipProps?: ChipProps
  children: ChipProps['children']
}

export const BookieLogoChipComponent: React.FC<BookieLogoChipProps> = props => {
  let {children, bookieLogoProps, chipProps} = props // tslint:disable-line

  return (
    <Chip {...chipProps} avatar={<BookieLogo mode="circle" {...bookieLogoProps} />}>
      {children}
    </Chip>
  )
}

BookieLogoChipComponent.defaultProps = {
  children: 'click me',
}

export const BookieLogoChip = withQuery<BookieLogoChipProps, DimensionsQueryQuery>(
  BookieLogoChipComponent,
  DIMENSIONS_QUERY
)
