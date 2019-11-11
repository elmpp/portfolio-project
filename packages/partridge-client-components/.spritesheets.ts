/**
 * Defines the spritesheets to be generated
 *
 *   - node-sprite-generator library used - https://tinyurl.com/y4uoyfo3
 *   - jimp processing engine used - https://tinyurl.com/hhxtyve
 */

import {Option} from 'node-sprite-generator'
// --- !!! ts-node does not support import syntax !!!
const fs = require('fs')
const path = require('path')
const _ = require('lodash')

/**
 * we want to resize our images individually to different scales for use in RN
 * (which doesn't support spritesheet)
 */
const createConfigForIndividual = (): Option[] => {
  const inputs = {
    hz: fs
      .readdirSync('./assets/spriteable/horizontal')
      .map((name: string) => `./assets/spriteable/horizontal/${name}`),
    vt: fs.readdirSync('./assets/spriteable/vertical').map((name: string) => `./assets/spriteable/vertical/${name}`),
    square: fs.readdirSync('./assets/spriteable/square').map((name: string) => `./assets/spriteable/square/${name}`),
    circle: fs.readdirSync('./assets/spriteable/circle').map((name: string) => `./assets/spriteable/circle/${name}`),
  }

  const individualConfig = _.transform(
    inputs,
    (acc: Option[], files: string[], mode: string) => {
      files.forEach(file => {
        const bookieName = path.basename(file).match(/^[^-]+/)
        acc.push({
          src: [file],
          spritePath: path.resolve(__dirname, `assets/__generated__/img/${bookieName}-${mode}-lg.png`),
          stylesheetPath: path.resolve(__dirname, `assets/__generated__/spritesheet-style/${bookieName}-${mode}-lg.js`),
          stylesheet: 'javascript',
          stylesheetOptions: {
            pixelRatio: 1,
          },
          compositor: 'gm',
          compositorOptions: {
            compressionLevel: 6,
          },
          layoutOptions: {
            scaling: 1,
            padding: 0,
          },
        })
        acc.push({
          src: [file],
          spritePath: path.resolve(__dirname, `assets/__generated__/img/${bookieName}-${mode}-sm.png`),
          stylesheetPath: path.resolve(__dirname, `assets/__generated__/spritesheet-style/${bookieName}-${mode}-sm.js`),
          stylesheet: 'javascript',
          stylesheetOptions: {
            pixelRatio: 1,
          },
          compositor: 'gm',
          compositorOptions: {
            compressionLevel: 6,
          },
          layoutOptions: {
            scaling: 0.5,
            padding: 0,
          },
        })
      })
    },
    []
  )

  // console.log('individualConfig :', individualConfig);
  return individualConfig
}

// config format (must be array) - https://tinyurl.com/y3h2ewej
const config: Option[] = [
  ...createConfigForIndividual(), // resizing individual ...
  // sprites ...
  {
    // src: path.resolve(__dirname, './assets/spriteable/horizontal/**/*.{png,gif,jpg}'),
    src: [path.resolve(__dirname, './assets/spriteable/horizontal/*')],
    spritePath: path.resolve(__dirname, 'assets/__generated__/spritesheet/allbookies-hz-lg.png'),
    stylesheetPath: path.resolve(__dirname, 'assets/__generated__/spritesheet-style/allbookies-hz-lg.js'),
    stylesheet: 'javascript',
    stylesheetOptions: {
      pixelRatio: 1,
    },
    compositor: 'gm',
    compositorOptions: {
      compressionLevel: 6,
    },
    layoutOptions: {
      scaling: 1,
      padding: 0,
    },
  },
  {
    src: [path.resolve(__dirname, './assets/spriteable/horizontal/*')],
    spritePath: path.resolve(__dirname, 'assets/__generated__/spritesheet/allbookies-hz-sm.png'),
    stylesheetPath: path.resolve(__dirname, 'assets/__generated__/spritesheet-style/allbookies-hz-sm.js'),
    stylesheet: 'javascript',
    stylesheetOptions: {
      pixelRatio: 1,
    },
    compositor: 'gm',
    compositorOptions: {
      compressionLevel: 6,
    },
    layoutOptions: {
      scaling: 0.5,
      padding: 0,
    },
  },
  {
    src: [path.resolve(__dirname, './assets/spriteable/vertical/*')],
    spritePath: path.resolve(__dirname, 'assets/__generated__/spritesheet/allbookies-vt-lg.png'),
    stylesheetPath: path.resolve(__dirname, 'assets/__generated__/spritesheet-style/allbookies-vt-lg.js'),
    stylesheet: 'javascript',
    stylesheetOptions: {
      pixelRatio: 1,
    },
    compositor: 'gm',
    layoutOptions: {
      scaling: 1,
      padding: 0,
    },
  },
  {
    src: [path.resolve(__dirname, './assets/spriteable/vertical/*')],
    spritePath: path.resolve(__dirname, 'assets/__generated__/spritesheet/allbookies-vt-sm.png'),
    stylesheetPath: path.resolve(__dirname, 'assets/__generated__/spritesheet-style/allbookies-vt-sm.js'),
    stylesheet: 'javascript',
    stylesheetOptions: {
      pixelRatio: 1,
    },
    compositor: 'gm',
    layoutOptions: {
      scaling: 0.5,
      padding: 0,
    },
  },
  {
    src: [
      path.resolve(__dirname, './assets/spriteable/square/*'),
      path.resolve(__dirname, './assets/spriteable/circle/*'),
    ],
    spritePath: path.resolve(__dirname, 'assets/__generated__/spritesheet/allbookies-icon-lg.png'),
    stylesheetPath: path.resolve(__dirname, 'assets/__generated__/spritesheet-style/allbookies-icon-lg.js'),
    stylesheet: 'javascript',
    stylesheetOptions: {
      pixelRatio: 1,
    },
    compositor: 'gm',
    layoutOptions: {
      scaling: 1,
      padding: 0,
    },
  },
  {
    src: [
      path.resolve(__dirname, './assets/spriteable/square/*'),
      path.resolve(__dirname, './assets/spriteable/circle/*'),
    ],
    spritePath: path.resolve(__dirname, 'assets/__generated__/spritesheet/allbookies-icon-sm.png'),
    stylesheetPath: path.resolve(__dirname, 'assets/__generated__/spritesheet-style/allbookies-icon-sm.js'),
    stylesheet: 'javascript',
    stylesheetOptions: {
      pixelRatio: 1,
    },
    compositor: 'gm',
    layoutOptions: {
      scaling: 0.5,
      padding: 0,
    },
  },
]

module.exports = config
