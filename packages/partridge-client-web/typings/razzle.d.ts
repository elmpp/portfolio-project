declare namespace NodeJS {
  interface ProcessEnv {
    // define all the razzle build process.env - https://tinyurl.com/y26btw63
    RAZZLE_PUBLIC_DIR: string
    RAZZLE_ASSETS_MANIFEST: string
    REACT_BUNDLE_PATH: string
    VERBOSE?: string
    PORT?: number
    HOST: string
    NODE_ENV: 'development' | 'production'
    // BUILD_TARGET: 'node' | 'web' // @see /packages/typings/app.d.ts
    PUBLIC_PATH: string
    CLIENT_PUBLIC_PATH: string
    
    // GITHUB_AUTH_TOKEN: string;
    // NODE_ENV: 'development' | 'production';
    // PORT?: string;
    // PWD: string;
  }
}