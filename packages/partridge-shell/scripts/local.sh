#!/usr/bin/env bash

_PACKAGEBASE=packages/partridge-shell
# shellcheck disable=SC2034
_SUBCOMMAND_PROGRAM_LIST='up up-gcr down delete'
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
  ${_ME} up
  ${_ME} up-gcr
  ${_ME} down
  ${_ME} delete
  ${_ME} -h | --help
  ${_ME} --version
Subcommands:
  up    Brings up local dev env
  up-gcr Brings up using latest images from gcr
  down  Takes down local dev env
  delete  Hard deletion of containers AND THEIR VOLUMES
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
    "up")

      echo -e ''
      show_warning "**************************************************************"
      show_warning "      Run 'yarn build' if all containers not successful"
      show_warning "**************************************************************"
      echo -e ''

      _call_script local down
      
      local _UP_CMD="docker-compose --file=packages/containers/docker-compose/local.yaml --project-directory=. --log-level=INFO up -d"
      debug "${_UP_CMD}"
      eval "${_UP_CMD}"

      echo -e ''
		  show_success "Environment up"
      ;;
    "up-gcr")

      echo -e ''
      show_warning "**************************************************************"
      show_warning "      Run 'yarn build' if all containers not successful"
      show_warning "**************************************************************"
      echo -e ''

      _call_script local down

      docker pull eu.gcr.io/partridge-alan/partridge-client-frontend:latest
      docker pull eu.gcr.io/partridge-alan/partridge-importer:latest
      docker pull eu.gcr.io/partridge-alan/partridge-api:latest
      
      local _UP_CMD="docker-compose --file=packages/containers/docker-compose/gcr.yaml --project-directory=. --log-level=INFO up -d"
      debug "${_UP_CMD}"
      eval "${_UP_CMD}"

      echo -e ''
		  show_success "Environment gcr up"
      ;;
    "down")
      local _CMD="docker-compose --file=packages/containers/docker-compose/local.yaml --project-directory=. down"
      debug "${_CMD}"
      eval "${_CMD}"

      echo -e ''
		  show_success "Environment down"
      ;;
    "delete")
      local _CMD="docker-compose --file=packages/containers/docker-compose/local.yaml --project-directory=. down --volumes"
      debug "${_CMD}"
      eval "${_CMD}"

      echo -e ''
		  show_success "Environment down and volumes deleted"
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