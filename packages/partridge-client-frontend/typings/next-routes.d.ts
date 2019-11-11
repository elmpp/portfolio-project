// declaration merging for module definitions - https://stackoverflow.com/a/43955512/2968327
// import {RouterProps, SingletonRouter, RouterCallback, DefaultQuery} from 'next-server/router'
// import * as RouterModule from 'next-server/router'
import RouterModule = require('next-server/router') // note this import format
import NextRoutesModule = require('next-routes')
// import {RouteParams, Router} from 'next-routes'

// declare module "next-server/router" {
//   // export type RouterProps = {
//   //   params:
//   // } & RouterModule.RouterProps

//   export interface Router<Q = DefaultQuery> extends NextRoutesModule.Router<Q> {
//     // router: RouterModule.RouterProps<Q> | null;
//     router: RouterModule.RouterProps<Q>;
//     readyCallbacks: RouterModule.RouterCallback[];
//     ready(cb: RouterModule.RouterCallback): void;
//   }
  
//   export interface WithRouterProps<Q = DefaultQuery> {
//     router: Router<Q>;
//     // router?: Router<Q>;
//     // params: NextRoutesModule.RouteParams
//   }
  
//   /**
//    * Remove properties `K` from `T`.
//    *
//    * @internal
//    */
//   export type Omit<T, K extends keyof any> = T extends any ? Pick<T, Exclude<keyof T, K>> : never;
  
//   // Manually disabling the no-unnecessary-generics rule so users can
//   // retain type inference if they wrap their component in withRouter
//   // without defining props explicitly
//   export function withRouter<T extends {}, Q = DefaultQuery>(
//   Component: React.ComponentType<T & WithRouterProps<Q>>
//   ): React.ComponentType<Omit<T, keyof WithRouterProps<Q>>>;
// }
