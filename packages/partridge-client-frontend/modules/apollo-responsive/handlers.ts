// see: https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Testing_media_queries

import MediaQuery from 'mediaquery' // http://bit.ly/2LWsjgb
import calculateResponsive from './calculate-responsive'
import { Options } from "./__types__";
import { Client } from "../../__types__";
import responsiveMutation from './__graphql__/responsive-mutation.graphql'


export interface HandlerArgs {
  client: Client,
  window: Window,
  options: Options,
}
// this function adds event handlers to the window that only tirgger
// when the responsive state changes
export default ({client, window, options}: HandlerArgs) => {
  // // initialise the responsive calculator
  const responsiveCalculator = calculateResponsive(options)

  // the function to call when calculating the new responsive state
  // client api mutate - http://bit.ly/2HeZc46
  // resolvers - http://bit.ly/2s42IcC
  // mutations - http://bit.ly/2IWqy0m
  const refreshResponsiveState = () =>
    client.mutate({
      mutation: responsiveMutation, // http://bit.ly/2s42IcC
      variables: {
        // http://bit.ly/2IYmSLy
        responsiveObj: responsiveCalculator(window),
      },
      // note here that we do not need an update function as apollo will just use the
      // unique identifier (normally __typename and id/_id - http://bit.ly/2JoJepF)
      // however we will define a rule for this `Responsive` type in `dataIdFromObject` when setting up client cache
      // update: () => {} // http://bit.ly/2xprjh1
    })

  // get the object of media queries corresponding to the breakpoints
  const mediaQueries = MediaQuery.asObject(options.breakpoints)

  // console.log('mediaQueries', mediaQueries)

  // for every breakpoint range
  Object.keys(mediaQueries).forEach((mediaSize) => {
    // create a media query list for the breakpoint
    const mediaQueryList = window.matchMedia(mediaQueries[mediaSize as MEDIA_SIZES])
    // const mediaQueryList = window.matchMedia(mediaQueries[breakpoint], {type: 'screen'}) // n.b. second arg is required

    // whenever any of the media query lists status changes
    mediaQueryList.addListener(query => {
      // if a new query was matched
      if (query.matches) {
        // recalculate the state
        refreshResponsiveState()
      }
    })
  })

  // make sure we update the responsive state when the browser changes orientation
  window.addEventListener('orientationchange', refreshResponsiveState)
}
