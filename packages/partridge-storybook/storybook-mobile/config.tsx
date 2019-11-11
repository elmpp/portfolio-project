/**
 * This is the module that is imported from a RN project that
 * exports the StorybookUI and loads the stories to be shown.
 *
 * This module was originally created via the auto setup
 *
 * Note that this is client only and _not_ the server
 *
 *  - setup docs (auto) - https://tinyurl.com/y67s8w8c
 *  - setup docs (manual) - https://tinyurl.com/y698y7jj
 *  - @see partridge-client-components/src/routes.tsx
 */

import * as React from 'react'
import {getStorybookUI, configure, addDecorator, addParameters} from '@storybook/react-native'
const {loadStories: storyLoader} = require('./storyLoader')
import {withBackgrounds} from '@storybook/addon-ondevice-backgrounds'

import './rn-addons'

const StorybookUIRoot = getStorybookUI({}) // params - https://tinyurl.com/y4gy6frw

function loadStories() {
  addDecorator(withBackgrounds)
  addParameters({
    backgrounds: [{name: 'twitter', value: '#00aced', default: true}, {name: 'facebook', value: '#3b5998'}],
  })
  storyLoader() // dynamic way of loading stories in RN - https://tinyurl.com/y4b4xmdf
}

configure(loadStories, module)

export default StorybookUIRoot
