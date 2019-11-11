import {runFromFiles} from '../util'
import {createConnection} from 'partridge-models'

/**
 * Separating into own module as these code scripts should always be run after
 * all other migrations
 */
;(async () => {
  const connection = await createConnection()

  await runFromFiles(connection.manager, ['./code/1-clear-all.sql'])
  await runFromFiles(connection.manager, ['./code/2-types.sql'])
  await runFromFiles(connection.manager, ['./code/3-canonicalise.sql'])
  await runFromFiles(connection.manager, ['./code/4-procedures.sql'])
  await runFromFiles(connection.manager, ['./code/5-triggers.sql'])
  await runFromFiles(connection.manager, ['./code/6-views.sql'])
  await runFromFiles(connection.manager, [
    './code/7-api-queries.sql', // must be after 6-views
  ])

  await runFromFiles(connection.manager, ['./code/10-roles.sql'])

  console.log(`Code scripts loaded`)
  process.exit() // wut?
})()
