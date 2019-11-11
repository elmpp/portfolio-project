import {GCloudPubSubMessage, GCloudPubSubContext} from '../../../typings/google-cloud'

/**
 * Mock functions to support mocking pubsub-style serverless functions - http://tinyurl.com/y63ghyff
 */

export const mockFunctionData = <T>(runArgv: Partial<T> = {}): GCloudPubSubMessage => {
  return {
    data: Buffer.from(JSON.stringify(runArgv)).toString('base64'),
    messageId: 'cli-default-id',
    publishTime: new Date().toISOString(),
  }
}

export const mockFunctionContext = (): GCloudPubSubContext => {
  return {
    eventId: 'cli-default-event-id',
    eventType: 'google.pubsub.topic.publish',
    resource: 'cli-resource-thing',
    timestamp: new Date().toISOString(),
  }
}
