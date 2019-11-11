/**
 * Simple, imperative and reliable approach to sleuthing rerenders
 *
 *  - devhub production - https://tinyurl.com/y5faflqp
 *  - whyDidYouRender canonical solution but unreliable (uninstalled) - https://tinyurl.com/y3ath2vp
 *  - from here it looks like - https://tinyurl.com/y582a4g8
 */

import { useEffect, useRef } from 'react'

export function useWhyDidYouUpdate(name: string, props: Record<string, any>) {
  const latestProps = useRef(props)

  useEffect(() => {
    if (process.env.NODE_ENV !== 'development') return

    const allKeys = Object.keys({ ...latestProps.current, ...props })

    const changesObj: Record<string, { from: any; to: any }> = {}
    allKeys.forEach(key => {
      if (latestProps.current[key] !== props[key]) {
        changesObj[key] = { from: latestProps.current[key], to: props[key] }
      }
    })

    if (Object.keys(changesObj).length) {
      // tslint:disable-next-line no-console
      console.log('[why-did-you-update]', name, changesObj)
    }

    latestProps.current = props
  }, Object.values(props))
}
