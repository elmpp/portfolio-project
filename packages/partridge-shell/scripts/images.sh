#!/usr/bin/env bash

_PACKAGEBASE=packages/partridge-shell
# shellcheck disable=SC2034
_SUBCOMMAND_PROGRAM_LIST='build extract-for-build list clean-old'
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
  ${_ME} build   <package>
  ${_ME} extract-for-build <package>
  ${_ME} list
  ${_ME} clean-old
  ${_ME} -h | --help
  ${_ME} --version
Subcommands:
  build       Creates a package artifact. Depends on result of "extract-for-build" whether "docker" builds or just tags
  extract-for-build   Consults "lerna changed" and if changed, will extract and production install the package from the monorepo
  list        Shows all images and their revisions in gcr
	clean-old   Ensures we don't have loads of old containers
Options:
  -h --help  Display this help information.
  --version  Display version information.
  --force    Suppress confirmation prompt.
EOM


###############################################################################
# Program Functions
###############################################################################

DEFAULT_DOCKER_TAG=latest

_do_main() {
	_debug printf "_do_main() >> start\\n"

	case "${_SUBCOMMAND}" in
	"build")
		local _PACKAGE
		_PACKAGE=$(_require_argument "${_ARGUMENTS[1]:-}" "Package")
		_TAG_AS_LATEST=$(_require_argument "${_ARGUMENTS[2]:-0}" "Tag as latest")
		
		_build_image_or_retag "${_PACKAGE}" "${_TAG_AS_LATEST}"
		;;
	"extract-for-build")
		local _PACKAGE
		_PACKAGE=$(_require_argument "${_ARGUMENTS[1]:-}" "Package")
		local _FORCE
		_FORCE=$(_require_argument "${_ARGUMENTS[2]:-0}" "Force package building (@see lerna-and-packages.md)")

		local _VERSION
		_VERSION=$(_lerna_package_version "${_PACKAGE}")

		_extract_package_if_changed "${_PACKAGE}" "${_FORCE}"
		;;
	"list")
		local _IMAGES
		local _CMD
		_IMAGES=$(gcloud container images list --repository=eu.gcr.io/partridge-alan | grep -v 'NAME')
		for _A_IMAGE in $_IMAGES; do
			local _TRIMMED_IMAGE
			# shellcheck disable=SC2001
			_TRIMMED_IMAGE=$(echo "${_A_IMAGE}" | sed 's/\[@\]//g')

			[ -z "${_TRIMMED_IMAGE}" ] && continue
			[[ $_TRIMMED_IMAGE =~ '@' ]] && continue
			
			show_info "--- IMAGE: ${_TRIMMED_IMAGE} ---"

			local _CMD
			_CMD="gcloud container images list-tags ${_TRIMMED_IMAGE} --limit=999999 --sort-by=TIMESTAMP --filter='timestamp.datetime < $(date +%Y-%m-%d)'"
			debug "${_CMD}"
			eval "${_CMD}"

			echo -e ''
			echo -e ''
		done
		;;
	"clean-old")
		local _IMAGES
		local _CMD
		local _LATEST_TAG
		_LATEST_TAG=$(_require_argument "${_ARGUMENTS[1]:-}" "Latest tag (to not delete)")

		echo -e ''
		show_warning "**************************************************************"
		show_warning "      PLEASE RUN COMMAND TWICE TO CLEAR ORPHANED IMAGES"
		show_warning "**************************************************************"
		echo -e ''

		_IMAGES=$(gcloud container images list --repository=eu.gcr.io/partridge-alan | grep -v 'NAME')
		for _A_IMAGE in $_IMAGES; do
			local _TRIMMED_IMAGE
			# shellcheck disable=SC2001
			_TRIMMED_IMAGE=$(echo "${_A_IMAGE}" | sed 's/\[@\]//g')

			[ -z "${_TRIMMED_IMAGE}" ] && continue
			[[ $_TRIMMED_IMAGE =~ '@' ]] && continue
			
			echo -e ''
			show_info "--- IMAGE: ${_TRIMMED_IMAGE} ---"
			echo -e ''

			local _DATE
			_DATE=$(date +%Y-%m-%d)
			local _REVISIONS_CMD="gcloud container images list-tags ${_TRIMMED_IMAGE} --limit=999999 --sort-by=TIMESTAMP --filter=\"timestamp.datetime < ${_DATE}\" || echo 'DIGEST' | grep -v DIGEST"
			local _REVISIONS
			
			debug "${_REVISIONS_CMD}"
			_REVISIONS=$(eval "${_REVISIONS_CMD}")

			for _A_LINE in $_REVISIONS; do
				local _TRIMMED_REVISION
				# shellcheck disable=SC2001
				_TRIMMED_REVISION=$(echo "${_A_LINE}" | sed 's/\[@\]//g')

				[ -z "${_TRIMMED_REVISION}" ] && continue
				[[ $_TRIMMED_REVISION =~ '@' ]] && continue

				local _DIGEST
				local _TAG
				local _DATE
				local _SPLITTED_TAGS
				# local _PREPPED
				# _PREPPED=$(echo "${_TRIMMED_REVISION}" | sed 's/ \{3,\}/  deleteable  /g')
				_DIGEST=$(echo "${_TRIMMED_REVISION}" | awk '{print $1}')
				_TAG=$(echo "${_TRIMMED_REVISION}" | awk '{print $2}')
				_DATE=$(echo "${_TRIMMED_REVISION}" | awk '{print $3}')
				# echo -e "${_A_A}"

				# shellcheck disable=SC1060 disable=SC1073
				IFS=',' read -ra _SPLITTED_TAGS <<< "${_TAG}"
				for _SPLITTED_TAG in "${_SPLITTED_TAGS[@]}"; do
					
					
					if [ -z "${_DATE}" ]; then
						_TAG="${_DATE}"
					fi

					if [ "${_TAG}" == "TAGS" ]; then
						continue
					fi

					if [ -z "${_TAG}" ]; then
						_delete_image "${_TRIMMED_IMAGE}" "${_DIGEST}"
						continue
					fi
					if [ "${_SPLITTED_TAG}" == "${_LATEST_TAG}" ]; then
						echo -e ''
						show_info "keeping ${_LATEST_TAG}"
						continue
					fi
					if [[ "${_TAG}" =~ 'prerelease' ]]; then
						_delete_image "${_TRIMMED_IMAGE}" "${_DIGEST}" "${_SPLITTED_TAG}"
						continue
					fi
					if [[ "${_SPLITTED_TAG}" == 'latest' ]]; then
						echo -e ''
						show_info "keeping latest"
						continue
					fi
					
					_delete_image "${_TRIMMED_IMAGE}" "${_DIGEST}" "${_SPLITTED_TAG}"
				done


				# @todo - trim images based on how old the versions are...
				# echo -e "Keeping proper version: ${_TAG}"
			done
			
		done
		
		echo -e ''
		show_warning "**************************************************************"
		show_warning "      PLEASE RUN COMMAND TWICE TO CLEAR ORPHANED IMAGES"
		show_warning "**************************************************************"
		echo -e ''

		echo -e ''
		show_info "CLEANED UP IMAGES"
		;;
	"help")
		_print_help
		;;
	esac
}

