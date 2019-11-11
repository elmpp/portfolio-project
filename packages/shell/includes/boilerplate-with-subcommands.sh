#!/usr/bin/env bash


###############################################################################
# Options
###############################################################################

# Steps:
#
# 1. set expected short options in `optstring` at beginning of the "Normalize
#    Options" section,
# 2. parse options in while loop in the "Parse Options" section.

# Normalize Options ###########################################################

# Source:
#   https://github.com/e36freak/templates/blob/master/options

# The first loop, even though it uses 'optstring', will NOT check if an
# option that takes a required argument has the argument provided. That must
# be done within the second loop and case statement, yourself. Its purpose
# is solely to determine that -oARG is split into -o ARG, and not -o -A -R -G.

# Set short options -----------------------------------------------------------

# option string, for short options.
#
# Very much like getopts, expected short options should be appended to the
# string here. Any option followed by a ':' takes a required argument.
#
# In this example, `-x` and `-h` are regular short options, while `o` is
# assumed to have an argument and will be split if joined with the string,
# meaning `-oARG` would be split to `-o ARG`.
optstring=h

# Normalize -------------------------------------------------------------------

# iterate over options, breaking -ab into -a -b and --foo=bar into --foo bar
# also turns -- into --endopts to avoid issues with things like '-o-', the '-'
# should not indicate the end of options, but be an invalid option (or the
# argument to the option, such as wget -qO-)
unset options
# while the number of arguments is greater than 0
while ((${#})); do
	case ${1} in
	# if option is of type -ab
	-[!-]?*)
		# loop over each character starting with the second
		for ((i = 1; i < ${#1}; i++)); do
			# extract 1 character from position 'i'
			c=${1:i:1}
			# add current char to options
			options+=("-${c}")

			# if option takes a required argument, and it's not the last char
			# make the rest of the string its argument
			if [[ ${optstring} == *"${c}:"* && ${1:i+1} ]]; then
				options+=("${1:i+1}")
				break
			fi
		done
		;;
	# if option is of type --foo=bar, split on first '='
	--?*=*)
		options+=("${1%%=*}" "${1#*=}")
		;;
	# end of options, stop breaking them up
	--)
		options+=(--endopts)
		shift
		options+=("${@}")
		break
		;;
	# otherwise, nothing special
	*)
		options+=("${1}")
		;;
	esac

	shift
done
# set new positional parameters to altered options. Set default to blank.
set -- "${options[@]:-}"
unset options

# Parse Options ###############################################################

# Initialize program option variables.
_PRINT_HELP=0
_PRINT_VERSION=0
_USE_DEBUG=0
_SUBCOMMAND=
_ARGUMENTS=("${0}")

# getopts and getopts have inconsistent behavior, so using a home-brewed
# while loop. This isn't perfectly compliant with POSIX, but it's close enough
# and this appears to be a widely used approach.
#
# More info:
#   http://www.gnu.org/software/libc/manual/html_node/Argument-Syntax.html
#   http://stackoverflow.com/a/14203146
#   http://stackoverflow.com/a/7948533
# "$#" == count of arguments in bash shell
while [ ${#} -gt 0 ]; do
	opt="${1}"
	shift
	
	if _contains "${opt}" "${_SUBCOMMAND_PROGRAM_LIST}"
	then
    # conditionals reference: https://goo.gl/RHAM
		if [[ -z "${_SUBCOMMAND}" ]]; then
			_SUBCOMMAND="${opt}"
			continue
		else
			_ARGUMENTS+=("${opt}")
			continue
		fi
	fi

	case "${opt}" in
	-h | --help)
		_PRINT_HELP=1
		;;
	--version)
		_PRINT_VERSION=1
		;;
	--debug)
		_USE_DEBUG=1
		;;
	--endopts)
		# Terminate option parsing.
		break
		;;
	*)
		_ARGUMENTS+=("${opt}")
		;;
	esac
done

if [[ -z "${_SUBCOMMAND}" ]]; then
	_SUBCOMMAND="help"
fi

_debug printf "\${_SUBCOMMAND}: %s\\n" "${_SUBCOMMAND}"
_debug printf "\${_ARGUMENTS[*]:-}: %s\\n" "${_ARGUMENTS[*]:-}"