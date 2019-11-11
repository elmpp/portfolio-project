// typing an unknown module - http://tinyurl.com/y6g5kt8l
declare module 'setup-polly-jest' {
  import {Polly, PollyConfig} from '@pollyjs/core'

  interface SetupContext extends Dictionary<any> {
    polly: Polly
  }
  export const setupPolly: (args: PollyConfig) => SetupContext
  // export {setupPolly}
}

declare module '@pollyjs/persister-rest' {
  const setupPolly: any
  export default setupPolly
}
