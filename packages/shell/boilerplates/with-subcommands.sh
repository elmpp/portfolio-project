#!/usr/bin/env bash

_PACKAGEBASE=packages/partridge-shell
# shellcheck disable=SC2034
_SUBCOMMAND_PROGRAM_LIST='unit functional e2e'
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
	# shellcheck disable=SC1090
	source "${__FULLPROJECTPATH}/${_SHELLBASE}/includes/common-functions.sh"
	# shellcheck disable=SC1090
	source "${__FULLPROJECTPATH}/${_SHELLBASE}/includes/useful-functions.sh"
	# shellcheck disable=SC1090
	source "${__FULLPROJECTPATH}/${_SHELLBASE}/includes/boilerplate-functions.sh"
	# shellcheck disable=SC1090
	source "${__FULLPROJECTPATH}/${_SHELLBASE}/includes/notification-functions.sh"
	# _load_config - uncomment to load env file from /config/${_APP_ENV}.env
}
_bootstrap
# shellcheck disable=SC1090
source "${__FULLPROJECTPATH}/${_SHELLBASE}/includes/boilerplate-with-subcommands.sh"


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
  ${_ME} list
  ${_ME} login <username>
  ${_ME} logout [--force]
  ${_ME} logout
  ${_ME} window
  ${_ME} -h | --help
  ${_ME} --version
Subcommands:
  list    List login user accounts.
  login   Log in as the specified user, aka "Fast User Switching."
  logout  Log out the current user.
  window  Go to the login window without logging out.
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
    "list")
      _users_and_ids=("$(dscl . list /Users uid | grep -v '^_')")
      for _user in "${_users_and_ids[@]}"
      do
        _username="$(echo "${_user}" | awk '{print $1}')"

        # Only print users with valid home directories, which is used here as an
        # indication that the account is a valid login account. So far I've been
        # unable to find a better way to list only full login user accounts.
        _home_directory="$(
          dscl . -read "/Users/${_username}" NFSHomeDirectory | \
            awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}'
        )"
        _debug printf \
          "_accounts() \${_username}: %s\\n" \
          "${_username}"
        _debug printf \
          "_accounts() \${_home_directory}: %s\\n" \
          "${_home_directory}"

        if ! { [[ "${_username}" == "root" ]]         ||
               [[ "${_username}" == "daemon" ]]       ||
               [[ "${_home_directory}" =~ ^/var.* ]]  ||
               [[ "${_home_directory}" =~ ^/dev.* ]]  ||
               [[ "${_home_directory}" =~ ^/opt.* ]];
        }
        then
          echo "${_username}"
        fi
      done

      echo -e ''
		  show_success "Git Remote: ${PARTRIDGE_MONOREPO_HTTPS}/partridge/tree/v${_NEW_VERSION}"
      ;;
    "login")
      _user="${_ARGUMENTS[1]:-}"
      if [[ -z "${_user}" ]]
      then
        _die printf "User missing.\\n%s\\n" "$(_print_help)"
      fi

      _user_id=$(id -u "${_user}")
      if [[ -z "${_user_id}" ]]
      then
        _die printf "No user with that name found.\\n"
      fi

      if [[ "$(whoami)" == "${_user}" ]]
      then
        _die printf \
          "You are already currently logged in as '%s'.\\n" \
          "${_user}"
      fi

      _debug printf "%s\\n" "${_CGSESSION} -switchToUserID ${_user_id}"
      "${_CGSESSION}" -switchToUserID "${_user_id}"
      ;;
    "logout")
      if [[ "${_ARGUMENTS[1]:-}" == "--force" ]]
      then
        osascript -e 'tell application "loginwindow" to  «event aevtrlgo»'
      else
        osascript -e 'tell app "System Events" to log out'
      fi
      ;;
    "window")
      "${_CGSESSION}" -suspend
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