/**
 * After.js route static route definitions -
 */

import React from 'react'
import {asyncComponent} from '@jaredpalmer/after'
import {Text} from '../libs/text'
import {RouteDef} from './__types__'

function About({match}: any) {
  return <Text>...THIS IS THE ABOUT SCREEN...</Text>
}

export const getCommonRoutes: () => RouteDef[] = () => {
  const routes = [
    {
      path: '/error',
      exact: true,
      component: asyncComponent({
        loader: () => import('../screens/error').then(({ErrorScreen}) => ErrorScreen),
        Placeholder: () => <Text>...LOADINGeee...</Text>,
      }),
    },
    {
      path: '/about',
      exact: true,
      component: About,
    },
  ]

  return routes
}
