import {isRegex} from '../types'

describe('types', () => {
  describe('isRegex', () => {
    it('chooses wisely', () => {
      expect(isRegex(new RegExp("'.something"))).toBeTruthy()
      expect(isRegex(/\.something/)).toBeTruthy()
      expect(isRegex('/.something/')).toBeFalsy()
    })
  })
})
