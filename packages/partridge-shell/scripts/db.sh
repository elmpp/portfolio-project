#!/usr/bin/env bash

_PACKAGEBASE=packages/partridge-shell
# shellcheck disable=SC2034
_SUBCOMMAND_PROGRAM_LIST='schema-rename schema-drop schema-create dump-create dump-create-data-only dump-restore psql-local psql-cloud-proxy'
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
*************************************************************************
*** Operations around bringing up a working instance on non-prod envs *** 
*************************************************************************
Version: ${_VERSION}
Usage:
  ${_ME} schema-rename <current_schema> <new_schema>  Rename schema
  ${_ME} schema-drop <schema>
  ${_ME} schema-create <schema>
  ${_ME} dump-create <filename>
  ${_ME} dump-create-data-only <filename>
  ${_ME} dump-restore <filename>
  ${_ME} psql-local
  ${_ME} psql-cloud-proxy
  ${_ME} -h | --help
  ${_ME} --version
Subcommands:
  schema-rename <current_schema> <new_schema>  Rename schema
  schema-drop <schema>
  schema-create <schema>
  dump-create <filename>
  dump-create-data-only <filename>
  dump-restore <filename>
  psql-local                                   Connect to docker-compose db
  psql-cloud-proxy                             Connect to Cloud Proxy
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
	"psql-local")
		local _CMD="psql ${PARTRIDGE_POSTGRES_URI}:5432/${PARTRIDGE_POSTGRES_DATABASE}"
		debug "${_CMD}"
		eval "${_CMD}"
		;;
	"psql-cloud-proxy")
		local _CMD="psql ${PARTRIDGE_POSTGRES_URI}:5433"
		debug "${_CMD}"
		eval "${_CMD}"
		;;
	"schema-rename")
		local _FROM
		local _TO
		_FROM=$(_require_argument "${_ARGUMENTS[1]:-}" "Current schema name")
		_TO=$(_require_argument "${_ARGUMENTS[2]:-}" "New schema name")

		_execute_query "alter schema ${_FROM} rename to ${_TO}"

		echo -e ''
		show_success "Renamed schema from ${_FROM} to ${_TO}"
		;;
	"schema-drop")
		local _NAME
		_NAME=$(_require_argument "${_ARGUMENTS[1]:-}" "Schema name")

		_execute_query "drop schema ${_NAME} cascade"

		echo -e ''
		show_success "Dropped schema ${_NAME}"
		;;
	"schema-create")
		local _NAME
		_NAME=$(_require_argument "${_ARGUMENTS[1]:-}" "Schema name")

		_execute_query "create schema ${_NAME}"

		echo -e ''
		show_success "Created schema ${_NAME}"
		;;
	"dump-create")
		local _NAME
		_NAME=$(_require_argument "${_ARGUMENTS[1]:-}" "Filename")

		local _QUERY="pg_dump ${PARTRIDGE_POSTGRES_URI}/${PARTRIDGE_POSTGRES_DATABASE} --inserts --column-inserts --if-exists --clean --schema=public --exclude-table=rename --exclude-table=rename_id_seq --exclude-table=_typeorm_migrations --exclude-table=_typeorm_migrations_id_seq > packages/partridge-schema/src/dump/${_NAME}"
		debug "${_QUERY}"
		eval "${_QUERY}"

		_remove_set_search_path "packages/partridge-schema/src/dump/${_NAME}"

		echo -e ''
		show_success "Created dump ${_NAME}"
		;;
	"dump-create-data-only")
		local _NAME
		_NAME=$(_require_argument "${_ARGUMENTS[1]:-}" "Filename")

		local _QUERY="pg_dump ${PARTRIDGE_POSTGRES_URI}/${PARTRIDGE_POSTGRES_DATABASE} --inserts --column-inserts --data-only --schema=public --exclude-table=rename --exclude-table=rename_id_seq --exclude-table=_typeorm_migrations --exclude-table=_typeorm_migrations_id_seq > packages/partridge-schema/src/seed/${_NAME}"
		debug "${_QUERY}"
		eval "${_QUERY}"

		_remove_set_search_path "packages/partridge-schema/src/seed/${_NAME}"

		echo -e ''
		show_success "Created data-only dump ${_NAME}"
		;;
	"dump-restore")
		local _NAME
		_NAME=$(_require_argument "${_ARGUMENTS[1]:-}" "Filename")

		local _QUERY="psql ${PARTRIDGE_POSTGRES_URI}/${PARTRIDGE_POSTGRES_DATABASE} < packages/partridge-schema/src/dump/${_NAME}"
		debug "${_QUERY}"
		eval "${_QUERY}"

		echo $?

		echo -e ''
		show_success "Restored dump ${_NAME}"
		;;
	"help")
		_print_help
		;;
	esac
}

_execute_query() {
	local _QUERY="psql ${PARTRIDGE_POSTGRES_URI}/${PARTRIDGE_POSTGRES_DATABASE} -c \"${1}\""
	debug "${_QUERY}"
	eval "${_QUERY}"
}

# pg_dump always includes (empty) search path
_remove_set_search_path() {
	local _FILE
	_FILE=$(_require_argument "${1:-}" "Filename")
	local _SEARCH_PATH_REGEX="pg_catalog.set_config(.search_path"
	local _CMD="sed -i '' -e '/${_SEARCH_PATH_REGEX}/ s/^#*/-- /' ${_FILE}"

	debug "${_CMD}"
	eval "${_CMD}"
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
	if [[ "${_PRINT_HELP:-0}" == '1' ]]; then
		_print_help
	elif [[ "${_PRINT_VERSION:-0}" == '1' ]]; then
		_print_version
	else
		_do_main "$@"
	fi
}

# Call `_main` after everything has been defined.
_main "$@"
