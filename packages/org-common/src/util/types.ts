import {isString} from 'util'

// http://tinyurl.com/yxk65m4g
export const isNumeric = (val: any): val is number | string => {
  return val - parseFloat(val) + 1 >= 0
}

export const numberToString = (val: any): string => {
  if (isString(val)) {
    return val
  }

  if (isNumeric(val)) {
    return val.toString()
  }

  throw new Error(`Value '${val}' is not a number`)
}

export const falsey = (val: any): boolean => {
  if (val === '0') return true
  return !!!val
}

export const truthy = (val: any): boolean => {
  if (val === '0') return false
  return !!val
}

export const isClass = (val: any): boolean => {
  const isCtorClass = val.constructor && val.constructor.toString().substring(0, 5) === 'class'
  if (val.prototype === undefined) {
    return isCtorClass
  }
  const isPrototypeCtorClass =
    val.prototype.constructor &&
    val.prototype.constructor.toString &&
    val.prototype.constructor.toString().substring(0, 5) === 'class'
  return isCtorClass || isPrototypeCtorClass
}

export const isRegex = (val: any): boolean => {
  return val instanceof RegExp
}
