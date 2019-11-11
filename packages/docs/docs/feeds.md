---
id: feeds
title: Feeds
sidebar_label: Feeds
---



### Running locally to seed database

 - cd partridge-schema && dropSchemaAndMigrateWithSeed

 - cd partridge-importer && runimportercoraljest

 - go into Tableplus and do first query of the "SQL Query" tab - > sub into the `process_queue()` function

Note there is no need to run the pollyjs server or anything (done via the node-http-adaptor used in jest)



### Troubleshooting Pollyjs

If the jest test isn't matching requests, the debug will include all the things it's trying to match against.

Note that the directory names have no bearing on what will match - that's all within the various `recording.har` files





<!-- > Scratchpad for feed data details -->

# Coral

### IDs

| Category1 (categories) | ID  |
| ---------------------- | --- |
| football               | 16  |
| tennis                 | 34  |

| Category2 (classes)             | ID  |
| ------------------------------- | --- |
| football england                | 97  |
| football international          | 115 |
| Football UEFA Club Competitions | 165 |

| Category3 (types)     | ID    | Sport    |
| --------------------- | ----- | -------- |
| premier league        | 442   | Football |
| fa cup                | 438   | Football |
| UEFA Champions League | 25230 | Football |
|                       |       |          |
