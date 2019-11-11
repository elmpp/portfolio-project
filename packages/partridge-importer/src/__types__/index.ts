import {Feed, FeedSupplierName} from 'partridge-config'
import {AxiosInstance} from 'axios'
import {Bench, BenchSnapshotDiff} from 'org-common/perf'
import {Logger} from 'partridge-logging'
import {EntityContext} from './common-entity'
import {GCloudPubSubContext} from '../../../typings/google-cloud'

export * from './entity' // https://goo.gl/EMCCqH
export * from './raw-entity'
export * from './common-entity'

export type Client = AxiosInstance

// export interface OutcomeReportRecord {
//   meta: EntityMeta
// }

// export interface MarketReportRecord {
//   meta: EntityMeta
//   outcomes: OutcomeReportRecord
// }

// export interface EventReportRecord {
//   benchmark: BenchSnapshot
//   meta: EntityMeta
//   markets: MarketReportRecord[]
// }

// export interface RunProgress {
//   events: EventReportRecord[]
// }

// @todo - add as a dumpable
export interface RunReport extends Formattable {
  // events: EventReportRecord[]
  benchmark: BenchSnapshotDiff
  runOptions: RunOptions
  entities: EntityContext
  result: 'SUCCESS' | 'FAILURE'
}

export interface RunContext {
  benchmarker: Bench
  client: Client
  entities: EntityContext
  logger: Logger
  options: RunOptions
}

// the command args when invoking the importer
export interface RunArgv {
  dateFrom?: Date
  dateTo?: Date
  feed: FeedSupplierName
  validateSchema?: boolean
  suggestRenameRules?: boolean
}

// all options that configure the run
export interface RunOptions extends RunArgv, Feed {
  runId: string // https://goo.gl/tqX5nR
  pubSubContext?: GCloudPubSubContext
  suggestRenameRules: boolean
}

// export type FeedImporter = (context: RunContext) => Promise<RunReport>
export type FeedImporter = (context: RunContext) => void

export interface FeedImplementation {
  feedImporter: FeedImporter
}
