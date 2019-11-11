---
id: schema_models
title: Database/Models Schema
sidebar_label: Schema and Models
---

## Resources

- Useful tutorial on Continuous Deployment of databases - https://goo.gl/TfH2EU
- Generating `Objection.js` models from sql - https://goo.gl/nTP3Xw

  

## Development

An easily-iterable process is crucial with regard to managing changes to the "data layer".
This is of special import as the same layer will be apparent in importing/api/CMS applications.

This should explain the process by which a change to either the data model should propogate all the way to production

- The "master" definition of schema/models is held in the sql files within `partridge-schema/src/master`
- From these files, a database's DDL (schema), seed data (fixtures) and code (triggers, procedures etc) can be populated. Do so via `/partridge-schema/scripts/database.sh`
- From this SQL we can generate our `Objection.js` model files
- We can also generate the [migrations](https://goo.gl/gTwQRd) 
- The migrations should be applicable to the [test seeds](#Test Seeds) so they track DDL changes



## Test Seeds

These are data for preparing the database for tests.  They should be atomic and be identifyable to the test against which they should run.

They will live in `/partridge-schema/seeds/XXX`



## Adding new feed

- create a definition in `/partridge/config/src/config/feeds`
- add a proxy-mapping definition in the wiremock data directory: `/partridge-etc/wiremock-data/mappings/proxy-mapping-%FEED%.json`
