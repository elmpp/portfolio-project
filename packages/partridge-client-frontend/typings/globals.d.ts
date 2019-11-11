// interface Global {
//   __INIT_MATERIAL_UI__: any;
// }
// interface Process extends NodeJS.Process {
//   browser: any;
//   env: {
//     NODE_ENV: 'development' | 'production' | 'test';
//   }
// }

// https://goo.gl/nT3LNw
declare namespace NodeJS {
  interface Process {
    browser: any;
    env: {
      NODE_ENV: 'development' | 'production' | 'test'
      FRONTEND_HOST_WWW: string
      FRONTEND_HOST_WWW_MOBILE: string
      PORT: string
    }
  }
  interface Global {
    __INIT_MATERIAL_UI__: any;
    fetch: any;
  }
}
// declare const global: Global
// declare const process: Process