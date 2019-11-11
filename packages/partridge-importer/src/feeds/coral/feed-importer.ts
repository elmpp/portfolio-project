/**
 * Implementation proper for Coral
 *
 *  - Will be the only feed set to `UPDATE_AND_CREATE_PROCESSED` for categories (see note below)
 */

import {
  FeedImporter,
  RunContext,
  RawEntity,
  EventFields,
  Category1CommonEntity,
  Category2CommonEntity,
  Category3CommonEntity,
  EventCommonEntity,
  MarketCommonEntity,
  OutcomeCommonEntity,
  MarketCollectionCommonEntity,
  CommonEntityUnion,
  EventType,
  EventBettingStatus,
  EntityName,
  CrunchAction,
  MarketFields,
} from '../../__types__'
import {FeedSupplierName} from 'partridge-config'
import {validateArray as validator} from '../../json-schema/validator'
import {format as utilFormat} from 'util'
import {
  reduceMarketCollections,
  homeAwayTeamsParse,
  sortByDisplayOrder,
  homeAwayReplaceTeamNamesMarket,
  homeAwayFlagOutcome,
  JsonPathRule,
  doJsonpath,
  doRequest,
} from '../shared'
import {query} from 'jsonpath'
import {Status} from 'partridge-models'
import Big from 'big.js'

const uris = {
  category1s: 'oxi/pub?template=getCategories',
  category2s: 'oxi/pub?template=getClasses',
  category3s: 'oxi/pub?template=getTypes&class=%s',
  events: 'oxi/pub?template=getEvents&type=%s',
  event: 'oxi/pub?template=getEventDetails&event=%s',
  markets: 'oxi/pub?template=getEventDetails&event=%s',
  outcomes: 'oxi/pub?template=getEventDetails&event=%s',
  marketCollections: '/oxi/pub?template=getEventCollections&event=%s',
}

// jsonpath docs (Stefan Goessner jsonpath variant) - https://goo.gl/ED7N5o
const jsonpaths: Dictionary<JsonPathRule> = {
  category1s: '$..elements[?(@.name=="response")].elements[?(@.name=="category")].attributes',
  category2s: '$..elements[?(@.name=="response")].elements[?(@.name=="class")].attributes',
  category3s: '$..elements[?(@.name=="response")].elements[?(@.name=="class")].elements[?(@.name=="type")].attributes',
  events: '$..elements[?(@.name=="response")].elements[?(@.name=="type")].elements[?(@.name=="event")].attributes',
  event: '$..elements[?(@.name=="response")].elements[?(@.name=="event")].attributes',
  markets: '$..elements[?(@.name=="response")].elements[?(@.name=="event")].elements[?(@.name=="market")].attributes',
  outcomes: (obj: any) => (marketIndex: number) => {
    const markets = query(
      obj,
      '$..elements[?(@.name=="response")].elements[?(@.name=="event")].elements[?(@.name=="market")]'
    )
    return query(markets[marketIndex], '$.elements[?(@.name=="outcome")].attributes')
  },
  marketCollections:
    '$..elements[?(@.name=="response")].elements[?(@.name=="event")].elements[?(@.name=="collection")].attributes',
  marketCollectionsMarkets: (obj: any) => (collectionIndex: number) => {
    const collections = query(
      obj,
      '$..elements[?(@.name=="response")].elements[?(@.name=="event")].elements[?(@.name=="collection")]'
    )
    return query(collections[collectionIndex], '$.elements[?(@.name=="market")].attributes')
  },
}

export const feedImporter: FeedImporter = async (ctx: RunContext) => {
  await category1s(ctx) // PLEASE NOTE ONLY CORAL WILL BE ABLE TO CREATE CATEGORY1 (the unique_prepend must be consistent during db processing)

  reduceMarketCollections(ctx)

  // return {} as RunReport
}

