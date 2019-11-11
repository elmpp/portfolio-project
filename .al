#!/usr/bin/env bash

# https://goo.gl/7BznCA
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

alias npm='echo "use yarn"'
alias yarn='npx yarn'
alias jestcc='npx jest --clearCache'
alias jest="npx jest"
alias tslint="npx tslint"

function jests() { yarn test:unit "${1}" --no-cache; }
function jestw() { echo -e 'ensure build has been run!!'; yarn test:unit "${1}" --watch; }
function jestt() { echo -e 'ensure build has been run!!'; yarn test:unit "${1}"; }
function jestfunctionalw() { echo -e 'ensure build has been run!!'; yarn test:functional local "${1}" --watch; }
function jestfunctional() { echo -e 'ensure build has been run!!'; yarn test:functional local "${1}"; }
function jestenvironmentalw() { echo -e 'ensure build has been run!!'; yarn test:environmental "${1}" --watch; }
function jestenvironmental() { echo -e 'ensure build has been run!!'; yarn test:environmental "${1}"; }

alias devenvup="./packages/partridge-shell/scripts/local.sh up --debug"
alias devenvup="./packages/partridge-shell/scripts/local.sh down --debug"
alias docsreload="lerna run --scope=docs dev"

function feature() { ./packages/partridge-shell/scripts/versioning.sh feature-branch-start "${1}" --debug; }
function featurefinish() { ./packages/partridge-shell/scripts/versioning.sh feature-branch-finish "${1}" --debug; }
function release() { yarn lint && ./packages/partridge-shell/scripts/versioning.sh release-branch-start --debug; git checkout develop; git fetch; }
function abortfeature() { ./packages/partridge-shell/scripts/versioning.sh feature-branch-abort "$@" --debug; }
function abortrelease() { ./packages/partridge-shell/scripts/versioning.sh release-branch-abort "$@" --debug; }
function abortreleaselocal() { ./packages/partridge-shell/scripts/versioning.sh release-branch-abort-local "$@" --debug; }

function deployversion() {
gcloud builds submit --config packages/containers/cloud-build/cloudbuild-deploy.yaml --substitutions _APP_VERSION="${1}" ./packages/containers/etc/ssh-keys;
}

# aliasing subcommands - https://tinyurl.com/y272d9lf
function lernaWithSubcommands() {
  case $1 in
    add)
      shift
      command npx lerna add --no-bootstrap "$@" && lerna link --force-local
      ;;
    *)
      command npx lerna "$@";;
  esac
}
alias lerna='lernaWithSubcommands'

function yarnWithSubcommands() {
  if [[ $# -eq 0 ]] ; then
    echo -e 'npx yarn install --ignore-scripts ...etc'
    command npx yarn --ignore-scripts "$@" && yarn prepare || true
  else

    case $1 in
      add)
        shift
        echo -e 'npx yarn add --ignore-scripts ...etc'
        command npx yarn add --ignore-scripts "$@" && yarn prepare || true
        ;;
      addAndBuild)
        shift
        command npx yarn add "$@"
        ;;
      *)
        command npx yarn "$@";;
    esac
  fi

}
alias yarn='yarnWithSubcommands'
