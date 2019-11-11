#!/usr/bin/env bash

_PACKAGEBASE=packages/partridge-shell
# shellcheck disable=SC2034
_SUBCOMMAND_PROGRAM_LIST='unit functional e2e environmental'
_VERSION=1.2.0


#
#
#  BASELINE PROGRAM WITH SOME SUBCOMMAND SWITCHING
#   - https://goo.gl/yaETDq
#
#
# Bash Boilerplate: https://github.com/alphabetum/bash-boilerplate
#
# Copyright (c) 2015 William Melody • hi@williammelody.com


###############################################################################
# Strict Mode
###############################################################################

# Bash 'Strict Mode'
# http://redsymbol.net/articles/unofficial-bash-strict-mode
# https://github.com/alphabetum/bash-boilerplate#bash-strict-mode
set -o nounset
set -o errexit
set -o pipefail
IFS=$'\n\t'

###############################################################################
# Environment
###############################################################################

# $_ME
#
# Set to the program's basename.
_ME=$(basename "${0}")
_SHELLBASE="${_PACKAGEBASE}/node_modules/shell"

###############################################################################
# _bootstrap
###############################################################################
# _bootstrap()
#
# Usage:
#   _bootstrap
#
# Description:
#   Ensures current directory will be monorepo root and includes common functions
#
_bootstrap() {
	__FULLPROJECTPATH="$(
		cd "$(dirname "$0")"
		pwd -P | sed -e 's/\/packages\/.*//g'
	)"
  PATH=$PATH:"${__FULLPROJECTPATH}/${_PACKAGEBASE}/scripts:${__FULLPROJECTPATH}/${_PACKAGEBASE}/scripts/commands"
	cd "${__FULLPROJECTPATH}"
	# shellcheck disable=SC1090
	source "${_SHELLBASE}/includes/common-functions.sh"
	# shellcheck disable=SC1090
	source "${_SHELLBASE}/includes/useful-functions.sh"
	# shellcheck disable=SC1090
	source "${_SHELLBASE}/includes/boilerplate-functions.sh"
	# shellcheck disable=SC1090
	source "${_SHELLBASE}/includes/notification-functions.sh"
	_load_config
}
_bootstrap
# shellcheck disable=SC1090
source "${_SHELLBASE}/includes/boilerplate-with-subcommands.sh"




###############################################################################
# Help
###############################################################################

# shellcheck disable=SC2034
read -r -d '' "_program_help" <<EOM || true
*********************************************
*** Run Partridge tests ***
*********************************************
Version: ${_VERSION}
Usage:
  ${_ME} unit <pathRegex>
  ${_ME} functional <pathRegex>
  ${_ME} e2e
  ${_ME} environmental
  ${_ME} -h | --help
  ${_ME} --version
Subcommands:
  unit         Unit tests
  functional   Web tests that run against a deployed app.  <domain>
  e2e          Web tests that run against a deployed app. Normally a subset of ^ functional  <domain>
  environmental     Web tests that run against a deployed app on docker-compose/GCP. Produce side effects to be manually verified.
Options:
  -h --help  Display this help information.
  --version  Display version information.
  --force    Suppress confirmation prompt.
EOM


###############################################################################
# Program Functions
###############################################################################

