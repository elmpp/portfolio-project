/**
 * Main starting point for storybook setups
 *
 *  - storybook docs for config - https://tinyurl.com/y3qnl99a
 *  - storybook addons - https://tinyurl.com/y5kbjx4a
 *  - apollo-storybook-decorator - https://tinyurl.com/y2d2eppk
 */

import React from 'react'
import {configure} from '../lib'

// import centered from '@storybook/addon-centered/react' // https://tinyurl.com/y4o65fey
import '@storybook/addon-console' // https://tinyurl.com/y3948paa

// whydidyourender - https://tinyurl.com/y3ath2vp
if (process.env.NODE_ENV !== 'production') {
  const whyDidYouRender = require('@welldone-software/why-did-you-render')
  whyDidYouRender(React)
}

// automatically import all files ending in *.stories.tsx
const req = require.context('../stories', true, /.story.tsx$/)

function loadStories() {
  req.keys().forEach(filename => req(filename))
}

configure(loadStories, module)
