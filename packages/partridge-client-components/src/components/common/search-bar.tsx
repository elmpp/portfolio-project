/**
 * Search bar for mobile. Should animated expand upon focus
 *
 *  - RNP example - https://tinyurl.com/y3blnso7
 *  - RNP base component source - https://tinyurl.com/y6kdufu3
 */

import React from 'react'
import {SearchBar as LibSearchBar} from '../../libs/search-bar.deleteable'

type SearchBarProps = React.ComponentProps<typeof LibSearchBar> & {}

export const SearchBar: React.FC<SearchBarProps> = props => {
  return (
    <LibSearchBar {...props} icon="magnify" />
  )
}
