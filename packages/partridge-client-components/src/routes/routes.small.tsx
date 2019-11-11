/**
 * We're defining our routes separately from small -> large to reduce bundle size
 * and allow us to split component trees from the /screens components "on down"
 */

import React from 'react'
import {getCommonRoutes} from './common'
import {Text} from '../libs/text'
import {asyncComponent} from '@jaredpalmer/after'
import {RouteDef} from './__types__'

let addedRoutes: RouteDef[]

if (process.env.BUILD_TARGET === 'mobile') {
  // if (process.env.NODE_ENV === 'development') {
  addedRoutes = [
    {
      path: '/',
      exact: true,
      component: asyncComponent({
        loader: () => import('partridge-storybook/storybook-mobile/config').then(({default: Storybook}) => Storybook),
        Placeholder: () => <Text>...Storybook loading...</Text>,
      }),
    },
  ]
  // }
} else {
  addedRoutes = [
    {
      path: '/',
      exact: true,
      component: asyncComponent({
        loader: () => import('../screens/home/home.small').then(({HomeScreen}) => HomeScreen), // dynamic named import
        Placeholder: () => <Text>...LOADINGeee...</Text>, // this is optional, just returns null by default
      }),
    },
  ]
}

export const routes = getCommonRoutes().concat(addedRoutes)