const category1s = async (ctx: RunContext) => {
  const {
    data: category1sJson,
    config: {url},
  } = await doRequest(uris.category1s, ctx)
  const category1sRaw = doJsonpath(category1sJson, jsonpaths.category1s)
  const category1sCommon = filterEntities(
    EntityName.category1,
    category1sRaw.map(
      (raw: RawEntity): Category1CommonEntity => {
        return {
          meta: {
            run_id: ctx.options.runId,
            url: url!,
            name: raw.name,
            id: raw.id,
            feed_supplier: FeedSupplierName.coral,
          },
          associations: {},
          fields: {
            processed: {
              display_order: parseInt(raw.displayOrder || '0'),
            },
          },
          import_tmp: {
            category: raw.category,
          },
          crunch_tmp: {
            unique_append: '',
            action: CrunchAction.update_and_create_processed,
          },
          type: EntityName.category1,
        }
      }
    ),
    ctx
  )

  if (ctx.options.validateSchema) {
    await validator(category1sCommon)
  }

  ctx.entities.category1s(category1sCommon)

  await category2s(ctx)
}

const category2s = async (ctx: RunContext) => {
  const {
    data: category2sJson,
    config: {url},
  } = await doRequest(uris.category2s, ctx)

  const category2sRaw = doJsonpath(category2sJson, jsonpaths.category2s)
  const category2sCommon = filterEntities(
    EntityName.category2,
    category2sRaw.reduce<Category2CommonEntity[]>((agg: Category2CommonEntity[], raw: RawEntity) => {
      // need to find by "category" attribute
      const category1Common = ctx.entities
        .category1s()
        .find((category1Common: Category1CommonEntity) => category1Common.import_tmp.category === raw.category)
      if (!category1Common) return agg

      agg.push({
        meta: {
          run_id: ctx.options.runId,
          url: url!,
          name: raw.name,
          id: raw.id,
          feed_supplier: FeedSupplierName.coral,
        },
        associations: {
          [EntityName.category1]: [category1Common.meta],
        },
        fields: {
          processed: {
            display_order: parseInt(raw.displayOrder || '0'),
          },
        },
        import_tmp: {
          category1Common,
        },
        crunch_tmp: {
          unique_append: ` ${category1Common.meta.name}`,
          action: CrunchAction.update_and_create_processed,
        },
        type: EntityName.category2,
      })
      return agg
    }, []),
    ctx
  )

  if (ctx.options.validateSchema) {
    await validator(category2sCommon)
  }

  ctx.entities.category2s(category2sCommon)

  await category2sCommon.reduce((promise, category2Common) => {
    return promise.then(() => {
      ctx.entities.category1(category2Common.import_tmp.category1Common)
      ctx.entities.category2(category2Common)
      return category3s(ctx).then(() => {
        // ctx.logger.log('debug', 'c2.')
      })
    })
  }, Promise.resolve())
}

const category3s = async (ctx: RunContext) => {
  const {
    data: category3sJson,
    config: {url},
  } = await doRequest(utilFormat(uris.category3s, ctx.entities.category2().meta.id), ctx)

  const category3sRaw = doJsonpath(category3sJson, jsonpaths.category3s)
  const category3sCommon = filterEntities(
    EntityName.category3,
    category3sRaw.reduce<Category3CommonEntity[]>((agg: Category3CommonEntity[], raw: RawEntity) => {
      const category1Common = ctx.entities.category1()

      agg.push({
        meta: {
          run_id: ctx.options.runId,
          url: url!,
          name: raw.name,
          id: raw.id,
          feed_supplier: FeedSupplierName.coral,
        },
        associations: {
          [EntityName.category2]: [ctx.entities.category2().meta],
        },
        fields: {
          processed: {
            display_order: parseInt(raw.displayOrder || '0'),
          },
        },
        crunch_tmp: {
          unique_append: ` ${ctx.entities.category1().meta.name}`,
          action: CrunchAction.update_and_create_processed,
        },
        type: EntityName.category3,
      })
      return agg
    }, []),
    ctx
  )

  if (ctx.options.validateSchema) {
    await validator(category3sCommon)
  }

  ctx.entities.category3s(category3sCommon)

  await category3sCommon.reduce((promise, category3Common) => {
    return promise.then(() => {
      ctx.entities.category3(category3Common)
      return events(ctx).then(() => {
        ctx.logger.log('debug', 'c3.', {runtime_label: 'IMPORTER', dumpables: {snapshot: [ctx.benchmarker.snapshot()]}})
      })
    })
  }, Promise.resolve())
}

