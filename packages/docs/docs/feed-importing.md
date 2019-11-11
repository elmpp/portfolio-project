---
id: feed_importing
title: Feed Importing
sidebar_label: Feed Importing
---



## Overview

- data retrieved from feed endpoint
- converted to json if required
- divided into basic entities - event, market, outcome, category etc
- marshalled into the "CommonEntity" format. This will be then (optionally) validated against a json schema
- Validation schema will be defined in JsonSchema. See below 👇 for how to generate this
- once validated, each object will be added to a JSON DB table, one for each entity. 

  This is to be known as the "Queue"
- there will be a recurrent DB process which shall take from the Queue. It will only operate on entities with the latest `runId`at a time (and probably within transactions etc)



## Adding new feed

- create a definition in `/partridge/config/src/config/feeds`
- add a proxy-mapping definition in the wiremock data directory: `/partridge-etc/wiremock-data/mappings/proxy-mapping-%FEED%.json`



## JSON Schema

The schema can _mostly_ be created from the typescript definitions. To refresh it (if it's not kicking in when it should etc):

`cd /packages/partridge-importer` &&`yarn jsonschema-generate`

edit `src/json-schema/common-entity-array.schema.json` and update 'MandatoryFields' to include `required` section. e.g.:

```javascript
"MandatoryFields": {
            "required": [
                "feed_supplier",
                "id",
                "name"
            ],
            "properties": {
                "feed_supplier": {
                    "$ref": "#/definitions/FeedSupplierName"
                },
                "id": {
                    "type": "string"
                },
                "name": {
                    "type": "string"
                }
            },
            "type": "object"
        },
```


