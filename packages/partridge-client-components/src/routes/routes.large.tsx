/**
 * We're defining our routes separately from small -> large to reduce bundle size
 * and allow us to split component trees from the /screens components "on down"
 */

import React from 'react'
import {getCommonRoutes} from './common'
import {Text} from '../libs/text'
import {asyncComponent} from '@jaredpalmer/after'

export const routes = getCommonRoutes().concat([
  {
    path: '/',
    exact: true,
    component: asyncComponent({
      loader: () => import('../screens/home/home.small').then(({HomeScreen}) => HomeScreen), // dynamic named import
      Placeholder: () => <Text>...LOADINGeee...</Text>, // this is optional, just returns null by default
    }),
  },
])