const events = async (ctx: RunContext) => {
  const {
    data: eventsJson,
    config: {url},
  } = await doRequest(utilFormat(uris.events, ctx.entities.category3().meta.id), ctx)

  const eventsRaw = doJsonpath(eventsJson, jsonpaths.events)
  let eventsCommon = eventsRaw.reduce((agg: EventCommonEntity[], raw: RawEntity) => {
    agg.push(mapEventRawToCommon(ctx, raw, url!))
    return agg
  }, [])

  eventsCommon = filterEntities(EntityName.event, eventsCommon, ctx)

  if (ctx.options.validateSchema) {
    await validator(eventsCommon)
  }

  await eventsCommon.reduce((promise: Promise<any>, eventCommon: EventCommonEntity) => {
    return promise.then(async () => {
      ctx.entities.event(eventCommon)
      return eventAndMarkets(ctx).then(() => marketCollections(ctx))
    })
  }, Promise.resolve())
}

const eventAndMarkets = async (ctx: RunContext) => {
  const {
    data: eventJson,
    config: {url},
  } = await doRequest(utilFormat(uris.markets, ctx.entities.event().meta.id), ctx)

  const eventRaw = doJsonpath(eventJson, jsonpaths.event)
  const eventCommon = mapEventRawToCommon(ctx, eventRaw[0], url!)
  let homeTeam: string, awayTeam: string
  ctx.entities.event(eventCommon)
  ctx.entities.events([eventCommon])

  ctx.logger.log('verbose', `Processing event ${eventCommon.meta.name}`, {runtime_label: 'IMPORTER'})

  // we'll need specific context around the team names for events of MATCH_2_TEAMS
  if (ctx.entities.event().fields.processed.type === EventType.match_2_teams) {
    ;[homeTeam, awayTeam] = homeAwayTeamsParse(ctx)
  }

  const marketsRaw = doJsonpath(eventJson, jsonpaths.markets)
  let marketsCommon = filterEntities(
    EntityName.market,
    marketsRaw.reduce((agg: MarketCommonEntity[], raw: RawEntity) => {
      agg.push(mapMarketRawToCommon(ctx, raw, url!))
      return agg
    }, []),
    ctx
  )

  if (ctx.options.validateSchema) {
    await validator(marketsCommon)
  }

  marketsCommon = sortByDisplayOrder(marketsCommon)
  marketsCommon[0].fields.concrete.is_default = true // assuming lowest displayOrder is the default (e.g. Match Betting)
  ctx.entities.markets(marketsCommon)

  const outcomesCommon = marketsCommon.reduce<OutcomeCommonEntity[]>(
    (acc: OutcomeCommonEntity[], marketCommon: MarketCommonEntity, index: number) => {
      // update the market to replace team name with home/away
      if (ctx.entities.event().fields.processed.type === EventType.match_2_teams) {
        homeAwayReplaceTeamNamesMarket(homeTeam, awayTeam, marketCommon, ctx)
      }

      ctx.entities.market(marketCommon)

      const outcomesRaw = doJsonpath(eventJson, jsonpaths.outcomes, `${index}`)
      const outcomesCommon = filterEntities(
        EntityName.outcome,
        outcomesRaw.reduce<OutcomeCommonEntity[]>((agg: OutcomeCommonEntity[], raw: RawEntity) => {
          const marketCommon = ctx.entities.market()

          // when outcome.odds="SP" - http://tinyurl.com/yxcd6a5r
          const startingPriceApplicable = raw.odds === 'SP' || raw.odds_decimal === 'SP'

          agg.push({
            meta: {
              run_id: ctx.options.runId,
              url: url!,
              name: raw.name,
              id: raw.id,
              feed_supplier: FeedSupplierName.coral,
            },
            associations: {
              [EntityName.market]: [marketCommon.meta],
            },
            fields: {
              processed: {},
              concrete: {
                odds: startingPriceApplicable ? undefined : raw.odds,
                odds_decimal: startingPriceApplicable ? undefined : Big(raw.oddsDecimal),
                runner_number: raw.runnerNumber ? parseInt(raw.runnerNumber) : undefined, // tslint:disable-line
                handicap: raw.handicap,
                live_price_available: marketCommon.import_tmp.live_price_available,
                starting_price_available: startingPriceApplicable || marketCommon.import_tmp.starting_price_available,
                status: marketCommon.import_tmp.status,
                display_order: parseInt(raw.displayOrder || '0'),
              },
            },
            crunch_tmp: {
              unique_append: ` ${ctx.entities.category1().meta.name}`,
              action: CrunchAction.update_and_create_processed,
            },
            type: EntityName.outcome,
          })
          return agg
        }, []),
        ctx
      )

      // update the processed outcome records to have the home/away flag
      if (
        ctx.entities.event().fields.processed.type === EventType.match_2_teams &&
        marketCommon.fields.concrete.is_default
      ) {
        homeAwayFlagOutcome(homeTeam, awayTeam, outcomesCommon, ctx)
      }

      return acc.concat(outcomesCommon)
    },
    []
  )

  ctx.entities.outcomes(outcomesCommon)
}

