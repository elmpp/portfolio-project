import {FeedSupplierName, Feed} from 'partridge-config'
import {FeedImplementation} from '../__types__'
import coral from './coral'
import sky from './sky'

export type FeedImplementations = {
  [s in FeedSupplierName]?: FeedImplementation
}

const feedImplementations: FeedImplementations = {
  coral,
  sky,
}

export default feedImplementations
