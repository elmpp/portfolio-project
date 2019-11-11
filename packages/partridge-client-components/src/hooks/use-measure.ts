/**
 * Adds a subscription to an element and keeps in state
 *
 *  - from SO - https://tinyurl.com/y3935vjf
 */

import {useState, useCallback} from 'react'
import {ViewProps} from 'react-native'

interface Size {
  width: 'auto' | number
  height: 'auto' | number
}
type OnLayout = NonNullable<ViewProps['onLayout']>

export const useMeasure = (defaultSize: Size = {width: 'auto', height: 'auto'}, _onLayout?: OnLayout): [Size, OnLayout] => {
  const [size, setSize] = useState<Size>(defaultSize)

  const onLayout = useCallback<OnLayout>(event => {
    const {width, height} = event.nativeEvent.layout
console.log(`onLayout width: ${width} height: ${height}`);

    setSize({width, height})
    if (_onLayout) _onLayout(event)
  }, []) // empty array = will only measure once

  return [size, onLayout]
}

export {
  OnLayout,
  Size,
}