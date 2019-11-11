import {FeedImplementation} from '../../__types__'
import {feedImporter} from './feed-importer'

const implementation: FeedImplementation = {
  feedImporter,
}

export default implementation

// const something = async () => {
//   const things = ['a', 'b'].reduce(async (acc, data: string) => {
//     const accumulator = await acc
//     await Promise.resolve()
//     accumulator.push(data)
//     // return Promise.resolve(acc)
//     return acc
//     // return accumulator
//   }, Promise.resolve([] as string[]))
// }
