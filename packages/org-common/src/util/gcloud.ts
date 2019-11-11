/**
 * All modules within org-common should be universal (not use node libraries)
 */

// import fs from 'fs'

// export enum ServiceAccountFields {
//   privateKey = 'private_key',
// }

// export const serviceAccountField = (filepath: string, field: ServiceAccountFields) => {

//   // const serviceAccountContents: Dictionary<any> = JSON.parse(fs.readFileSync(filepath, 'utf8'))
//   const fileContents = fs.readFileSync(filepath, 'utf8')
//   const serviceAccountContents = JSON.parse(fileContents)

// // console.log('filepath :', filepath);
// // console.log('field :', field);
// // console.log('serviceAccountContents :', serviceAccountContents);

//   let contents

//   switch (field) {
//     case ServiceAccountFields.privateKey:
//       contents = serviceAccountContents[ServiceAccountFields.privateKey]
//   }

//   if (typeof contents === 'undefined') {
//     throw new Error(`Unrecognised field when retrieving service account field "${field}"`)
//   }

//   return contents
// }
