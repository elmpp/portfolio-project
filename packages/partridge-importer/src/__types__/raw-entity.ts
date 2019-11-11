import {MandatoryFields} from './entity'

export type RawEntity = MandatoryFields & Dictionary<string>

// export type RawEntityFilter = (entity: RawEntity) => boolean
