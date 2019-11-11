import {defaultDataIdFromObject} from 'apollo-cache-inmemory'
import handlers from './handlers'
import responsiveResolver from './resolvers/responsive-resolver'
import calculateResponsive from './calculate-responsive'
import {Options} from './__types__'
import {Client} from '../../__types__'
import typeDefs from './__graphql__/types.graphql'
import {Duck} from '../ducks'
import { ResponsiveQuery_responsive } from '../__types__/graphql/ResponsiveQuery';

/**
 * [Apollo Resolver](http://bit.ly/2s42IcC) to maintain responsive account of app in the local cache
 * Is akin to a redux "[store enhancer](http://bit.ly/2s6CiqL)" in that it augments the client setup.
 * Kinda like an afterware for client setup
 */

/**
 * @param options {breakpoints, defaultMatch, staticMediaType, infinity = defaultMediaType} = {}
 */
export default (options: Options): Duck => {
  // const optionsWithDefaults: Options = {
  //   staticMediaType: undefined, // optionally set the media type directly. Will not calculate if supplied and no event handlers added. Probably only suitable for SSR
  //   ...options,
  // }

  // calculate the defaults for this resolver. This represents the current responsive state of the window
  // prior to any handlers firing. If there is a staticMediaType, it should take that type
  const responsiveCalculator = calculateResponsive(options)
  let responsiveFirstInvocation: ResponsiveQuery_responsive

  if (options.staticMediaType) {
    responsiveFirstInvocation = responsiveCalculator({matchMedia: undefined}) // calculate-responsive.js will already know there is a staticMediaType
  } else if (typeof window === 'undefined') {
    // n.b. we could be running with SSR still. e.g. the media type for a device wasn't ua-parseable
    responsiveFirstInvocation = responsiveCalculator({matchMedia: undefined}) // need to simulate lack of window for calculate-responsive
  } else {
    responsiveFirstInvocation = responsiveCalculator(window) // need to simulate lack of window for calculate-responsive
  }

  // console.log('responsiveFirstInvocation :', responsiveFirstInvocation);

  // this callback is intended for mutating the client after it has used the other returns
  const cb = (client: any) => {
    // we want to add a first pass into the `dataIdFromObject` so that we can define our own IDs - http://bit.ly/2JoJepF
    const origDataIdFromObject = client.cache.config.dataIdFromObject || defaultDataIdFromObject
    client.cache.config.dataIdFromObject = (object: any) => {
      // eslint-disable-next-line no-underscore-dangle
      switch (object.__typename) {
        case 'responsive':
          return object.mediaType
        default:
          // fallback to default implementation if any
          return origDataIdFromObject(object)
      }
    }

    // attach the event handlers if appropriate
    if (options.staticMediaType) {
      // handled by us invoking on the defaults above
    } else if (typeof window !== 'undefined' && typeof window.matchMedia !== 'undefined') {
      // add the handlers that only fire when the responsive state changes
      handlers({client: client as Client, window, options})
    }

    return client
  }

  return {
    resolvers: responsiveResolver,
    defaults: {responsive: responsiveFirstInvocation},
    typeDefs,
    cb,
  }
}
