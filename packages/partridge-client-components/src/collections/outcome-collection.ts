import {OutcomeFragmentFragment} from 'partridge-client-core'
import _ from 'lodash'
import {FeedSupplierName} from 'partridge-config'

export const discreteByField = <T extends OutcomeFragmentFragment, K extends keyof T>(
  outcomes: T[],
  field: K
): any[] => {
  return _.uniq(outcomes.map(outcome => outcome[field]))
}

export const partitionByField = <T extends OutcomeFragmentFragment, K extends keyof OutcomeFragmentFragment>(
  outcomes: T[],
  field: K
): Dictionary<T[]> => {
  return _.groupBy(outcomes, outcome => outcome[field])
}

// export const partitionByFieldAndFeedSupplier = <
//   T extends OutcomeFragmentFragment,
//   K extends keyof OutcomeFragmentFragment
// >(
//   outcomes: T[],
//   field: K
// ): Dictionary<DictionaryUnion<T | undefined, T['feedSupplier']>> => {
//   const distinctFeedSupplier = discreteByField(outcomes, 'feedSupplier')
//   return _.transform(
//     _.groupBy(outcomes, outcome => outcome[field]),
//     (acc, coll, fieldKey) => {
//       acc[fieldKey] = {} as DictionaryUnion<T | undefined, T['feedSupplier']>
//       distinctFeedSupplier.forEach(feedSupplier => {
//         acc[fieldKey][feedSupplier] = getByFeedSupplier(coll, feedSupplier)
//       })
//     },
//     {} as Dictionary<DictionaryUnion<T | undefined, T['feedSupplier']>>
//   )
// }

type PartitionedByFeedSupplierAndField<T extends OutcomeFragmentFragment> = DictionaryUnion<
  Dictionary<T | undefined>,
  T['feedSupplier']
>

export const partitionByFeedSupplierAndField = <
  T extends OutcomeFragmentFragment,
  K extends keyof OutcomeFragmentFragment
>(
  outcomes: T[],
  field: K
): PartitionedByFeedSupplierAndField<T> => {
  const distinctField = discreteByField(outcomes, field)
  return _.transform(
    _.groupBy(outcomes, outcome => outcome.feedSupplier),
    (acc, coll, feedSupplier: T['feedSupplier']) => {
      const fieldValues = {} as Dictionary<T | undefined>
      distinctField.forEach((fieldValue: string | number) => {
        fieldValues[fieldValue] = getByField(coll, field, fieldValue)
      })
      acc[feedSupplier] = fieldValues
    },
    {} as PartitionedByFeedSupplierAndField<T>
  )
}

export const getByField = <T extends OutcomeFragmentFragment, K extends keyof T>(
  outcomes: T[],
  field: K,
  fieldValue: any
): T | undefined => {
  return outcomes.find(outcome => outcome[field] === fieldValue)
}

export const getByFeedSupplier = <T extends OutcomeFragmentFragment>(
  outcomes: T[],
  feedSupplier: FeedSupplierName
): T | undefined => {
  return outcomes.find(outcome => outcome.feedSupplier === feedSupplier)
}

export const bestPriced = <T extends OutcomeFragmentFragment>(outcomes: T[]): T[] => {
  // return outcomes.find(outcome => outcome.feedSupplier === feedSupplier)
  const partitioned = _.groupBy(outcomes, o => o.oddsDecimal)
  return partitioned[
    Object.keys(partitioned)
      .sort()
      .slice(-1)[0]
  ]
}
