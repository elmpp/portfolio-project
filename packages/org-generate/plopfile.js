/**
 * This pulls together the plop generators
 *
 *  - plop docs - https://tinyurl.com/y2phrzsg
 */

const {directoryIndex} = require('./dist/directory-index.js')

module.exports = plop => {
  directoryIndex(plop)
}
