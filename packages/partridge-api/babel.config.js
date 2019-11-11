console.log('partridge-api/babel.config.js loaded')

/**
 * Contains all the babel stuff to transpile both /src and the extra modules configured in
 * razzle.config.js
 */
module.exports = api => {
  api.cache(false)
  return {
    presets: ['org-build/babel'],
    plugins: ['lodash'],
  }
}
