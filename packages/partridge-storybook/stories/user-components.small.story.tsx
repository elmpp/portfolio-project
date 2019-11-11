/**
 *
 *   - defining stories (using legacy `storiesOf` api) - https://tinyurl.com/y3dx4kdx
 */

import React from 'react'
import {storiesOf} from '../lib'
import {addCommonDecorators, addCommonParameters, VerticalSpace} from './common'
import {Components} from 'partridge-client-components'
import {MainScreen} from 'partridge-client-components/src/screens'


const storiesDef = storiesOf('Screens', module)
addCommonDecorators(storiesDef, {})
addCommonParameters(storiesDef, {viewport: {defaultViewport: 'iphone6'}})

storiesDef
  .add('Main Screen', () => <PartridgeScreen statusBarBackgroundColor="green" style={{}} />)

const PartridgeScreen: React.FC<any> = props => (
  <MainScreen {...props}>
    <Components.H2>tottenham-v-liverpool</Components.H2>
    <Components.ComparisonGridSmall
      variables={{canonicalisedNameUnique: 'tottenham-v-liverpool-2019-06-01-football'}}
    />
  </MainScreen>
)
