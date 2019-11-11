import {CommonEntityUnion} from '../__types__'
import Ajv from 'ajv'
import schema from './common-entity-array.schema.json'
import {DumpableError} from 'partridge-logging'

//
export const validateArray = async (entities: CommonEntityUnion[]): Promise<void | any> => {
  const ajv = new Ajv({allErrors: true})
  const valid = await ajv.validate(schema, entities)
  if (!valid) {
    // error object - https://goo.gl/r9nV9k
    throw new DumpableError('Validation failed', {ajv: [ajv.errors], entities})
  }
}
