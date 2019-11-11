---
id: jest
title: Testing and Jest
sidebar_label: Jest
---

## Resources

- Good matcher examples - https://goo.gl/6AcBeY 


# Test types

### Unit

Ran locally (local/CI)

### Functional

Ran locally (local/CI) but against a "spun up" instance, accessible via localhost

### E2E

Ran against a live deployment on the actual environment. Accessible via some url (odds4u.com / minikube service url)

```bash
yarn test:e2e [local_e2e|ci_e2e]
```

### Environmental

Tests for developers' benefit that usually execute against live APIs and *have side effects*. For instance, running a full import that saves to db

* do not require a jest puppeteer dev server to be brought up

* should not be run anywhere other than local

Should not be run in CI at all.

```bash
yarn test:e2e [local_e2e|ci_e2e]
```

### Environment Smoke

Do not assert anything but will run against a live deployment on the actual environment. There to
provide a suite to run which should produce side effects on the environment which should be manually
checked. 

Should be run ad-hoc and not part of CI

Examples:

- logging against the GCE stackdriver to prove in correct format
- checking of certs to ensure ACL set up correctly etc



# Jest Tips

- the canonical jest test file is probably - `packages/partridge-logging/src/\_\_tests\_\_/index.spec.ts

- jest.mock() should be called outside of the `describe()` block

- mocks/spies etc should be prefixed `mockXXX`

### Easy way to mock part of object

```javascript
const logger = {log: jest.fn()}
jest.doMock('partridge-logging', () => ({default: logger}))
```

### Giving mocks a typescript type

```javascript
// mockNamedExport will be type 'mock'
import { namedExport } from "../dependency"

jest.mock('../dependency', () => ({
    namedExport: jest.fn()
}))

const mockNamedExport: jest.Mock<typeof namedExport> = namedExport as any
myApi.myApiMethod.mockImplementation(() => "test") // 

// http://tinyurl.com/y6m7xpe7
```

OR...

```javascript
// mockNamedExport will be type 'any'
const {namedExport: mockNamedExport} = jest.requireMock('./dependency.ts')

jest.mock('./dependency.ts', () => ({
    namedExport: jest.fn() 
}))

// http://tinyurl.com/yyynndg4
```

### Mocking ES6 Class

The key to this is understanding that the constructor function should return an object matching the class structure

```javascript
export default Class Example {
    log() {
        // blah
    }
}

------------

const mockExample = jest.requireMock('../example.ts') // default export

const mockLog = jest.fn() // notice 'mock' prefix AND done as reference ('new() returns an object so can't do e.g. `mockExample.log.mock`)
jest.mock('../example.ts', () => jest.fn().mockImplementation(() => ({
    log: mockLog
})))

expect(mockExample.mock.instances).toHaveLength(1) // checks for 'new()'
expect(mockExample.log).toHaveBeenCalled()

// http://tinyurl.com/y68wsahc
```

### Multiple tests fail but pass individually

```javascript
  afterEach(() => {
    jest.resetModules() // seems to reset any module caches in jest
  })
```

### Multiple require() calls

```
Multiple calls to require(‘foo’) may not cause the module code to be executed multiple times. This is an important feature. With it, “partially done” objects can be returned, thus allowing transitive dependencies to be loaded even when they would cause cycles.

If you want to have a module execute code multiple times, then export a function, and call that function.

// - http://tinyurl.com/y4wyd9h5
```

### Expect: Matching sub object

```javascript
expect(largeObject).toEqual(expect.objectContaining(smallerObject)) // https://goo.gl/6AcBeY
```

### Jest testEnvironment (jsdom|node)

```javascript
/**
 * @jest-environment node|jsdom
 */
```

# Jest Errors

### "jest.fn() value must be a mock function or spy."

Must be using `jest.spyOn()` in order to do `expect(xxx).toHaveBeenCalled()`
