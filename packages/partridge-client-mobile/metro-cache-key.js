// enables metro to become aware of babel changes etc - https://tinyurl.com/y3xnqdm2

const crypto = require('crypto')
const fs = require('fs')

function getFileHash(file) {
  return crypto
    .createHash('sha1')
    .update(fs.readFileSync(file))
    .digest('hex')
}

const cacheKeyParts = [
  './package.json',
  '../../yarn.lock',
  './babel.config.js',
  /* ... */
].map(file => getFileHash(require.resolve(file)))

module.exports = () =>
  crypto
    .createHash('sha1')
    .update(cacheKeyParts.join('$'))
    .digest('hex')
