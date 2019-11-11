---
id: errors_previous
title: Previous Errors
sidebar_label: Errors Encountered
---

> Error: Failed to load gRPC binary module because it was not installed for the current system
> Expected directory: node-v64-linux-x64-musl
> Found: [node-v57-linux-x64-glibc]

Do not assert anything but will run against a live deployment on the actual environment. There to
provide a suite to run which should produce side effects on the environment which should be manually
checked. 

Should be run ad-hoc and not part of CI

Examples:

- logging against the GCE stackdriver to prove in correct format
- checking of certs to ensure ACL set up correctly etc

> Object not found - no match for id (xxxx)

The local git working copy ist kaputt. Had to (re)clone the working directory to fix (@see local.md :: new_repo)

> docs: /bin/sh: docusaurus-build: command not found

```bash
cd packages/docs/website; yarn
```

> UnhandledPromiseRejectionWarning: Error: Unsuccessful response status code. Request failed with status code 403
>     at Gaxios.<anonymous> (/Users/matt/dev/partridge/partridge/node_modules/gaxios/build/src/gaxios.js:73:27)

Anything to do with `Gaxios` is gonna be Stackdriver (or anything using `grpc`). 

Fix: you may find that logging is blocked from coffee shops etc

> Module not found: Can't resolve 'http2'

Anything involving http2, net, tls (node inbuilts) will be down to nextjs webpack trying to bundle them for the client. It probably will be due to `partridge-logging` not conditionally excluding stackdriver (which has dependencies of grpc etc etc)

> cannot use link outside of a react-router router

Check the versions of react-router packaged in server and client bundles - should be same version numbers

# Expo / React Native

> Couldn't adb reverse: adb: error: cannot bind listener: Operation not permitted

fix: https://tinyurl.com/y2wmedmg

> /Users/matt/dev/partridge/partridge/node_modules/react-native/Libraries/Utilities/warnOnce.js:15
> const warnedKeys: {[string]: boolean} = {};
>       ^^^^^^^^^^
> 
> SyntaxError: Missing initializer in const declaration
>     at new Script (vm.js:79:7)
>     at createScript (vm.js:251:10)
>     at Object.runInThisContext (vm.js:303:10)
>     at Module._compile (internal/modules/cjs/loader.js:656:28)
>     at Object.Module._extensions..js (internal/modules/cjs/loader.js:699:10)
>     at Module.load (internal/modules/cjs/loader.js:598:32)
>     at tryModuleLoad (internal/modules/cjs/loader.js:537:12)
>     at Function.Module._load (internal/modules/cjs/loader.js:529:3)
>     at Module.require (internal/modules/cjs/loader.js:636:17)
>     at require (internal/modules/cjs/helpers.js:20:18)
>     at Object.<anonymous> (/Users/matt/dev/partridge/partridge/node_modules/react-native/Libraries/react-native/react-native-implementation.js:14:18)
>     at Module._compile (internal/modules/cjs/loader.js:688:30)
>     at Object.Module._extensions..js (internal/modules/cjs/loader.js:699:10)
>     at Module.load (internal/modules/cjs/loader.js:598:32)
>     at tryModuleLoad (internal/modules/cjs/loader.js:537:12)
>     at Function.Module._load (internal/modules/cjs/loader.js:529:3)

This is actually some `flow` code being run and is caused by `react-native` being bundled and ran. Probably find the  module alias from `react-native` to `react-native-web` isn't in effect



> The Expo SDK requires Expo to run. It appears the native Expo modules are unavailable and this code is not running on Expo.

 - Ensure am connected to a good wifi network!!

 - `yarn bc`; restart emulator; delete expo on phone to upgrade it; etc etc

# Jest Tips

### Easy way to mock part of object

```js
const logger = {log: jest.fn()}
jest.doMock('partridge-logging', () => ({default: logger}))
```

### Giving mocks a typescript type

```js
const clientEnhancer = clientEnhancerModule.default as jest.Mock<typeof clientEnhancerModule.default> // https://goo.gl/3JdZkZ
```

### Multiple tests fail but pass individually

```js
  afterEach(() => {
    jest.resetModules() // seems to reset any module caches in jest
  })
```

### Expect: Matching sub object

```js
expect(largeObject).toEqual(expect.objectContaining(smallerObject)) // https://goo.gl/6AcBeY
```

# Jest Errors

### "jest.fn() value must be a mock function or spy."

Must be using `jest.spyOn()` in order to do `expect(xxx).toHaveBeenCalled()`

### Fetch is not a function etc

```javascript
Try changing the testEnvironment (@see jest-testing.md)
```
