/**
 * Allows running of importer via node (e.g. `DEBUG='typeorm:*,routing:*,middleware:*,logging:*' TZ='UTC' npx ts-node --files src/run-importer.ts coral`)
 */

// run with `DEBUG='routing:*,middleware:*,logging:*' npx ts-node src/run-importer.ts`

// allows running of the importers locally outside of Google Cloud Functions

import {importer} from './index'
import {RunArgv} from './__types__'
import {FeedSupplierName} from 'partridge-config'
import {mockFunctionData, mockFunctionContext} from 'org-common/serverless'
;(async () => {
  const mockData = mockFunctionData<RunArgv>({
    feed: process.argv[2] as FeedSupplierName,
    validateSchema: true,
    suggestRenameRules: true,
  })
  const mockContext = mockFunctionContext()

  // console.log('mockData :', mockData)
  // console.log('mockContext :', mockContext)

  const report = await importer(mockData, mockContext, process.exit) // eslint-disable-line
})()
