#!/usr/bin/env bash


# _print_help()
#
# Usage: _print_help
#
# Print the program help information.
_print_help() {
	printf "%s\\n" "${_program_help}"
}

# _print_version()
#
# Usage: _print_help
#
# Print the current program version.
_print_version() {
	printf "%s\\n" "${_VERSION}"
}


###############################################################################
# Debug
###############################################################################

# _debug()
#
# Usage:
#   _debug printf "Debug info. Variable: %s\\n" "$0"
#
# A function for executing a specified command if the `$_USE_DEBUG`
# variable has been set. The command is expected to print a message and
# should typically be either `echo`, `printf`, or `cat`.
__DEBUG_COUNTER=0
_debug() {
	if [[ "${_USE_DEBUG:-"0"}" -eq 1 ]]; then
		__DEBUG_COUNTER=$((__DEBUG_COUNTER + 1))
		# Prefix debug message with "bug (U+1F41B)"
		printf "🐛  %s " "${__DEBUG_COUNTER}"
		"${@}"
		printf "――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――\\n"
	fi
}
# debug()
#
# Usage:
#   debug "Debug info. Variable: $0"
#
# Print the specified message if the `$_USE_DEBUG` variable has been set.
#
# This is a shortcut for the _debug() function that simply echos the message.
debug() {
	_debug echo "${@}"
}


###############################################################################
# Die
###############################################################################

# _die()
#
# Usage:
#   _die printf "Error message. Variable: %s\\n" "$0"
#
# A function for exiting with an error after executing the specified
# command. The command is expected to print a message and should typically
# be either `echo`, `printf`, or `cat`.
_die() {
	# Prefix die message with "cross mark (U+274C)", often displayed as a red x.
	printf "❌  "
	"${@}" 1>&2
	exit 1
}
# die()
#
# Usage:
#   die "Error message. Variable: $0"
#
# Exit with an error and print the specified message.
#
# This is a shortcut for the _die() function that simply echos the message.
die() {
	_die echo "${@}"
}