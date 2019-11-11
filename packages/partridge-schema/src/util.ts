import fs from 'fs'
import path from 'path'
import {EntityManager} from 'typeorm'

export const runQueries = (manager: EntityManager, queries: string[]) => {
  const prm = Promise.resolve()
  queries.forEach(query => {
    prm.then(() => manager.query(query))
  })
  return prm
}

export const runFromFiles = async (manager: EntityManager, files: string[]) => {
  return new Promise((resolve, reject) => {
    files.forEach(async (file, index) => {
      try {
        const query = fs.readFileSync(path.resolve(__dirname, `${file}`), 'utf-8')
        await manager.query(query)

        if (index === files.length - 1) {
          return resolve()
        }
      } catch (err) {
        return reject(err)
      }
    })
  })

  // await files.forEach(async (file: string) => {
  //   try {
  //     prm
  //       .then(() => fs.readFileSync(path.resolve(__dirname, `ll${file}`), 'utf-8'))
  //       .then(query => {console.log(query); return query;})
  //       .then(manager.query)
  //   }
  //   catch (err) {
  //     console.error(err)
  //     return Promise.reject(err)
  //     throw err
  //   }
  //   // const query = fs.readFileSync(path.resolve(__dirname, `ll${file}`), 'utf-8')
  //   // await manager.query(query)
  // })

  // return prm
}

export const prmSequential = (promises: Promise<any>[]) => {
  return promises.reduce((p, fn: any) => p.then(fn), Promise.resolve())
}
