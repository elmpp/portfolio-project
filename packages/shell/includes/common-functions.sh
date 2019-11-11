#!/usr/bin/env bash
###############################################################################
# _load_config()
#
# Usage:
#   _load_config
#
# Description:
#   Switches the loaded config files based on the PARTRIDGE_APP_ENV variable, defaulting to local
#
_load_config() {
	set -a
	# shellcheck disable=SC1090
	source "packages/partridge-shell/config/$(_get_app_env).env"
	set +a
}

###############################################################################
# _load_config()
#
# Usage:
#   _load_config
#
# Description:
#   Determines the current environment name
#
_get_app_env() {
	echo "${PARTRIDGE_APP_ENV:-local}"
}

###############################################################################
# _require_argument()
#
# Usage:
#  _require_argument "$opt" "Exit message"
# e.g. _NAMESPACE=$(_require_argument "${_ARGUMENTS[1]:-}" "Namespace")
#
# Checks if an value has been set to the expected variable and, if not, prints
# and error message and exits with status 1.
_require_argument() {
	local value="${1}"
	local message="${2}"

	if [[ -z "${value}" ]]; then
		_die printf "%s argument is required\\n" "${message}"
	fi

	echo $value
}

###############################################################################
# _get_option()
#
# Usage:
#  _get_option "$opt" "Exit message"
# e.g. _OPTION_NAMESPACE=$(_get_option "--namespace")
#
# Checks the _ARGUMENTS array if an option has been supplied and has a value, if not, prints
# an error message and exits with status 1. Returns default if option not supplied
# e.g. that `--an-option aValue`
_get_option() {
	local option="${1}"
	local default_value="${2:-}"
	# shift
	# local arguments=("$@")

	arraylength=${#_ARGUMENTS[@]}

	# find the option and "return" the next value in arg is present, fail if no value supplied
	for ((i = 0; i < ${arraylength}; i++)); do
		if [ "${_ARGUMENTS[$i]}" == "${option}" ]; then
			if [[ -z "${_ARGUMENTS[$i + 1]:-}" ]]; then
				_die printf "Option %s supplied but not value given" "${option}"
			fi
			echo "${_ARGUMENTS[$i + 1]}"
			return 0
		fi
	done
	echo $default_value
}


###############################################################################
# _has_option()
#
# Usage:
#  _has_option "$opt"
# e.g. IF _has_option '--background'
#
# Checks the _ARGUMENTS array if an option has been supplied return true (0), false (1) otherwise
_has_option() {
	local option="${1}"
	_contains "${option}" "${_ARGUMENTS[@]:-}"
}

###############################################################################
# _passthru_options()
#
# Usage:
#  _passthru_options "$options_array"
# e.g. _OPTIONS_PRESENT=$(_passthru_options '--namespace --an-option')) returns '--namespace --an-option'
#
# Checks the _ARGUMENTS array for each value in supplied array. Those present will be "returned"
# as a concatenated string
#
_passthru_options() {
	local _desired_options the_ret arguments_joined

	the_ret=''
	IFS=" " read -r -a _desired_options <<<"${@:1}"
	arguments_joined=$(_join ' ' "${_ARGUMENTS[@]:-}")

	# _debug printf "\${_desired_options[*]:-}: %s\\n" "${_desired_options[*]:-}"
	# _debug printf "\${arguments_joined:-}: %s\\n" "${arguments_joined:-}"

	# debug "${_desired_options[*]:-}"

	for __desired_option in "${_desired_options[@]:-}"; do
		if _contains "${__desired_option}" "${arguments_joined}"; then
			the_ret+="${__desired_option} "
		fi
	done
	echo $the_ret
}

###############################################################################
# _current_branch()
#
# Usage:
#  _current_branch
#
_current_branch() {
	git rev-parse --abbrev-ref HEAD
}

###############################################################################
# _call_script()  - calls script inside same package
#
# Usage:
#  _call_script <script> [..args]
#
_call_script() {
	# local _SCRIPT="${1}"
	# shift
	_call_script_for_package "${_PACKAGEBASE##*/}" "$@" 
}

###############################################################################
# _call_script_for_package()  - calls script inside another package
#
# Usage:
#  _call_script <package> <script> [..args]
#
_call_script_for_package() {
	local _PACKAGE="${1}"
	local _SCRIPT="${2}"
	shift
	shift
	_SCRIPT_CMD="./packages/${_PACKAGE}/scripts/${_SCRIPT}.sh $@"
	if [[ "${_USE_DEBUG:-"0"}" -eq 1 ]]; then
		_SCRIPT_CMD="${_SCRIPT_CMD} --debug"
	fi
	debug "${_SCRIPT_CMD}"
	eval "${_SCRIPT_CMD}"
}


###############################################################################
# _lerna_package_version()
#
# Usage:
#  _lerna_package_version <package>
#
_lerna_package_version() {
	local _PACKAGE
	_PACKAGE=$(_require_argument "${1:-}" "Package")
	
	npx lerna list -la | grep "${_PACKAGE}" | awk '{print $2}' | sed 's/v//g'
}

###############################################################################
# _has_package_changed()
#
# Usage:
#  _has_package_changed <package>
#
_has_package_changed() {
	local _PACKAGE
	_PACKAGE=$(_require_argument "${1:-}" "partridge-client-frontend etc")
	_list_intersect "${_PACKAGE}" "$(npx lerna changed --json | grep '"name":' | awk '{print $2}' | sed 's/[",]//g' | tr '\n' ' ')"
}