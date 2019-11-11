/**
 * Here just to mock out the expanded bookies in storybook
 *
 * @todo - delete this etc or add a big webpackable condition
 */

import React from 'react'
import { BookieLogo } from '../bookie-logo'

export const DeleteableBookieLogo: React.FC<React.ComponentProps<typeof BookieLogo>> = props => {
  return (
    <BookieLogo {...props} name={['coral', 'sky', 'boylesports'][Math.floor(Math.random() * 3)] as FeedSupplierName} />
  )
}