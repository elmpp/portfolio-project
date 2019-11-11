#!/usr/bin/env bash

_PACKAGEBASE=packages/partridge-schema
# shellcheck disable=SC2034
_SUBCOMMAND_PROGRAM_LIST='migrate update-migration-files migration-create schema-clear seed-load'
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
  ${_ME} migrate       Run typeorm migrations
  ${_ME} update-migration-files  Ensures dump files have all migrations applied
  ${_ME} migration-create  Based off the DB, generates a (sequelize) migration and updates the models
  ${_ME} schema-clear  Drops schema (with cascade)
  ${_ME} seed-load     Loads from seed directory
  ${_ME} -h | --help
  ${_ME} --version
Subcommands:
  migrate       Run typeorm migrations
  update-migration-files  Ensures dump files have all migrations applied
  migration-create  Based off the DB, generates a (sequelize) migration and updates the models
  schema-clear  Drops schema (with cascade)
  seed-load     Loads from seed directory
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

    "migrate")

      _run_migration

      echo -e ''
		  show_success "Ran Migration"
      ;;
    "update-migration-files")

      # pg_dump will include the schema so we shall just switch things around and always work with public
      _call_script_for_package partridge-shell db schema-drop _public || true
      _call_script_for_package partridge-shell db schema-rename public _public

      shopt -s nullglob
      for _FILENAME in "${_PACKAGEBASE}"/src/dump/*.sql; do
        [ -e "${_FILENAME}" ] || continue

        show_info "Updating schema for dump file ${_FILENAME}"

        _call_script_for_package partridge-shell db schema-drop public || true
        _call_script_for_package partridge-shell db schema-create public
        _call_script_for_package partridge-shell db dump-restore "${_FILENAME##*/}"
        _run_migration
        _call_script_for_package partridge-shell db dump-create "${_FILENAME##*/}"
      done
      shopt -u nullglob

      _call_script_for_package partridge-shell db schema-drop public || true
      _call_script_for_package partridge-shell db schema-rename _public public

      ;;
    "migration-create")

      local _APPLY_CHANGESET="${_ARGUMENTS[1]:-}"

      show_warning "migrations will include unwanted enum renames. see this issue - https://tinyurl.com/y28g24lw"

      # changes have been made to the entities. Create migration..
      # local _CMD1="(cd ${_PACKAGEBASE}; NODE_CONFIG_DIR=../partridge-config/dist/config npx ts-node node_modules/.bin/typeorm migration:generate -n Generated)"
      # debug "${_CMD1}"
      # eval "${_CMD1}"

      _run_typeorm migration:generate -n Generated

      # we want our dump files to be up to date with this migration
      _call_script changeset update-migration-files

      local _MESSAGE="Migration created"
      if [[ ! -z "${_APPLY_CHANGESET}" ]]
      then
        _run_migration
        _MESSAGE="Migration created and ran"
      fi

      show_warning "migrations will include unwanted enum renames. see this issue - https://tinyurl.com/y28g24lw"

      echo -e ''
		  show_success "${_MESSAGE}"
      ;;
    "schema-clear")

      # https://goo.gl/Dxn4Az
      # local _CMD1="(cd ${_PACKAGEBASE}; npx ts-node node_modules/.bin/typeorm schema:drop)" // does not cascade to functions etc
      _run_query "drop schema if exists public cascade"
      _run_query "create schema if not exists public"

      echo -e ''
		  show_success "Schema recreated"
      ;;
    "seed-load")

      local _FILE
      _FILE=$(_require_argument "${_ARGUMENTS[1]:-}" "Seed File")

      # local _CMD1="(cd ${_PACKAGEBASE}; npx ts-node ./src/seed/load-seed.ts '${_FILE}')"
      # debug "${_CMD1}"
      # eval "${_CMD1}"

      _run_loadseed "'${_FILE}'"

      echo -e ''
		  show_success "Seed file seed/${_FILE}"
      ;;
    "help")
      _print_help
      ;;
  esac
}

_run_typeorm() {
  local _CMD1="(cd ${_PACKAGEBASE}; NODE_CONFIG_DIR='../partridge-config/dist/config' npx ts-node node_modules/.bin/typeorm $*)"
  debug "${_CMD1}"
  eval "${_CMD1}"
}
_run_loadcode() {
  # local _CMD1="(cd ${_PACKAGEBASE}; NODE_CONFIG_DIR='../partridge-config/dist/config' npx ts-node node_modules/.bin/typeorm $@)"
  local _CMD1="(cd ${_PACKAGEBASE}; NODE_CONFIG_DIR='../partridge-config/dist/config' npx ts-node ./src/code/load-code.ts $*)"
  # local _CMD1="NODE_CONFIG_DIR='../partridge-config/dist/config' npx ts-node ./src/code/load-code.ts" $@
  debug "${_CMD1}"
  eval "${_CMD1}"
}
_run_loadseed() {
  local _CMD1="(cd ${_PACKAGEBASE}; NODE_CONFIG_DIR='../partridge-config/dist/config' npx ts-node ./src/seed/load-seed.ts $*)"
  # local _CMD1="NODE_CONFIG_DIR='../partridge-config/dist/config' npx ts-node ./src/seed/load-seed.ts" $@
  debug "${_CMD1}"
  eval "${_CMD1}"
}

_run_migration() {
  # local _CMD1="(cd ${_PACKAGEBASE}; NODE_CONFIG_DIR='../partridge-config/dist/config' npx ts-node node_modules/.bin/typeorm migration:run)"
  # debug "${_CMD1}"
  # eval "${_CMD1}"

  _run_typeorm migration:run
  _run_loadcode migration:run

  # local _CMD2="(cd ${_PACKAGEBASE}; NODE_CONFIG_DIR='../partridge-config/dist/config' npx ts-node ./src/code/load-code.ts)"
  # debug "${_CMD2}"
  # eval "${_CMD2}"
}
_run_query() {
  local _QUERY
  _QUERY=$(_require_argument "${1:-}" "Query")
  # local _CMD1="(cd ${_PACKAGEBASE}; NODE_CONFIG_DIR='../partridge-config/dist/config' npx ts-node node_modules/.bin/typeorm query '${_QUERY}')"
  # debug "${_CMD1}"
  # eval "${_CMD1}"

  _run_typeorm "query '${_QUERY}'"
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