#!/usr/bin/env node

/**
 * Takes the api schema (dumped via postgraphile) and client schemas (from src/stateful)
 * ; combines and dumps to file for ease of use from then on (mocking, codegen etc)
 *
 *   - merging util - https://tinyurl.com/y5mersu7
 *   - printing GraphQLSchema to file - https://tinyurl.com/y2wk48kf
 */

const { loadSchema } = require('graphql-toolkit')
const fs = require('fs')
const path = require('path')
const { printSchema } = require('graphql')


;(async () => {
  const combined = await loadSchema([path.resolve(__dirname, '../schema-dump-api.graphql'), path.resolve(__dirname, '../src/stateful/**/*.graphql')])
  fs.writeFileSync(path.resolve(__dirname, '../schema-dump-combined.graphql'), printSchema(combined))
})()
