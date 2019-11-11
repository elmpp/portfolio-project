/**
 * For use in testing our container components. Basically only responsible for setting up a context
 * conducive to allowing containers to run graphql and redux operations
 *
 * It will:
 *  - set up a mocked graphql schema (stitched client and server)
 *
 *  - @see TESTING.md:mocking:apollo
 *  - https://www.robinwieruch.de/react-apollo-client-testing/
 */

// https://github.com/airbnb/enzyme/blob/master/docs/guides/jsdom.md#using-enzyme-with-jsdom
import renderer, {RendererOptions, Action} from './renderer'
import mockApollo from '../../app/apollo/init-mock-apollo'

// require('./setupTests')

export default async (Component: React.ComponentType<any>, options: any = {}) => {
  options = {
    renderMethod: Action.mount,
    ...options,
  }

  const client = mockApollo()

  return renderer(Component, {
    client,
    action: options.renderMethod,
    props: options.props,
    options: options.createOptions,
  } as RendererOptions) // will produce our test render with bit of help with theme contexts etc
}
