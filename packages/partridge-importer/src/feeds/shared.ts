import {
  CommonEntity,
  Association,
  EntityMeta,
  MarketCommonEntity,
  OutcomeCommonEntity,
  RunContext,
  EventType,
  EntityName,
  RawEntity,
  CommonEntityUnion,
} from '../__types__'
import jp from 'jsonpath'

import _ from 'lodash'
import {DumpableError} from 'partridge-logging'
import {AxiosResponse, AxiosError} from 'axios'

export type JsonPathRuleFunc = (obj: any) => (args: any) => any[]
export type JsonPathRule = string | JsonPathRuleFunc

export const sortByDisplayOrder = <T extends MarketCommonEntity | OutcomeCommonEntity>(ents: T[]): T[] => {
  return _.sortBy(ents, (ent: T) => ent.fields.concrete.display_order)
}

export const homeAwayTeamsParse = (ctx: RunContext): [string, string] => {
  const eventCommon = ctx.entities.event()
  const eventCommonNameParts = doMatch2TeamsNameSplit(eventCommon.meta.name)

  // validate this is all occurring in the right context
  if (eventCommon.fields.processed.type !== EventType.match_2_teams || eventCommonNameParts.length !== 2) {
    throw new DumpableError('homeAwayTeamsParse invoked in wrong context', {
      eventCommon: [eventCommon],
      eventCommonNameParts,
    })
  }
  return [eventCommonNameParts[0], eventCommonNameParts[1]]
}

export const doMatch2TeamsNameSplit = (teamName: string): string[] =>
  teamName
    .toLowerCase()
    .split(' v ')
    .filter(Boolean)
    .map(namePart => namePart.trim())

/**
 * Markets often include the name of the outcomes - e.g. 'Handicap Match Result - Brighton +2.0 goals'
 */
export const homeAwayReplaceTeamNamesMarket = (
  homeTeam: string,
  awayTeam: string,
  marketCommon: MarketCommonEntity,
  _ctx: RunContext
) => {
  marketCommon.meta.name = marketCommon.meta.name
    .replace(new RegExp(homeTeam, 'gi'), 'home team')
    .replace(new RegExp(awayTeam, 'gi'), 'away team')
}

/**
 * For the outcomes of events with type "MATCH_2_TEAMS", need to assign home/away in relevant market outcomes
 * Assume the market with lowest `displayOrder` will be "winner" market with team outcomes
 */
export const homeAwayFlagOutcome = (
  homeTeam: string,
  awayTeam: string,
  outcomeCommons: OutcomeCommonEntity[],
  ctx: RunContext
) => {
  const eventCommon = ctx.entities.event()

  const homeOutcome = outcomeCommons.find(outcomeCommon => outcomeCommon.meta.name.toLowerCase() === homeTeam)
  const awayOutcome = outcomeCommons.find(outcomeCommon => outcomeCommon.meta.name.toLowerCase() === awayTeam)

  // has the event name parsed as a "vs" match and matched with outcomes
  if (!homeOutcome || !awayOutcome) {
    throw new DumpableError('homeAwayFlagOutcome unable to parse and match event name to outcomes', {
      homeTeam: [homeTeam],
      awayTeam: [awayTeam],
      outcomeCommons,
    })
  }

  ctx.logger.log(
    'verbose',
    `Assigning home team to: ${outcomeCommons[0].meta.name} for event: ${eventCommon.meta.name}`,
    {runtime_label: 'IMPORTER'}
  )

  homeOutcome.fields.concrete.is_home = true
  awayOutcome.fields.concrete.is_home = false
}

export const mergeAssociations = <T extends Association>(assoc1: T, assoc2: T): T => {
  return _.mapValues(assoc1, (meta: EntityMeta[], assocKey: EntityName) => {
    return meta.concat(assoc2[assocKey])
  }) as T
}

/**
 * Cascades together entities right -> left. Accumulates the associations however.
 */
// export const mergeEntities = <T extends CommonEntity<T['fields'], T['associations']>>(ents: T[], ctx: RunContext): T[] => {
export const mergeEntities = <T extends CommonEntityUnion>(ents: T[], ctx: RunContext): T[] => {
  if (!ents.length) {
    return ents
  }

  const grouped = _.groupBy(ents, (ent: T) => ent.meta.id)

  const merged = Object.keys(grouped).map(id => {
    // perhaps could be toggled off when feed established...
    validateEntitiesWithIdHaveIdenticalNames(grouped[id])

    return grouped[id].reduce((acc: T, ent: T) => {
      return {
        meta: ent.meta,
        // associations: mapValues(acc.associations, (mandatory: MandatoryFields[], assocKey: EntityName) => concat((ent.associations)[assocKey])),
        associations: mergeAssociations(acc.associations, ent.associations),
        fields: ent.fields,
        import_tmp: ent.import_tmp,
        crunch_tmp: ent.crunch_tmp,
        type: ent.type,
      } as T
    })
  })

  ctx.logger.log('verbose', `Merged entities of type: ${ents[0].type}. ${merged.length}/${ents.length}`, {
    runtime_label: 'IMPORTER',
  })
  return merged
}

/**
 * Merges down
 * e.g. https://goo.gl/F2Q2r6
 */
export const reduceMarketCollections = (ctx: RunContext) => {
  const entities = ctx.entities.marketCollections()
  const merged = mergeEntities(entities, ctx)

  ctx.entities.marketCollections(merged, true)
}

// here we check whether supplier is sending entities of same id with differing names (this would be v.bad)
const validateEntitiesWithIdHaveIdenticalNames = <T extends CommonEntity<T['fields'], T['associations']>>(
  ents: T[]
) => {
  if (Object.keys(_.groupBy(ents, (ent: T) => ent.meta.name)).length > 1) {
    throw new Error(`Multiple names found when merging entities of type: ${ents[0].type} and id: ${ents[0].meta.id}`)
  }
}

// jsonpath - docs - https://goo.gl/axM6Bu / library - https://goo.gl/ZgJXnQ
export const doJsonpath = (obj: any, path: JsonPathRule, ...jsonPathRuleFuncArgs: any): RawEntity[] => {
  if (typeof path === 'function') {
    return path(obj).apply(undefined, jsonPathRuleFuncArgs)
  }
  return jp.query(obj, path)
}

export const doRequest = async (uri: string, ctx: RunContext): Promise<AxiosResponse> => {
  const {client} = ctx

  return client.get(uri).catch((error: AxiosError) => {
    // https://goo.gl/dujWJq
    if (error.response) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx
      // console.log(error.response.data)
      // console.log(error.response.status)
      // console.log(error.response.headers)
    } else if (error.request) {
      // The request was made but no response was received
      // `error.request` is an instance of XMLHttpRequest in the browser and an instance of
      // http.ClientRequest in node.js
      console.log(error.request)
    } else {
      // Something happened in setting up the request that triggered an Error
      // console.log('Error', error.message)
      console.log('Error', error)
    }

    throw error
  })
}

/**
 * For events of type "MATCH_2_TEAMS", assign home/away for the outcomes
 */
// const homeAwayOutcome = (ctx: RunContext) => {
//   ctx.entities.marketCollections().filter(marketCollection => marketCollection.fields.)
// }
