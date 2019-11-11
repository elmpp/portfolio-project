// inspired by - https://goo.gl/LTUUCb

import {Client} from '../../../../__types__'
// import {ApolloClient} from 'apollo-client'
import {InMemoryCache} from 'apollo-cache-inmemory'
import {withClientState} from 'apollo-link-state'
import {ApolloClient} from 'apollo-client'
import createResolverDuck from '../../create-client-enhancer'
import {Duck} from '../../../ducks'
import {MEDIA_SIZES, breakpoints, MEDIA_ORIENTATIONS} from '../../media-type-constants'
import {ResponsiveQuery_responsive} from '../../../__types__/graphql/ResponsiveQuery'
import RESPONSIVE_MEDIA_TYPE_QUERY from '../../__graphql__/responsive-query-media-type.graphql'
import RESPONSIVE_MUTATION from '../../__graphql__/responsive-mutation.graphql'


describe('responsive-resolver', () => {
  let client: Client

  beforeEach(() => {
    const resolverDuck: Duck = createResolverDuck({staticMediaType: MEDIA_SIZES.medium, breakpoints})

    const cache = new InMemoryCache()
    const link = withClientState({
      resolvers: resolverDuck.resolvers,
      defaults: {...resolverDuck.defaults, mediaType: MEDIA_SIZES.medium} as Duck['defaults'], // apply our tighter definiton of "state shape"
      cache,
    })

    client = new ApolloClient({
      link,
      cache,
    })
  })

  it('queries current media type from responsive local state', () => {
    const data: any = client.readQuery({query: RESPONSIVE_MEDIA_TYPE_QUERY})
    expect(data).toHaveProperty('responsive') // because is within own "state slice"
    expect(data.responsive).toEqual(
      expect.objectContaining({
        mediaType: MEDIA_SIZES.medium,
      })
    )
  })

  it('mutates responsive local state', done => {
    const nextResponsive: ResponsiveQuery_responsive = {
      __typename: 'Responsive',
      lessThan: {
        [MEDIA_SIZES.extraSmall]: true,
        [MEDIA_SIZES.small]: true,
        [MEDIA_SIZES.medium]: true,
        [MEDIA_SIZES.large]: true,
        [MEDIA_SIZES.infinity]: true,
        __typename: 'Responsive_computed',
      },
      greaterThan: {
        [MEDIA_SIZES.extraSmall]: true,
        [MEDIA_SIZES.small]: true,
        [MEDIA_SIZES.medium]: true,
        [MEDIA_SIZES.large]: true,
        [MEDIA_SIZES.infinity]: true,
        __typename: 'Responsive_computed',
      },
      is: {
        [MEDIA_SIZES.extraSmall]: true,
        [MEDIA_SIZES.small]: true,
        [MEDIA_SIZES.medium]: true,
        [MEDIA_SIZES.large]: true,
        [MEDIA_SIZES.infinity]: true,
        __typename: 'Responsive_computed',
      },
      mediaType: MEDIA_SIZES.extraSmall,
      orientation: MEDIA_ORIENTATIONS.landscape,
    }

    client.mutate({mutation: RESPONSIVE_MUTATION, variables: {responsiveObj: nextResponsive}}).then(result => {
      expect(result).toEqual(
        expect.objectContaining({
          data: {
            updateResponsive: null, // tslint:disable-line
          },
          errors: undefined,
        })
      )
      const data: any = client.readQuery({query: RESPONSIVE_MEDIA_TYPE_QUERY})
      expect(data).toHaveProperty('responsive') // because is within own "state slice"
      expect(data.responsive).toEqual(
        expect.objectContaining({
          mediaType: MEDIA_SIZES.extraSmall,
        })
      )
      done()
    })
  })
})
