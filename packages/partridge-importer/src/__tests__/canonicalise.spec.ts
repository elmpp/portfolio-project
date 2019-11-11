import {canonicalise} from '../canonicalise'

describe('canonicalise', () => {
  it('does its thing', () => {
    const testMap = [
      ['FOOTBALL', 'football'],
      ['UFC / MMA', 'ufc-mma'],
      ['UFC&MMA', 'ufc-mma'],
      [' UFC---MMA', 'ufc-mma'],
      [' UFC--MMA-', 'ufc-mma'],
      ['up 50% this year)', 'up-50-this-year'],
      ['trailing-)', 'trailing'],
      [')(^&£$@!', ''],
      ['   A   ', 'a'],
      [
        'West Brom to score 1+ goals, 4+ corners each team and 30+ West Brom booking pts',
        'west-brom-to-score-1+-goals-4+-corners-each-team-and-30+-west-brom-booking-pts',
      ],
      ['uniCode ♥ is ☢', 'unicode-love-is-radioactive'], // https://goo.gl/L486PP
    ]

    testMap.forEach(([before, expected]) => {
      expect(canonicalise(before)).toEqual(expected)
    })
  })
})
