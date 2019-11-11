#!/usr/bin/env node

import nsg, {Option} from 'node-sprite-generator'
import chalk from 'chalk'
import path from 'path'

const configArr: Option[] = require(`${process.cwd()}/.spritesheets.ts`)

// const util = require('util')
// console.log('configArr', util.inspect(configArr, {showHidden: false, depth: null, colors: true}));

const patchOption = (aConfig: Option) => {
  // js styles aren't working as described - https://tinyurl.com/y5e2p49a
  if (aConfig.stylesheet === 'javascript') {
    aConfig.stylesheet = path.resolve(__dirname, '../../src/javascript.tpl')
  }
}

configArr.forEach(aConfig => {
  console.log(chalk.green(`processing directory: ${aConfig.src}`))

  patchOption(aConfig)
  nsg(aConfig, error => {
    if (error) {
      console.error('Failed to generate spritesheet')
      console.error(chalk.red(error.message))
      console.trace()
    }
  })
  console.log(chalk.magenta(`Created ${aConfig.spritePath}`))
})
