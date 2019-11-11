/**
 * @jest-environment node
 */

/**
 * An environmental test to run full coral import but with pollyjs in place.
 * This should enable us to make recordings etc as well as proof validity of the importer
 *
 * @jest
 */

import path from 'path'
import {Polly} from '@pollyjs/core'
import NodeHttpAdaptor from '@pollyjs/adapter-node-http'
import FSPersister from '@pollyjs/persister-fs'
import {setupPolly} from 'setup-polly-jest'
import * as configModule from 'partridge-config'
import {RunArgv} from '../__types__'
import {mockFunctionData, mockFunctionContext} from 'org-common/serverless'

jest.doMock('partridge-config', () => ({
  ...configModule,
  config: {
    ...configModule.config,
    logging: {
      LOGGING_STACKDRIVER_ENABLE: true,
      LOGGING_CONSOLE_ENABLE: true,
      LOGGING_LEVEL: 'info',
    } as Partial<Config['logging']>,
  },
}))
import {importer} from '../index'
import {Config} from 'partridge-config'

Polly.register(NodeHttpAdaptor)
Polly.register(FSPersister)

const context = setupPolly({
  // bootstrapping library - http://tinyurl.com/yywh48gr
  // config options - http://tinyurl.com/y3fx25b5
  recordIfMissing: false, // this should be toggled after data is captured
  adapters: ['node-http'],
  persister: 'fs',
  persisterOptions: {
    fs: {
      recordingsDir: path.resolve(__dirname, '../../../../packages/partridge-etc/pollyjs-data'),
    },
  },
  // logging: true,
})

describe('import-coral', () => {
  it('Football. Champions League Final 2019.', done => {
    const mockData = mockFunctionData<RunArgv>({
      feed: configModule.FeedSupplierName.coral,
      validateSchema: true,
      suggestRenameRules: true,
    })
    const mockContext = mockFunctionContext()

    importer(mockData, mockContext, done)

    // context.polly.stop() // should trigger fs persistence. Called by library
  }, 60000) // 60 secs for import
})
