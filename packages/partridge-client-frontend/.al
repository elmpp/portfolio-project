#!/bin/sh
alias apollo='npx apollo'

alias yarndev='pushd ../../ && yarn transpile && popd && yarn dev'

alias jest='rm -rf node_modules/.cache; rm -rf .next/; npx jest --clearCache; NODE_ENV=test npx jest --verbose false --forceExit'
alias jestw='rm -rf node_modules/.cache; rm -rf .next/; npx jest --clearCache; NODE_ENV=test npx jest --watch --verbose false --forceExit'
# remember the below hides console.log messages - https://goo.gl/2DCWYo
alias jestwverbose='rm -rf node_modules/.cache; rm -rf .next/; jest --clearCache; NODE_ENV=test ./node_modules/.bin/jest --watch --verbose true --forceExit'