# Consults `lerna changed` for package and if changed (or previously unbuilt)
# will extract package to another directory, ready for docker building
# This is a separate step as will be invoked via a Cloud Build step that doesn't have docker
_extract_package_if_changed() {
	local _PACKAGE
	_PACKAGE=$(_require_argument "${1}" "Package name (partridge-client-frontend etc)")
	local _FORCE_BUILD
	_FORCE_BUILD=$(_require_argument "${2}" "Force a rebuild regardless of 'lerna changed' status")

	local _HAS_PACKAGE_CHANGED
	_HAS_PACKAGE_CHANGED=$(_has_package_changed "${_PACKAGE}")

	local _EXTRACT_DIR
	_EXTRACT_DIR=$(echo "_BUILD_${_PACKAGE}" | tr '-' '_' | awk '{print toupper($0)}')
	local _VERSION_FILE
	_VERSION_FILE=$(echo "_BUILD_${_PACKAGE}_VERSION.txt" | tr '-' '_' | awk '{print toupper($0)}')

	local _VERSION_FILE_CMD
	# shellcheck disable=SC2086
	_VERSION_FILE_CMD="echo '$(_lerna_package_version ${_PACKAGE})' > ${_VERSION_FILE}"
	debug "${_VERSION_FILE_CMD}"
	eval "${_VERSION_FILE_CMD}"

	if [ -n "${_HAS_PACKAGE_CHANGED}" ] || [[ "$_FORCE_BUILD" -ne 0 ]]; then
		# extract and install --
		# we want the Dockerfile to purely have to copy a source directory only. Therefore, extract and production install..
		local _EXTRACT_AND_INSTALL_CMD="cp -R packages/${_PACKAGE}/ ./${_EXTRACT_DIR} && cd ./${_EXTRACT_DIR} && npx yarn install --production && npx yarn build || true"

		debug "${_EXTRACT_AND_INSTALL_CMD}"
		eval "${_EXTRACT_AND_INSTALL_CMD}"

		show_info "Package ${_PACKAGE} changed or forced. Extracted for subsequent containerising"
	fi
}

