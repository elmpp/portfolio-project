import mediaQuery from 'mediaquery'
import handlers, {HandlerArgs} from '../handlers'
import { Client } from '../../../__types__';
import {breakpoints} from '../../../modules/apollo-responsive/media-type-constants'

require('matchmedia-polyfill') // https://goo.gl/gZQM7R (defers internally to css-mediaquery - http://bit.ly/2Hj6LXc)
const matchMedia = window.matchMedia

jest.mock('../calculate-responsive', () => () => mockResponsiveCalculator)
const mockResponsiveCalculator = jest.fn(() => 'some variables')

describe('handlers', () => {
  describe('smoke tests', () => {
    it('should be a function', () => {
      expect(typeof handlers).toBe('function')
    })
  })
  describe('behaviour', () => {
    let client: Client
    let arg: HandlerArgs

    const addEventListenerSpies = new Map()

    function setup() {
      window.matchMedia = jest.fn((query) => {
        const ret = matchMedia(query)
        addEventListenerSpies.set(query, (ret.addListener = jest.fn()))
        return ret
      })
      window.addEventListener = jest.fn()
      mediaQuery.asObject = jest.spyOn(mediaQuery, 'asObject') as any as typeof mediaQuery.asObject
      client = jest.genMockFromModule('apollo-client')
      client.mutate = jest.fn()
      arg = {
        options: {
          breakpoints,
        },
        window,
        client,
      }
    }

    afterEach(() => {
      jest.clearAllMocks()
    })

    it('attaches a listener onto each mediaQuery as defined by the breakpoints', () => {
      setup()
      handlers(arg)
      expect(addEventListenerSpies.size).toEqual(Object.keys(breakpoints).length) // 2 breakpoints = 3 queries
      addEventListenerSpies.forEach(aSpy => {
        expect(aSpy).toHaveBeenCalled()
      })
    })
    it('adds an event listener for orientation changes', () => {
      setup()
      handlers(arg)
      expect(window.addEventListener).toHaveBeenCalled()
      expect((window.addEventListener as jest.Mock).mock.calls[0][0]).toEqual('orientationchange')
    })
  })
})
