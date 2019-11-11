# `typings`

> Global typings for consumption across all packages

## Resources

 - docs arounds typescripts definition resolving: https://www.typescriptlang.org/docs/handbook/tsconfig-json.html#types-typeroots-and-types

## Usage


In the consuming package
 - add as dev dependency
 - run `lerna bootstrap / lerna link`
 - add this to the `tsconfig.json`:

```
{
   "files": ["node_modules/@peartree/typings/index.d.ts", "XXX"],
}
```

or 

```
{
   "compilerOptions": {
      "typeRoots" : [
        "node_modules/@types",
        "node_modules/@peartree/typings"
      ]
   }
}
```