const marketCollections = async (ctx: RunContext) => {
  const {
    data: marketCollectionsJson,
    config: {url},
  } = await doRequest(utilFormat(uris.marketCollections, ctx.entities.event().meta.id), ctx)

  const marketCollectionsRaw = doJsonpath(marketCollectionsJson, jsonpaths.marketCollections)
  const marketCollectionsCommon = filterEntities(
    EntityName.marketCollection,
    marketCollectionsRaw.reduce<MarketCollectionCommonEntity[]>(
      (acc: MarketCollectionCommonEntity[], raw: RawEntity, index: number) => {
        const category1Common = ctx.entities.category1()

        // find the markets of each marketCollection for the associations
        const marketsCollectionsMarketsRaw = doJsonpath(
          marketCollectionsJson,
          jsonpaths.marketCollectionsMarkets,
          `${index}`
        )

        const marketsCollectionsMarketsCommon = filterEntities(
          EntityName.market,
          marketsCollectionsMarketsRaw.reduce((acc: MarketCommonEntity[], raw: RawEntity) => {
            acc.push(mapMarketRawToCommon(ctx, raw, url!))
            return acc
          }, []),
          ctx
        )

        acc.push({
          meta: {
            run_id: ctx.options.runId,
            url: url!,
            name: raw.name,
            id: raw.id,
            feed_supplier: FeedSupplierName.coral,
          },
          associations: {
            [EntityName.market]: marketsCollectionsMarketsCommon.map(market => market.meta),
          },
          fields: {
            processed: {
              display_order: parseInt(raw.displayOrder || '0'),
            },
          },
          crunch_tmp: {
            unique_append: ` ${ctx.entities.category1().meta.name}`,
            action: CrunchAction.update_and_create_processed,
          },
          type: EntityName.marketCollection,
        })
        return acc
      },
      []
    ),
    ctx
  )

  if (ctx.options.validateSchema) {
    await validator(marketCollectionsCommon)
  }

  ctx.entities.marketCollections(marketCollectionsCommon)
}