# responsible for invoking docker to build package into artifact. Depends if package has been extracted already
# should increment the docker tag if extracted or not
_build_image_or_retag() {
	local _PACKAGE
	_PACKAGE=$(_require_argument "${1}" "Package name (partridge-client-frontend etc)")
	local _TAG
	_ADD_LATEST_TAG="${2:-}"

	local _VERSION_FILE
	_VERSION_FILE=$(echo "_BUILD_${_PACKAGE}_VERSION.TXT" | tr '-' '_' | awk '{print toupper($0)}')
	local _EXTRACT_DIR
	_EXTRACT_DIR=$(echo "_BUILD_${_PACKAGE}" | tr '-' '_' | awk '{print toupper($0)}')
	local _TAG
	_TAG=$(cat "${_VERSION_FILE}")

	if ! [ -d "${_EXTRACT_DIR}" ]; then
		# we still need to increment the current artifact to the tag --
		# can just bump 'latest' because it'll have been the last non-prerelease artifact as these don't have 'latest'
		local _CMD="docker pull ${PARTRIDGE_DOCKER_REGISTRY}/${_PACKAGE}:latest && \
			docker tag \
			${PARTRIDGE_DOCKER_REGISTRY}/${_PACKAGE}:latest \
			${PARTRIDGE_DOCKER_REGISTRY}/${_PACKAGE}:${_TAG} \
			"
	else
		# build and tag --

		local _CMD="docker build \
			--no-cache \
			-f packages/containers/docker-images/Dockerfile.${_PACKAGE} \
			-t ${PARTRIDGE_DOCKER_REGISTRY}/${_PACKAGE}:${_TAG} \
			. \
			--build-arg REGISTRY=${PARTRIDGE_DOCKER_REGISTRY} --build-arg TAG=v${_TAG} \
			"
		
		if [[ "${_ADD_LATEST_TAG}" -ne 0 ]]; then
			_CMD="${_CMD} -t ${PARTRIDGE_DOCKER_REGISTRY}/${_PACKAGE}:${DEFAULT_DOCKER_TAG}"
		fi
	fi


	debug "${_CMD}"
	eval "${_CMD}"
}

_delete_image() {
	_IMAGE=$(_require_argument "${1}" "image")
	_DIGEST=$(_require_argument "${2}" "digest")
	_TAG="${3:-}"

	if [ -z "${_TAG}" ]; then
		local _DEL_CMD="gcloud container images delete --quiet --force-delete-tags ${_IMAGE}@sha256:${_DIGEST}"
	else
		local _DEL_CMD="gcloud container images untag --quiet ${_IMAGE}:${_TAG}"
	fi
	
	debug "${_DEL_CMD}"
	eval "${_DEL_CMD}"

	echo -e ''
	echo -e "Deleted image with image/tag/digest: ${_IMAGE} / ${_TAG} / ${_DIGEST}"
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
