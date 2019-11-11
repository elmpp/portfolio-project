import {FeedSupplierName} from 'partridge-config'

export interface FetchMeta {
  run_id: string // https://goo.gl/BpShbd
  url: string
}

// represent fields that will be dependably present from RawEntity -> CommonEntity -> Processedntity
export interface MandatoryFields {
  id: string
  feed_supplier: FeedSupplierName
  name: string
  // canonicalised_name: string // // this will be set by plpgsql function
  // canonicalised_name_unique: string  // this will be set by plpgsql function
}

// export interface EntityMeta {
//   fetch: FetchMeta
//   mandatory: MandatoryFields
// }

export type EntityMeta = FetchMeta & MandatoryFields

// export type MergeableName = 'event' | 'market' | 'outcome'

// export type CategoryName = 'category1' | 'category2' | 'category3'

// export type EntityName = MergeableName | CategoryName | 'marketCollection'
