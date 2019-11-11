import {OutcomeFragmentFragment} from 'partridge-client-core'
import {
  discreteByField,
  getByFeedSupplier,
  partitionByField,
  partitionByFeedSupplierAndField,
  bestPriced,
} from '../outcome-collection'
import {FeedSupplierName} from '../../../../partridge-config/src/__types__/config'

describe('outcome-collection', () => {
  const outcomes = [
    {
      canonicalisedName: 'name1',
      feedSupplier: FeedSupplierName.coral,
      oddsDecimal: 1.5,
    },
    {
      canonicalisedName: 'name3',
      feedSupplier: FeedSupplierName.sky,
      oddsDecimal: 5,
    },
    {
      canonicalisedName: 'name2',
      feedSupplier: FeedSupplierName.coral,
      oddsDecimal: 0.5,
    },
    {
      canonicalisedName: 'name3',
      feedSupplier: FeedSupplierName.boylesports,
      oddsDecimal: 5,
    },
  ] as OutcomeFragmentFragment[]

  describe('discreteField', () => {
    it('works', () => {
      expect(discreteByField(outcomes, 'canonicalisedName')).toEqual(['name1', 'name3', 'name2'])
    })
  })

  describe('partitionByField', () => {
    it('works', () => {
      const expected = {
        coral: [outcomes[0], outcomes[2]],
        sky: [outcomes[1]],
        boylesports: [outcomes[3]],
      }
      expect(partitionByField(outcomes, 'feedSupplier')).toEqual(expected)
    })
  })

  // describe('partitionByFieldAndFeedSupplier', () => {
  //   it('adds null values for missing feedsuppliers', () => {
  //     const expected = {
  //       name1: {
  //         coral: outcomes[0],
  //         sky: undefined,
  //         boylesports: undefined,
  //       },
  //       name2: {
  //         coral: outcomes[2],
  //         sky: undefined,
  //         boylesports: undefined,
  //       },
  //       name3: {
  //         coral: undefined,
  //         sky: outcomes[1],
  //         boylesports: outcomes[3],
  //       },
  //     }
  //     expect(partitionByFieldAndFeedSupplier(outcomes, 'canonicalisedName')).toEqual(expected)
  //   })
  // })

  describe('partitionByFeedSupplierAndField', () => {
    it('adds null values for missing feedsuppliers', () => {
      const expected = {
        coral: {
          name1: outcomes[0],
          name2: outcomes[2],
          name3: undefined,
        },
        sky: {
          name1: undefined,
          name2: undefined,
          name3: outcomes[1],
        },
        boylesports: {
          name1: undefined,
          name2: undefined,
          name3: outcomes[3],
        },
      }
      expect(partitionByFeedSupplierAndField(outcomes, 'canonicalisedName')).toEqual(expected)
    })
  })

  describe('getByFeedSupplier', () => {
    it('works', () => {
      expect(getByFeedSupplier(outcomes, FeedSupplierName.sky)).toEqual(outcomes[1])
    })
  })

  describe('bestPriced', () => {
    it('works', () => {
      expect(bestPriced(outcomes)).toEqual([outcomes[1], outcomes[3]])
      expect(bestPriced([outcomes[1]])).toEqual([outcomes[1]])
    })
  })
})
