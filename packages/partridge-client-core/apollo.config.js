/**
 * Configures the various apollo tooling and is required.
 *  - apollo cli and vscode extension configuration - https://goo.gl/GwLmnz
 */
module.exports = {
  client: {
    includes: ['./src/stateful/**/*.graphql'], // for the sake of the introspection download cmd
    service: {
      // used when introspecting the api - https://tinyurl.com/y67lxj3h
      name: 'partridge-api',
      url: 'http://localhost:3003/graphql',
      skipSSLValidation: true,
    },
  },
}
