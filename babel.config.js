// This is for the benefit of jest's ts-jest preset...

// Note that this is matched relative to the "project root" (normally cwd,
// and not the currently compiled file) - https://goo.gl/Fn6wVN
// It has the opportunity to affect changes to the "current config" which will be built
// up from found .babelrc etc files before it
//
// https://github.com/babel/babel/pull/7358#issuecomment-388311941
// https://goo.gl/ZCNxFD

module.exports = {
  // overrides are things that will be merged into current config - i.e. allowing selective definition
  // and not the entire project config
  // - https://goo.gl/DT4Utr
  overrides: [
    {
      test: '*',
      ignore: ['/*.plain/'],
    },
    // {
    //   test: '*',
    //   presets: ['@babel/react'], // we shall always merge these in as jest will always need
    // },
  ],
  // standard preset-env but will be overridden by .babelrc files as not inside the `override`
  // presets: [
  //   [
  //     '@babel/preset-env',
  //     {
  //       targets: {
  //         node: 'current',
  //       },
  //     },
  //   ],
  // ],
  babelrcRoots: [
    // '.', // Keep the root as a package
    './packages/*', // Also consider monorepo packages "root" and load their .babelrc files.
  ],
}
