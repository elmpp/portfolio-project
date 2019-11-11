/**
 *
 *   - defining stories (using legacy `storiesOf` api) - https://tinyurl.com/y3dx4kdx
 */

import React from 'react'
import {storiesOf} from '../lib'
import {addCommonDecorators, addCommonParameters, VerticalSpace} from './common'
import {TextInput, Button, Searchbar} from 'react-native-paper'
import { Text } from 'react-native'

const storiesDef = storiesOf('React Native Paper', module)
addCommonDecorators(storiesDef, {})
addCommonParameters(storiesDef, {viewport: {defaultViewport: 'iphone6'}})

storiesDef
  .add('Search Bar', () => (
    <Searchbar placeholder="type something..." icon="magnify" />
  ))
  .add('Text Input', () => (
    <TextInput placeholder="type something..." mode='outlined' />
  ))
  .add('Button', () => (
    <Button mode="contained" onPress={() => {}}>
      Something
    </Button>
  ))
