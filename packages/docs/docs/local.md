---
id: local
title: Local Development
sidebar_label: Local
---

<!-- > Process to get a development process running locally -->

## New Repository

```bash
git clone xxx
cd packages/docs/website; yarn
yarn bootstrap
git-flow init -d
```

## Local

Running `yarn dev` from root will: 

- trigger the `yarn dev` in each applicable project. This will result in:
  - Frontend running a server (via nodemon). This will be at [this url](http://localhost:3000/nextroutes/manchester-united/liverpool)
  - Docs to be brought up. This will be at [this url](http://localhost:3001/docs/packages_and_lerna) 
- bring up `docker-compose` containers. Ideal for integration testing etc. This will be the current working directory source. However, this will only do `yarn start` and not build etc

## Docker-Compose

### Postgres

To force a rebuild of the data dir which is needed when changing passwords, config etc:

```bash
cd packages/partridge-schema; deleteDbAndMigrate;
```

## Ports

| Service                                                                                    | Port                                               | Docker port (if available) |
| ------------------------------------------------------------------------------------------ | -------------------------------------------------- | -------------------------- |
| partridge-client-frontend                                                                  | http://localhost:3000                              | http://localhost:8080      |
| partridge-client-frontend                                                                  | http://localhost:3001 (Razzle uses 2 ports in dev) |                            |
| partridge-importer                                                                         | http://localhost:3002                              | http://localhost:8082      |
| partridge-api                                                                              | http://localhost:3003                              | http://localhost:8003      |
| partridge-client-mobile (remote url)                                                       | http://localhost:19000                             |                            |
| partridge-client-mobile (devtools)                                                         | http://localhost:19002                             |                            |
| partridge-client-frontend functional <br/>(@see jest-puppeteer.config.js -> config.server) | 3010                                               |                            |
| pollyjs                                                                                    | 3020                                               |                            |
| docs                                                                                       | http://localhost:3021                              |                            |
| partridge-storybook                                                                        | http://localhost:3022                              |                            |
| webpack-bundle-analyzer                                                                    | http://localhost:3023                              |                            |
