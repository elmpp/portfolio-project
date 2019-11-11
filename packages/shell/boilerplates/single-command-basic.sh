#!/usr/bin/env bash


_PACKAGEBASE=packages/partridge-shell


#
#
#  SIMPLE COMMAND 
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

_SHELLBASE="${_PACKAGEBASE}/node_modules/shell"

###############################################################################
# Environment
###############################################################################

# $_ME
#
# Set to the program's basename.
_ME=$(basename "${0}")

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
	# shellcheck disable=SC1090
	source "${__FULLPROJECTPATH}/${_SHELLBASE}/scripts/includes/common-functions.sh"
  # shellcheck disable=SC1090
	source "${__FULLPROJECTPATH}/${_SHELLBASE}/scripts/includes/useful-functions.sh"
	# shellcheck disable=SC1090
	source "${__FULLPROJECTPATH}/${_SHELLBASE}/scripts/includes/boilerplate-functions.sh"
  # shellcheck disable=SC1090
	source "${__FULLPROJECTPATH}/${_SHELLBASE}/scripts/includes/notification-functions.sh"
	# _load_config - uncomment to load env file from /config/${_APP_ENV}.env
}
_bootstrap


###############################################################################
# Help
###############################################################################

# _print_help()
#
# Usage:
#   _print_help
#
# Print the program help information.
_print_help() {
  cat <<HEREDOC

Boilerplate for creating a simple bash script with some basic strictness
checks and help features.

Usage:
  ${_ME} [<arguments>]
  ${_ME} -h | --help

Options:
  -h --help  Show this screen.
HEREDOC
}

###############################################################################
# Program Functions
###############################################################################

_do_main() {
  printf "Perform a do_main operation.\\n"
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
  if [[ "${1:-}" =~ ^-h|--help$  ]]
  then
    _print_help
  else
    _do_main "$@"
  fi
}

# Call `_main` after everything has been defined.
_main "$@"