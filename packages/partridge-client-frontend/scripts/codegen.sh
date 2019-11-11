#!/usr/bin/env bash

_PACKAGEBASE=packages/partridge-client-frontend
# shellcheck disable=SC2034
_SUBCOMMAND_PROGRAM_LIST='generate'
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
	# _load_config - uncomment to load env file from /config/${_APP_ENV}.env
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
*** Common macOS user account operations. *** 
*********************************************
Version: ${_VERSION}
Usage:
  ${_ME} generate
  ${_ME} -h | --help
  ${_ME} --version
Subcommands:
  generate   Runs all the codegen'ing (graphql -> typescript)
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
    "generate")
      cd packages/partridge-client-frontend

      # generate for the local state first - https://tinyurl.com/y45f2582
      # see `apollo.config.js` for mapping to graphql definitions
      # local _LOCAL_CMD="npx apollo codegen:generate \
      # --addTypename \
      # --outputFlat=./modules/__types__/graphql \
      # --target=typescript \
      # --config apollo.config.js
      # "
      # debug "${_LOCAL_CMD}"
      # eval "${_LOCAL_CMD}"

      local _CMD_API_GENERATE_CMD="npx apollo codegen:generate \
      --addTypename \
      --outputFlat=./modules/__types__/graphql \
      --target=typescript \
      --includes=modules/**/*.graphql
      "
      debug "${_CMD_API_GENERATE_CMD}"
      eval "${_CMD_API_GENERATE_CMD}"
      
      # # we can generate for all queries as defined in the api - https://tinyurl.com/y458yzcp
      # local _INTROSPECTION_FILE="/tmp/partridge-client-frontend.introspection.json"
      # local _CMD_API_DOWNLOAD_CMD="npx apollo service:download \
      # ${_INTROSPECTION_FILE} \
      # --endpoint=http://localhost:3003/graphql
      # "
      # debug "${_CMD_API_DOWNLOAD_CMD}"
      # eval "${_CMD_API_DOWNLOAD_CMD}"

      # # now generate - https://tinyurl.com/y45f2582
      # local _CMD_API_GENERATE_CMD="npx apollo codegen:generate \
      # --localSchemaFile=${_INTROSPECTION_FILE} \
      # --addTypename \
      # --outputFlat=./modules/__types__/graphql \
      # --target=typescript \
      # --includes=modules/**/*.graphql
      # "
      # debug "${_CMD_API_GENERATE_CMD}"
      # eval "${_CMD_API_GENERATE_CMD}"
      
      # # we have defined paths to local state graphql stuff in "apollo.config.js"
      # # so can just specify also the endpoint 
      # local _CMD_API_GENERATE_CMD="npx apollo client:codegen \
      # --addTypename \
      # --outputFlat=./modules/__types__/graphql \
      # --target=typescript \
      # "
      # debug "${_CMD_API_GENERATE_CMD}"
      # eval "${_CMD_API_GENERATE_CMD}"

      echo -e ''
		  show_success "Code generated"
      ;;
    "help")
      _print_help
      ;;
  esac
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