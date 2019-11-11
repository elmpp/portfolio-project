---
id: snippets-js-ts
title: Snippets (js/ts)
sidebar_label: TS Snippets
---

# Javascript

##### IIFE / top-level await (immediately invoked functional expression)

```javascript
;(async () => {
  ...blah blah
  await runFromFiles()
})()
```

# Typescript

#### Mapped type from union

```javascript
type aUnion = 'some' | 'thing'
type mapped = {
    [K in aUnion]: AnotherType
}
```

#### Mapped type from enum

```javascript
enum EnumType {
    port: 'PORT'
}
type mapped = {
  [K in EnumType]: AnotherType    
 }
```

#### Enum generics

Read this: http://tinyurl.com/yxmxapvp

```javascript
export enum EntityName {
  category1 = 'CATEGORY1',
  category2 = 'CATEGORY2',
}


type EntityNameUnion = keyof typeof EntityName // 'category1' | 'category2'
```

#### Deep Partial<>

```javascript
// https://tinyurl.com/y6bwbroa
type $DeepPartial<T> = { [P in keyof T]?: $DeepPartial<T[P]> };
```

#### Elements/Properties of an Interface

```javascript
// https://tinyurl.com/yy4hepj9
type ValueOf<T> = T[keyof T]
```

#### Pick multiple

```javascript
Pick<DocumentProps, 'assets' |'helmet' | 'data'>
```

#### Defining process.env

```javascript
// https://tinyurl.com/y4p6r77d

namespace NodeJS {
  interface Process {
    NODE_ENV: 'development' | 'production'
    BUILD_TARGET: string
    PUBLIC_PATH: string
    CLIENT_PUBLIC_PATH: string
  }
}
```

#### Untyped Module

look at `/typings/pollyjs.d.ts`

#### Module Augmentation - 1

It is only possible to augment existing module declarations and not possible to create new top-level declarations. @see here - https://tinyurl.com/y4b9uay8

One possible solution is to "wipe over" a module's declaration with another `declare`. 

@see `partridge-client-frontend/typings/styled-system` for an example

#### Module Augmentation - 2

By importing (via relative import) the existing module, one can declare additional definitions for a module and re-export existing. See `/typings/afterjs.d.ts`

#### Module Augmentation - 3

To reference types from an amchilbient declaration without turning it into a module, can use `import()` :

```javascript
// as seen here - https://tinyurl.com/y2zol2mc

// plop.d.ts
interface PlopGenerator{
  description: string;
  prompts: import('inquirer').Question[]; // import() types - https://tinyurl.com/y2zol2mc
  actions: ActionConfig[];
}
```

#### Keyof key of

```javascript
const themed = (key: keyof Theme) => (props: ThemedProps) => props.theme[key]
```

#### 

#### ['new' expression, whose target lacks a construct signature in TypeScript](https://stackoverflow.com/questions/43623461/new-expression-whose-target-lacks-a-construct-signature-in-typescript)

Need to define an interface with a `new` element. Look at `start-server-webpack-plugin.d.ts` and `org-build:plugins.ts` for example



#### Dictionary with restricted indexes

To define an object with same types but restrict the keys (same as `as const`):

```javascript
// SO - https://tinyurl.com/y32pzugn
const createMappedDictionary = <T extends Dictionary<ViewStyle>(sameTypedObject: T) => sameTypedObject

export const sharedStyle = createMappedDictionary({ a: {blah: 'blah'}, b: {blah: 'blah'}}
```


