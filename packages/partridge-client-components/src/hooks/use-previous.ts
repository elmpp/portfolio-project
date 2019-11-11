/**
 * On mount and each subsequent rerender (with value having changed),
 * the ref will be updated.
 * Basically just remembers a value/ref without using state (which triggers rerenders obv)
 *
 *  - originally from here possibly - https://tinyurl.com/y6pmskks
 *  - useRef - https://tinyurl.com/y432ar8v
 *  - conditionally firing effects - https://tinyurl.com/y5qwb8pa
 */

import { useEffect, useRef } from 'react'

export function usePrevious<T>(value: T) {
  const ref = useRef<T | undefined>(undefined)

  useEffect(() => {
    ref.current = value
  }, [value])

  return ref.current
}
