/**
 *  - devhub production - https://tinyurl.com/yxbrlsxu
 */

import {findDOMNode} from 'react-dom'
import {Platform} from '../../libs/platform'

export function findNode(ref: any) {
  try {
    let node = ref && (ref.current || ref)

    if (node && (node as any).getNode && (node as any).getNode()) node = (node as any).getNode()

    if (node && (node as any)._touchableNode) node = (node as any)._touchableNode

    if (node && (node as any)._node) node = (node as any)._node

    if (node && Platform.OS === 'web') node = findDOMNode(node)

    return node
  } catch (error) {
    console.error('Failed to find node', error, {ref})
    return null
  }
}

export function tryFocus(ref: any) {
  const node = findNode(ref)

  if (node && node.focus) {
    if (!(node.tabIndex >= 0)) node.tabIndex = -1
    node.focus()
    return true
  }

  return false
}
