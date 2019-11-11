import {pathsToRegExp, pathsToModuleName} from '../util'

describe('util', () => {
  describe('pathsToRegExp', () => {
    it('should create array of regexes', () => {
      const paths = [
        '/Users/matt/dev/partridge/partridge/packages/org-build',
        '/Users/matt/dev/partridge/partridge/packages/org-common',
        'partridge-logging/middleware',
        'webpack/hot/poll?300',
        /\.(eot|woff|woff2|ttf|otf)$/,
      ]
      const expectedSource = [
        'org-build',
        'org-common',
        'partridge-logging\\/middleware',
        'webpack\\/hot\\/poll\\?300',
        '\\.(eot|woff|woff2|ttf|otf)$',
      ]

      const regexesAsSource = pathsToRegExp(paths).map($ => $.source)

      expect(regexesAsSource).toEqual(expectedSource)
    })
  })

  describe('pathsToModuleName', () => {
    it('should create array of names', () => {
      const expected = ['org-build', 'org-common', 'partridge-logging/middleware']
      const paths = [
        '/Users/matt/dev/partridge/partridge/packages/org-build',
        '/Users/matt/dev/partridge/partridge/packages/org-common',
        'partridge-logging/middleware',
      ]

      const regexes = pathsToModuleName(paths)

      expect(regexes).toEqual(expected)
    })
  })
})
