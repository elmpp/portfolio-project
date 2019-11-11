// // to support the annoying API changes - https://spectrum.chat/next-js/general/renderpage-enhancer-api-changes-types~df615472-601f-422e-a084-c843578de778

// import * as React from "react";
// import {Enhancer, NextDocumentContext} from 'next/document'

// // export type Enhancer<E extends PageProps = AnyPageProps, P extends any = E> = (
// //   options: {
// //     enhanceApp?: (page: React.ComponentType) => React.ComponentType
// //     enhanceComponent?: (page: React.ComponentType) => React.ComponentType
// //   }
// // ) => React.ComponentType<E> & DocumentEnhancer

// // export type 

// declare module "next/document" {
//   // type CanaryEnhancer = (
//   //   options: {
//   //     enhanceApp?: (page: React.ComponentType) => React.ComponentType
//   //     enhanceComponent?: (page: React.ComponentType) => React.ComponentType
//   //   }
//   // ) => React.ComponentType

//   function CanaryEnhancer
//     (
//       options: {
//         enhanceApp?: (page: React.ComponentType) => React.ComponentType
//         enhanceComponent?: (page: React.ComponentType) => React.ComponentType
//       }
//     ): React.ComponentType

//   export interface CanaryNextDocumentContext<Q extends DefaultQuery = DefaultQuery> extends NextDocumentContext<Q> {
//     /** A callback that executes the actual React rendering logic (synchronously) */
//     renderPage(
//         enhancer?: CanaryEnhancer // tslint:disable-line no-unnecessary-generics
//     ): RenderPageResponse;
//   }
// }