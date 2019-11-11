#!/usr/bin/env bash

_PACKAGEBASE=packages/partridge-shell
# shellcheck disable=SC2034
_SUBCOMMAND_PROGRAM_LIST='feature-branch feature-branch-success feature-branch-failure release-branch release-branch-success release-branch-failure develop develop-success develop-failure bootstrap-monorepo'
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
*** Common macOS user account operations. *** 
*********************************************
Version: ${_VERSION}
Usage:
  ${_ME} feature-branch
  ${_ME} feature-branch-success
  ${_ME} feature-branch-failure
  ${_ME} release-branch
  ${_ME} release-branch-success
  ${_ME} release-branch-failure
  ${_ME} develop
  ${_ME} develop-success
  ${_ME} develop-failure
  ${_ME} bootstrap-monorepo
  ${_ME} -h | --help
  ${_ME} --version
Subcommands:
  feature-branch  Triggered on feature-branch commit
  feature-branch-success  Triggered on feature-branch success
  feature-branch-failure  Triggered on feature-branch failure
  release-branch  Triggered on release-branch commit
  release-branch-success  Triggered on release-branch success
  release-branch-failure  Triggered on release-branch failure
  develop  Triggered on develop commit
  develop-success  Triggered on develop success
  develop-failure  Triggered on develop failure
  bootstrap-monorepo  Lerna seems to bring in partridge package's dependencies when we want locally symlinked
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
    "feature-branch")
      _run_non_functional_tests
      _run_functional_tests
      ;;
    "feature-branch-success")
      show_info "Go to github or merge locally"
      ;;
    "feature-branch-failure")
      show_error "Build Failed"
      ;;
    "release-branch")
      _run_non_functional_tests
      _run_functional_tests
      _run_e2e_tests

      show_info "Closing release branch"
      _call_script versioning release-branch-finish
      
      show_info "Cleaning old images"
      _call_script images clean-old
      ;;
    "release-branch-success")
      show_error "Build Success."
      # @todo - clear up prerelease images on GCR
      # @todo - delete old release images on GCR
      ;;
    "release-branch-failure")
      show_error "Build Failed. Aborting release"
      _call_script versioning release-branch-abort
      ;;
    "develop")
      _run_non_functional_tests
      _run_functional_tests
      ;;
    "develop-success")
      show_info "Build success"
      ;;
    "develop-failure")
      show_info "Build failed. Fix it"
      ;;
    "bootstrap-monorepo")
      local _DEL_CMD
      for _A_PACKAGE in "${PARTRIDGE_SPLITTABLE_PACKAGES[@]}"; do
        for _A_PACKAGE2 in "${PARTRIDGE_SPLITTABLE_PACKAGES[@]}"; do
          _DEL_CMD="rm -rf packages/${_A_PACKAGE}/node_modules/${_A_PACKAGE2} || true"
          debug "${_DEL_CMD}"
          eval "${_DEL_CMD}"
        done
      done
      show_info "Deleted dependencies for local monorepo testing"
      ;;
    "help")
      _print_help
      ;;
  esac
}

_run_non_functional_tests() {
  show_info "Running lint and unit tests"
  npx yarn lint
  _call_script run-tests unit
}

_run_functional_tests() {
  show_info "Running functional tests"
  _call_script run-tests functional ci
}

_run_e2e_tests() {
  show_info "Building and pushing prerelease images, deploying to platform"
  _call_script versioning release-branch-prerelease-build ci_e2e
  
  # show_info "Running E2E tests against platform"
  # _call_script run-tests e2e ci_e2e
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