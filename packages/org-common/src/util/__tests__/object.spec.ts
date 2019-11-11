import {objectSetPaths} from '../object'

describe('objectSetPaths', () => {
  it('allows overriding of nested values by sets of paths in a typesafe way', () => {
    const defaultValue = {
      something: {
        else: {
          whatever: 'changeable',
        },
      },
      something1: 'changeable',
    }
    const pathVals: [string, any][] = [['something.else.whatever', 'changed'], ['something1', {has: 'changed'}]]

    const mocked = objectSetPaths(defaultValue, pathVals)
    expect(mocked.something.else.whatever).toEqual('changed')
    expect(mocked.something1.has).toEqual('changed')
  })
})
