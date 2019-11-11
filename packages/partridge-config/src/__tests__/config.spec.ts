import {FeedSupplierName} from '../__types__/config'

/**
 * @jest-environment node
 */

const getConfigMock = jest.fn(() => ({publicRuntimeConfig: {frontend: {}, environment: {}}}))
jest.doMock('next/config', () => ({default: getConfigMock}))

describe('config', () => {
  afterEach(() => {
    jest.clearAllMocks()
    jest.resetModules()
    delete process.env.BUILD_TARGET
  })

  it('includes the feeds with defaults and on server', () => {
    const {config} = require('../index')

    expect(getConfigMock).not.toHaveBeenCalled()

    expect(config.feeds.coral.name).toEqual(FeedSupplierName.coral)
    expect(config.frontend).toBeInstanceOf(Object)
    expect(config.environment).toBeInstanceOf(Object)
    expect(config.logging).toBeInstanceOf(Object)
    expect(config.feeds).toBeInstanceOf(Object)

    expect(config.feeds.coral.name).toEqual(FeedSupplierName.coral)
    expect(config.frontend).toBeInstanceOf(Object)
    expect(config.logging).toBeInstanceOf(Object)
    expect(config.feeds).toBeInstanceOf(Object)
  })

  it('defaults environment.APP_ENV', () => {
    const {config} = require('../index')

    expect(config.environment).toHaveProperty('APP_ENV', 'prod')
  })
})
