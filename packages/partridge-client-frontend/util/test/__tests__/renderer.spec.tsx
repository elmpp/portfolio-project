/**
 * Abstraction of the ways in which we'll render components in our tests. To include:
 *  - the enzyme test renders
 *  - the fb react-test-renderer jest renderer for snapshot testing - https://facebook.github.io/jest/docs/en/snapshot-testing.html#snapshot-testing-with-jest
 */

import React from 'react'
import {shallow} from 'enzyme'
import renderer, {RendererOptions} from '../renderer'

const Component = () => (<div>hellow</div>)

async function callRenderer(AComponent: React.ComponentType, options = {}) {
  return renderer(AComponent, {client: {something: 'CLIENT'}, ...options} as any as RendererOptions)
}

describe('renderer', () => {
  it('should error with mention of non-supported render action', async () => {
    await expect(callRenderer(Component, {action: 'non-existent'})).rejects.toThrow(/non-existent/)
  })
  // more a proof that react behaves as you'd think
  it('should pass context through a HOC', () => {
    const RendererHoc = (WrappableComponent: React.ComponentType) => {
      return (props: any) => <WrappableComponent router={{router: true}} {...props} />
    }
    const rendOpts = {
      context: {
        something: 'else',
      },
    }
    shallow(<Component />, rendOpts)
    const HocComponent = RendererHoc(Component)
    shallow(<HocComponent />, rendOpts)
  })
})
