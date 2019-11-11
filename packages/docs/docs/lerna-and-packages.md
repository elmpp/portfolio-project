---
id: lerna_and_packages
title: Packages/Lerna
sidebar_label: Packages/Lerna
---

## New Package

#### Microbundle / TSDX / Rollup

Attempts were made to use these for packaging but ultimately unsuitable, at least for `partridge-config` and `partridge-logging` (former needs /config simply transpiling and copying file-for-file; latter uses conditional `require()` which is hoisted by rollup's `commonjs` plugin which causes [documented](errors_previous.md) error for `http2` on client))

When microbundle supports `.babelrc` , it will be worthwhile migrating over. Now we will just stick to using tsc.

#### Buildable

>  buildable package is one that will be containerised and released

- `lerna create xxxx`
- add `"prepare": "cd ../.. && yarn prepare"` to package.json
- Copy `jest.config.js` , `tsconfig.json.*` , `.babelrc.js` and `package.json::scripts `   from `partridge-config`  -> (`cp packages/partridge-config/{jest.config.js,tsconfig.*} packages/XXX/`)
- add to `/jest.config.js`
- update `PARTRIDGE_BUILDABLE_PACKAGES` in /packages/partridge-shell/config/local.env` (is not used currently however)
- @see below about containerising the package

#### Splittable

>  splittable package is one that will be be referenced as a dependency from another project

- lerna create xxxx`

- add `"postinstall": "cd ../.. && yarn prepare"` to package.json

- Do `cp packages/partridge-config/{jest.config.js,tsconfig.json,tsconfig.build.json,.babelrc.js} packages/XXX/`)

- Copy the scripts from within partridge-config/package.json

- add to `/jest.config.js`

- create repo in github (if splittable package)

- Update the repository::url field withing the new `package.json` to the new address above

- go to settings -> collaborators and add `partridgeShippable`

- log into `odds4udotcom@gmail.com` (gmail) and accept email (github act: `odds4udotcom@gmail.com / partridgeShippable`. Password is usual)

- update `PARTRIDGE_SPLITTABLE_PACKAGES` in /packages/partridge-shell/config/local.env`

- Git commit the new package

- o a subtree sync to seed the (branch) tags for the new package repo - e.g. `./packages/partridge-shell/scripts/versioning.sh subtree-sync 0.44.0 --debug`

## Containerising

> containerising is packaging of code to be a deployable/releasable service

###### local deployment:

* add into `/containers/docker-compose/local.yaml`   (consult `local.md` for correct port numbers)

###### prod deployment:

* add step in `cloudbuild-release.yaml`

* add necessary Dockerfiles etc. (consult `local.md` for correct port numbers)

  * For new packages, need to force a build regardless of its `lerna changed` status - toggle final param in `cloudbuild-release.yaml` :: `extract-for-build` stages

## Linking Packages Together Locally

- e.g. to depend upon the `shell` package from another but locally (i.e. non-published):

  `lerna add shell --scope=partridge-shell` then do `lerna link`. This should create a symlink

  within the package's `node_modules`
- the format of the dependency within package.json should then be updated to a committish

  style. e.g. `^0.42.0`  (**need only be done within packages that will be built with docker)

## No hoisting

Add into root `package.json` as described here - https://tinyurl.com/y244ofcc

Try to use as little as possible. This project has a nice approach to mitigating it via postinstall (and one we use within partridge-client-frontend) - https://tinyurl.com/yytvctjg
