/**
 * ! This _will_ cause rerenders when the condition changes
 *
 *  - devhub production - https://tinyurl.com/yxgrv6t8
 */

import React from 'react'

export interface ConditionalWrapProps {
  children: any
  condition: boolean
  wrap: (children: React.ReactElement<any>) => React.ReactElement<any>
}

export function ConditionalWrap(props: ConditionalWrapProps) {
  const { children, condition, wrap } = props

  return condition ? wrap(children) : children
}
