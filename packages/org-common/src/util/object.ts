import _, {ValueKeyIteratee} from 'lodash'

export const objectSetPaths = <T extends object>(defaultValue: T, paths: [string, any][]): any => {
  return paths.reduce((agg: T, [path, value]) => {
    return _.set(agg, path, value)
  }, defaultValue)
}

export const filter = <T extends object>(obj: T, iteratee: ValueKeyIteratee<typeof obj[keyof T]>): Partial<T> => {
  return _.pickBy(obj, iteratee)
}
