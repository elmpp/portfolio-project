/**
 *
 *   - defining stories (using legacy `storiesOf` api) - https://tinyurl.com/y3dx4kdx
 */

import React from 'react'
import {storiesOf} from '../lib'
import {addCommonDecorators, addCommonParameters, VerticalSpace} from './common'
import {Components} from 'partridge-client-components'


const storiesDef = storiesOf('User Components', module)
addCommonDecorators(storiesDef, {})
addCommonParameters(storiesDef, {viewport: {defaultViewport: 'iphone6'}})

storiesDef
  .add('Comparison Grid', () => (
  <Components.ComparisonGridSmall
    variables={{canonicalisedNameUnique: 'tottenham-v-liverpool-2019-06-01-football'}}
    />
  ))

