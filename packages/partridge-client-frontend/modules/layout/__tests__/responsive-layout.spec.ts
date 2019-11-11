import {config} from 'partridge-config'
jest.doMock('next/config', () => () => ({publicRuntimeConfig: config.frontend}))

import apolloMockContainer from '../../../util/test/apollo-mock-container-component'
import {Action} from '../../../util/test/renderer'
import ResponsiveLayout from '../responsive-layout'

jest.mock('next/dynamic', () => () => 'Dynamic')
jest.mock('../../../package.json', () => ({version: 'MOCKED_VERSION'}))
jest.mock('../../buttons-and-links/url-link.tsx', () => 'URL-LINK')

describe('responsive-layout', () => {
  it('should match snapshot', async () => {
    const wrapper = await apolloMockContainer(ResponsiveLayout, {renderMethod: Action.mount})

    // avoid apolloProvider
    // expect(wrapper.children().children()).toMatchSnapshot()
  })
})
