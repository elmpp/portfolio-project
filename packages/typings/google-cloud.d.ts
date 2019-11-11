/**
 * There are typings within @google-cloud/functions-framework/invoker.d.ts but they're
 * not up to much
 *  - inspired by this (but changed for node 8) - https://goo.gl/A6F9g5
 *  - should be removed once offical pubsub typings are supplied - https://goo.gl/N1eNFy
 *  - cloud function arguments - https://goo.gl/omVD6G
 */


type GoogleCloudEventType = 'google.pubsub.topic.publish'

// docs - https://goo.gl/KNLU1G / publishing - https://goo.gl/hTRCjU
interface GCloudPubSubMessage {
  data: string
  attributes?: {[key: string]: string}
  messageId: string
  publishTime: string
}

interface GCloudPubSubContext {
  eventId?: string
  timestamp?: string // ISO 8601
  eventType?: GoogleCloudEventType
  resource?: string
}

export interface GCloudEventFunctionWithCallback<T extends any> {
  (data: GCloudPubSubMessage, context: GCloudPubSubContext, callback: GCloudPubSubCallback): Promise<T>;
}

type GCloudPubSubCallback = (error?: any | null, result?: any) => void
