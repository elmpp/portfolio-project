import {getClient} from '../http-client'
import {Feed, FeedSupplierName} from 'partridge-config'
import axios, {AxiosRequestConfig} from 'axios'
import {logger, Logger} from 'partridge-logging'
import MockAdapter from 'axios-mock-adapter'

const feedConfig: Feed = {
  authSchema: {
    type: 'htAccess',
    username: 'testusername',
    password: 'testpassword',
  },
  name: FeedSupplierName.coral,
  url: 'http://www.testdomain.com',
  headers: {
    'x-feed-supplier': FeedSupplierName.coral,
  },
}
const derivedAxiosConfig: AxiosRequestConfig = {
  auth: {
    username: 'testusername',
    password: 'testpassword',
  },
  baseURL: 'http://www.testdomain.com',
  headers: {
    'x-feed-supplier': FeedSupplierName.coral,
  },
}

describe('client', () => {
  const createSpy = jest.spyOn(axios, 'create')
  const loggerSpy: jest.Mock<Logger['log']> = jest
    .spyOn(logger, 'log')
    .mockImplementation(((() => undefined) as any) as Logger['log']) as any
  // let createSpy: jest.SpyInstance<typeof axios.create>
  // let loggerSpy: jest.SpyInstance<typeof logger.log> // tslint:disable-line

  // beforeEach(() => {
  //   loggerSpy = jest.spyOn(logger, 'log')
  //   createSpy = jest.spyOn(axios, 'create')
  // })

  afterEach(() => {
    jest.clearAllMocks()
  })

  it('creates an axios client based on config', () => {
    const client = getClient(feedConfig)

    expect(createSpy).toHaveBeenCalled()
    expect(createSpy.mock.calls[0][0]).toEqual(expect.objectContaining(derivedAxiosConfig))
    expect(client).toHaveProperty('interceptors') // proves it's an axios instance
  })

  it('adds headers to requests as specified in config', async () => {
    const client = getClient({...feedConfig})
    const mockClient = new MockAdapter(client)
    mockClient.onGet('/event').reply(200, {
      event: {
        name: 'fa-cup',
      },
    })

    const response = await client.get('/event')

    expect(response.config.headers).toEqual(expect.objectContaining(feedConfig.headers!))
  })

  it('adds interceptor to log request and response', async () => {
    const client = getClient(feedConfig)
    const mockClient = new MockAdapter(client) // https://goo.gl/36z2Ko
    mockClient.onGet('/event').reply(200, {
      event: {
        name: 'fa-cup',
      },
    })

    expect(loggerSpy).not.toHaveBeenCalled()

    await client.get('/event')

    expect(loggerSpy.mock.calls[0][0]).toEqual('debug') // should be what's in the test config
    expect(loggerSpy.mock.calls[0][1]).toMatch('Request')

    const logOptions = loggerSpy.mock.calls[0][2]
    const logOptionsDumpable = logOptions.dumpables.axiosRequest[0]

    expect(logOptionsDumpable.auth).toEqual(derivedAxiosConfig.auth)
    expect(logOptionsDumpable.baseURL).toEqual(derivedAxiosConfig.baseURL)
    expect(logOptionsDumpable.headers).toEqual(expect.objectContaining(derivedAxiosConfig.headers))
  })

  it('adds interceptor to log request error and ensure rethrow', async () => {
    const client = getClient(feedConfig)
    const mockClient = new MockAdapter(client) // https://goo.gl/36z2Ko
    mockClient.onGet('/event').networkError()

    expect(loggerSpy).not.toHaveBeenCalled()

    await client.get('/event').catch(error => {
      expect(error.message).toEqual('Network Error') // checks it's properly rejected
    })

    expect(loggerSpy.mock.calls[1][0]).toEqual('error')
    expect(loggerSpy.mock.calls[1][1]).toMatch('Response')

    const logOptions = loggerSpy.mock.calls[1][2]
    const logOptionsDumpable = logOptions.dumpables

    expect(logOptionsDumpable).toHaveProperty('axiosError')
    expect(logOptionsDumpable.axiosError[0].message).toEqual('Network Error')
  })

  it('adds interceptor for decoding xml when specified', async () => {
    const exampleXML = `<oxip version="7.1" created="2019-01-26 16:36:39" lastMsgId="" requestTime="0.0423">
      <response request="getCategories" code="001" message="success" debug="" provider="GENERIC">
        <disclaimer>
        </disclaimer>
      <category id="16" displayOrder="-10001" name="Football" category="FOOTBALL" />`

    const client = getClient({...feedConfig, format: 'xml'})
    const mockClient = new MockAdapter(client)
    mockClient.onGet('/event').reply(200, exampleXML)

    const response = await client.get('/event')

    expect(response.data.elements[0].name).toEqual('oxip')
  })

  it('logs when conversion from xml -> js fails', async () => {
    const exampleXML = `<badly formed xml`

    const client = getClient({...feedConfig, format: 'xml'})
    const mockClient = new MockAdapter(client)
    mockClient.onGet('/event').reply(200, exampleXML)

    expect(loggerSpy).not.toHaveBeenCalled()

    await client.get('/event').catch(error => {
      expect(typeof error.message).toEqual('string')
    })

    expect(loggerSpy.mock.calls[1][0]).toEqual('error')
    expect(loggerSpy.mock.calls[1][1]).toMatch('Unable to convert xml -> js')

    const logOptions = loggerSpy.mock.calls[1][2]
    const logOptionsDumpableError = logOptions.dumpables.error[0]
    const logOptionsDumpableAxios = logOptions.dumpables.axiosResponse[0]

    expect(typeof logOptionsDumpableError.message).toEqual('string')
    expect(logOptionsDumpableAxios.data).toEqual(exampleXML)
  })
})
