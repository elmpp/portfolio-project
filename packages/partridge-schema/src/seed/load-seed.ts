import {runFromFiles} from '../util'
import {createConnection} from 'partridge-models'
;(async () => {
  const seedArgv = process.argv[2]
  if (!seedArgv) {
    throw new Error('Argument SEED_FILENAME required')
  }

  const connection = await createConnection()

  await runFromFiles(connection.manager, [`seed/${seedArgv}`])
    .catch(err => {
      console.log(err)
      process.exit() // wut?
    })
    .then(() => {
      console.log(`Seed file loaded`)
      process.exit() // wut?
    })
})()
