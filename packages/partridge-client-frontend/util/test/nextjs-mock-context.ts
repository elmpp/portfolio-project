// Mocking for next.js context, principally the router. Uses deprecated React context!! - https://goo.gl/AEmYD9

import React from 'react'
import PropTypes from 'prop-types'
import {SingletonRouter as Router} from 'next-server/router' // note we have our own typings in /typings/next-routes.d.ts

interface MockNextContextProps {
  headManager?: any
  router?: Router
}


export default class MockNextContext extends React.Component<MockNextContextProps> {

  static childContextTypes = {
    router: PropTypes.object,
    headManager: PropTypes.object,
  }

  getChildContext () {
    const { headManager } = this.props
    return {
      headManager: {
        updateHead: () => {}, // tslint:disable-line
        ...headManager
      },
      // router: aRouter,
      // router: {
      //   asPath: "/cunt",
      //   route: "/",
      //   pathname: "/",
      //   query: {},
    
      //   // TODO: Properly mock the following methods
      //   back() {},
      //   beforePopState() {},
      //   prefetch() {},
      //   push() {},
      //   reload() {},
      //   replace() {},
      //   events: {
      //     // TODO: Implement EventEmitter
      //     on () {},
      //     off () {},
      //     trigger() {} 
      //   },
      //   ...router
      // } as any as Router
    }
  }

  render () {
    return this.props.children
  }
}