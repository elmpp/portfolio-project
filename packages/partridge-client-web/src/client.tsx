/**
 * This is the entry point for the client bundle and won't have all the server/document stuff
 *  - razzle explanation - https://tinyurl.com/yydgf228
 *  - It's run via webpack-dev-server in dev - https://tinyurl.com/yyj3yx6r
 *  - webpack-dev-server docs - https://tinyurl.com/y3djdavx
 */

// import {handler} from 'partridge-logging/error-handlers'

// // bootstrap our error handler
// handler({
//   key: 'ergergerg',
//   projectId: 'ergergerge',
//   // service:
// })

// import('partridge-logging/error-handlers').then(({handler}) => {
//   handler({
//     key: 'ergergerg',
//     projectId: 'ergergerge',
//     // service:
//   })
// })

import React from 'react'
import {ensureReady, After} from '@jaredpalmer/after'
// import {routes, Router} from 'partridge-client-components'
import {routesSmall, routesLarge} from 'partridge-client-components'
import {BrowserRouter as Router} from 'react-router-dom'
import {AppRegistry} from 'react-native'
// import {handler} from 'partridge-logging/error-handlers'

// // bootstrap our error handler
// handler({
//   key: 'ergergerg',
//   projectId: 'ergergerge',
//   // service:
// })

ensureReady(routesLarge).then(data => {
  const App = () => (
    <Router>
      <After data={data} routes={routesLarge} />
    </Router>
  )

  // react-native-web integration - https://tinyurl.com/y3qk8vu3
  AppRegistry.registerComponent('App', () => App)
  return AppRegistry.runApplication('App', {
    initialProps: {},
    rootTag: document.getElementById('root'),
  })
})

if (module.hot) {
  module.hot.accept()
}
