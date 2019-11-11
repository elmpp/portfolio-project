/**
 *
 *   - defining stories (using legacy `storiesOf` api) - https://tinyurl.com/y3dx4kdx
 */

import React, {useState, useCallback} from 'react'
import {storiesOf} from '../lib'
import {addCommonDecorators, addCommonParameters, VerticalSpace} from './common'
import {Components} from 'partridge-client-components'
import {Text} from 'react-native'

const storiesDef = storiesOf('POCs', module)
addCommonDecorators(storiesDef, {})
addCommonParameters(storiesDef, {viewport: {defaultViewport: 'iphone6'}})

storiesDef
  .add('View Measurer POC', () => <Components.ViewMeasurerPoc />)
  .add('Scroll View POC', () => <Components.ScrollViewPoc />)
  .add('Scroll View Horizontal POC', () => <Components.ScrollViewHorizontalPoc />)
  .add('Search Bar', () => <Components.SearchBar placeholder="Match, Team, Event..." />)
  .add('Styled', () => (
    <Components.StyledPoc
      bg='black'
    >
      <Text style={{color: 'white'}}>Something</Text>
    </Components.StyledPoc>
  ))
