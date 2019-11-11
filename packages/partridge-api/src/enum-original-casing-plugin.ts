/**
 * Postgraphile is uppercasing enum values
 * e.g. enum FeedSupplierEnum {
 *  CORAL <- should be coral
 *  SKY
 * }
 *
 *  - postgraphile plugin docs - https://tinyurl.com/yy3tus64
 */

import {makeAddInflectorsPlugin} from 'graphile-utils'

export const enumOriginalCasingPlugin = makeAddInflectorsPlugin(
  {
    // the original inflector that this will be replacing - https://tinyurl.com/y6lqd2yw
    enumName(value: string) {
      return value // does nothing
    },
  },
  true // this means further inflectors aren't called
)
