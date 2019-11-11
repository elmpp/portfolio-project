// apollo cli and vscode extension configuration - https://goo.gl/GwLmnz
module.exports = {
  client: {
    // service: { // https://tinyurl.com/y5p23ttc
    //   name: 'apollo-responsive',
    //   // localSchemaFile: 'modules/apollo-responsive/__graphql__/types.graphql',
    //   localSchemaFile: './modules/**/*.graphql',
    // },
    // excludes: ['modules/apollo-responsive/__graphql__/types.graphql', '**/*.skip.*'],
    // includes: ['src/**/*.ts', 'src/**/*.js'],
    // includes: ['modules/**/__graphql__/*.graphql'], // this handles the local state queries and types - https://tinyurl.com/yxq9nfq6
    
    // includes: ['modules/**/*.ts', 'modules/**/*.tsx'], // https://tinyurl.com/yxq9nfq6
    includes: ['modules/**/*.ts', 'modules/**/*.tsx'], // https://tinyurl.com/yxq9nfq6
    excludes: ['./modules/__types__/*', '**/*.skip.*'],
    // includes: [], // this handles the local state queries and types - https://tinyurl.com/yxq9nfq6
    // includes: ['./modules/**/*.graphql'], // this handles the local state queries and types - https://tinyurl.com/yxq9nfq6
    service: { // used when introspecting the api - https://tinyurl.com/y67lxj3h
      name: 'partridge-api',
      url: 'http://localhost:3003/graphql',
      skipSSLValidation: true,
    },
  },
}