const mapEventRawToCommon = (ctx: RunContext, raw: RawEntity, url: string): EventCommonEntity => {
  const statusMap: Dictionary<EventFields['concrete']['status']> = {A: Status.active, S: Status.suspended}
  const typeMap: Dictionary<EventFields['processed']['type']> = {
    MTCH: EventType.match_2_teams,
    TNMT: EventType.outright,
  }
  const bettingStatusMap: Dictionary<MarketFields['concrete']['betting_status']> = {PRICED: EventBettingStatus.priced}

  const eventDate = new Date(`${raw.date} ${raw.time}`)

  return {
    meta: {
      run_id: ctx.options.runId,
      url,
      name: raw.name,
      id: raw.id,
      feed_supplier: FeedSupplierName.coral,
    },
    associations: {
      [EntityName.category3]: [ctx.entities.category3().meta],
    },
    fields: {
      processed: {
        event_date: eventDate, // presuming UTC in feed?
        type: typeMap[raw.sort],
        display_order: parseInt(raw.displayOrder || '0'),
      },
      concrete: {
        displayed: toBool(raw.displayed),
        status: statusMap[raw.status],
        url: raw.url,
      },
    },
    import_tmp: {
      // the following are provided at Event level but feeds like Sky supply at market level which is semantically more correct
      bet_in_play: toBool(raw.hasBetInRun),
      bet_till: new Date(`${raw.betTillDate} ${raw.betTillTime}`),
      betting_status: bettingStatusMap[raw.bettingStatus],
      cashout_available: toBool(raw.cashoutAvailable),
    },
    crunch_tmp: {
      unique_append: ` ${eventDate.toISOString().slice(0, 10)} ${ctx.entities.category1().meta.name}`,
      action: CrunchAction.update_and_create_processed,
    },
    type: EntityName.event,
  }
}
const mapMarketRawToCommon = (ctx: RunContext, raw: RawEntity, url: string): MarketCommonEntity => {
  const eventCommon = ctx.entities.event()
  const statusMap: Dictionary<MarketFields['concrete']['status']> = {A: Status.active, S: Status.suspended}

  return {
    meta: {
      run_id: ctx.options.runId,
      url,
      name: raw.name,
      id: raw.id,
      feed_supplier: FeedSupplierName.coral,
    },
    associations: {
      [EntityName.event]: [ctx.entities.event().meta],
    },
    fields: {
      processed: {},
      concrete: {
        bet_in_play: eventCommon.import_tmp.bet_in_play,
        bet_till: eventCommon.import_tmp.bet_till,
        betting_status: eventCommon.import_tmp.betting_status,
        cashout_available: eventCommon.import_tmp.cashout_available,
        eachway_available: toBool(raw.eachwayAvailable),
        first_four_available: toBool(raw.firstFourAvailable),
        forecast_available: toBool(raw.forecastAvailable),
        guaranteed_price_available: toBool(raw.guaranteedPriceAvailable),
        place_available: toBool(raw.placeAvailable),
        quinella_available: toBool(raw.quinellaAvailable),
        status: statusMap[raw.status],
        tricast_available: toBool(raw.tricastAvailable),
        url: raw.url,
        display_order: parseInt(raw.displayOrder || '0'),
      },
    },
    import_tmp: {
      live_price_available: toBool(raw.livePriceAvailable),
      starting_price_available: toBool(raw.startingPriceAvailable),
      status: statusMap[raw.status],
    },
    crunch_tmp: {
      unique_append: ` ${ctx.entities.category1().meta.name}`,
      action: CrunchAction.update_and_create_processed,
    },
    type: EntityName.market,
  }
}

const filterEntities = <T extends CommonEntityUnion>(entityName: EntityName, entities: T[], ctx: RunContext): T[] => {
  const logIfNotComplete = (entityName: EntityName, filtered: T[], entities: T[]) => {
    if (filtered.length) {
      ctx.logger.log('verbose', `Filtered ${entityName}. ${filtered.length}/${entities.length}`, {
        runtime_label: 'IMPORTER',
      })
    }
  }

  switch (entityName) {
    case EntityName.category1:
      const filteredCategory1 = entities.filter(
        category1Common => category1Common.meta.name.toLowerCase() === 'football'
      )
      logIfNotComplete(entityName, filteredCategory1, entities)
      return filteredCategory1
    case EntityName.category3:
      const filteredCategory3 = entities.filter(
        category3Common => category3Common.meta.name.toLowerCase() === 'uefa champions league'
      )
      logIfNotComplete(entityName, filteredCategory3, entities)
      return filteredCategory3
    case EntityName.event:
      const filteredEvent = entities.filter(
        // both the outright and the champions league final
        eventCommon => ['Champions League 2018/19', 'Tottenham v Liverpool'].indexOf(eventCommon.meta.name) !== -1
      )
      logIfNotComplete(entityName, filteredEvent, entities)
      return filteredEvent
    case EntityName.marketCollection:
      const filteredMarketCollection = entities.filter(
        marketCollectionCommon => marketCollectionCommon.meta.name.toLowerCase() === 'match betting'
      )
      logIfNotComplete(entityName, filteredMarketCollection, entities)
      return filteredMarketCollection
    case EntityName.category2:
    case EntityName.market:
    case EntityName.outcome:
    default:
  }

  // ctx.logger.log('verbose', `Processing ${entityName}. Length: ${entities.length}`)
  return entities
}

const toBool = (val?: string): boolean => (typeof val === 'string' && val.toLowerCase() === 'y' ? true : false)