_do_main() {
  _debug printf "_do_main() >> start\\n"

  case "${_SUBCOMMAND}" in
    "unit")
      local _PASSTHRU_OPTIONS
      _PASSTHRU_OPTIONS=$(_passthru_options '--verbose' '--no-cache' '--watch')
      local _REGEX="^(?!.*(functional|environmental).spec.[tj]sx?).*${_ARGUMENTS[1]:-}.*$"

      show_info "*** If seeing \"Unexpected Identifier\" errors, try running with --no-cache / clearing cache etc ***"

      local _TEST_CMD="APP_NAME='partridge-tests' APP_VERSION='0.21' npx jest ${_PASSTHRU_OPTIONS} --forceExit --testPathPattern='${_REGEX}'"
      debug "${_TEST_CMD}"
      eval "${_TEST_CMD}"
      ;;
    "functional")
      local _APP_ENV
      _APP_ENV=$(_require_argument "${_ARGUMENTS[1]:-local}" "APP_ENV")
      _REGEX="^.*${_ARGUMENTS[2]:-}.*\\.functional.spec.[tj]sx?$"
      local _PASSTHRU_OPTIONS
      _PASSTHRU_OPTIONS=$(_passthru_options '--verbose')
      local _TEST_CMD="APP_ENV=${_APP_ENV} OVERRIDABLE_TEST_KEY='this has been overriden' APP_NAME='partridge-tests' APP_VERSION='0.21' npx jest ${_PASSTHRU_OPTIONS} --forceExit --config='./jest-functional.config.js' --testPathPattern=${_REGEX}"
      debug "${_TEST_CMD}"
      eval "${_TEST_CMD}"
      ;;
    "e2e")
      _do_e2e "${_ARGUMENTS[1]:-}" "${_ARGUMENTS[2]:-}"
      ;;
    "environmental")
      _do_environmental "${_ARGUMENTS[1]:-}"
      ;;
    "help")
      _print_help
      ;;
  esac
}

_do_e2e() {
  local _TEST_CMD
  local _APP_ENV
  local _PASSTHRU_OPTIONS

  _APP_ENV=$(_require_argument "${1:-}" "APP_ENV (local_e2e|ci_e2e)")
  _REGEX="^.*${2:-}.*\\.functional.spec.[tj]sx?$"
  _PASSTHRU_OPTIONS=$(_passthru_options '--verbose' '--no-cache')

  if [[ ${_APP_ENV} != *"_e2e"* ]]; then
    die "APP_ENV must be (local_e2e|ci_e2e)"
  fi

  if [[ "${_APP_ENV}" =~ 'local' ]]; then
    _TEST_CMD="APP_ENV=${_APP_ENV} APP_NAME='partridge-tests' APP_VERSION='0.21' DEBUG=logging:setup PARTRIDGE_FRONTEND_HOST='$(_frontend_service_ip)' npx jest ${_PASSTHRU_OPTIONS} --config='./jest-e2e.config.js' --testPathPattern=${_REGEX}"
  else
    _TEST_CMD="APP_ENV=${_APP_ENV} APP_NAME='partridge-tests' APP_VERSION='0.21' DEBUG=logging:setup npx jest ${_PASSTHRU_OPTIONS} --config='./jest-e2e.config.js' --testPathPattern=${_REGEX}"
  fi
  debug "${_TEST_CMD}"
  eval "${_TEST_CMD}"
}

_do_environmental() {
  local _TEST_CMD
  local _PASSTHRU_OPTIONS

  _REGEX="^.*${1:-}.*\\.environmental.spec.[tj]sx?$"
  _PASSTHRU_OPTIONS=$(_passthru_options '--verbose' '--no-cache')

  _TEST_CMD="NODE_CONFIG_DIR='./packages/partridge-config/dist/config' APP_NAME='partridge-tests' APP_VERSION='0.21' APP_ENV=local DEBUG=logging:* PARTRIDGE_FRONTEND_HOST='$(_frontend_service_ip)' npx jest ${_PASSTHRU_OPTIONS} --config='./jest-environmental.config.js' --testPathPattern=${_REGEX}"
  debug "${_TEST_CMD}"
  eval "${_TEST_CMD}"
}

_frontend_service_ip() {
  echo 'http://localhost:8080'
}

_set_test_envs() {
  if [[ "${1:-0}" == 'functional' ]]
  then
    _print_help
  elif [[ "${_PRINT_VERSION:-0}" == '1' ]]
  then
    _print_version
  else
    _do_main "$@"
  fi
}

###############################################################################
# Main
###############################################################################

# _main()
#
# Usage:
#   _main [<options>] [<arguments>]
#
# Description:
#   Entry point for the program, handling basic option parsing and dispatching.
_main() {
  # Avoid complex option parsing when only one program option is expected.
  # if [[ "${1:-}" =~ ^-h|--help$  ]]
  if [[ "${_PRINT_HELP:-0}" == '1' ]]
  then
    _print_help
  elif [[ "${_PRINT_VERSION:-0}" == '1' ]]
  then
    _print_version
  else
    _do_main "$@"
  fi
}

# Call `_main` after everything has been defined.
_main "$@"