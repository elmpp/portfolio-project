import {doMatch2TeamsNameSplit} from '../shared'

describe('shared', () => {
  it('doMatch2TeamsNameSplit', () => {
    expect(doMatch2TeamsNameSplit('Liverpool v Tottenham')).toEqual(['liverpool', 'tottenham'])
  })
})
