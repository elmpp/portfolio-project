#!/usr/bin/env bash

_PACKAGEBASE=packages/partridge-shell
# shellcheck disable=SC2034
_SUBCOMMAND_PROGRAM_LIST=''
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
*** Release and version stuff. *** 
*********************************************
Version: ${_VERSION}
Usage:
  ${_ME} subtree-sync
  ${_ME} subtree-sync-all
  ${_ME} feature-branch-start [feature_name]
  ${_ME} feature-branch-finish
  ${_ME} feature-branch-abort [feature_name]
  ${_ME} release-branch-start --bump-type [patch/minor/major] (default is minor)
  ${_ME} release-branch-finish --bump-type [patch/minor/major] (default is minor)
  ${_ME} release-branch-prerelease-build
  ${_ME} release-branch-abort <version>
  ${_ME} release-branch-abort-local <version>
  ${_ME} build-and-commit
  ${_ME} changelog --release-count
  ${_ME} -h | --help
  ${_ME} --version
Subcommands:
  subtree-sync    Runs git subtree splitting of packages to separate (read-only) repositories
  subtree-sync-all    Runs git subtree splitting for all tags of current local monorepo. Pushes tags as they're found
  feature-branch-start  Pretty much only branches off of develop
  feature-branch-finish  Pretty much only merges back to develop and pushes
	feature-branch-abort  Deletes local and remote branches for given feature
  release-branch-start  Creates the correct release branch using the correct semver number
  release-branch-prerelease-build  Creates the prerelease, builds images. Essentially, readies a canary test
  release-branch-finish  Performs the merge into master, cleans up etc etc
	release-branch-abort  Deletes local and remote branches for given release (should only be run when merge didn't complete)
	release-branch-abort-local  Deletes local branches for given release
  build-and-commit     Runs yarn build and does a force commit
	changelog  Runs conventional-changelog to populate CHANGELOG.md between releases. Set --release-count=0 to regenerate all releases. See here - https://goo.gl/zJ6pFD
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
	_PREID_PRERELEASE='prerelease'

	case "${_SUBCOMMAND}" in
	"subtree-sync") 
    _subtree_sync "${_ARGUMENTS[1]:-}"
    ;;
	"subtree-sync-all")
		local _ALL_TAGS
		_ALL_TAGS=$(git tag)
		for _A_LOCAL_TAG in $_ALL_TAGS;
		do
			# shellcheck disable=SC2001
    	_subtree_sync "$(echo "${_A_LOCAL_TAG}" | sed 's/^v//g')"
		done
    ;;
	"feature-branch-start")
		local _FEATURE_NAME
		_FEATURE_NAME=$(_require_argument "${_ARGUMENTS[1]:-}" "Feature name")

		if ! [ "$(_current_branch)" == 'develop' ]; then
			_die printf "Only feature branch from develop branch"
		fi


		local _GIT_FLOW_CMD="git-flow feature start ${_FEATURE_NAME} && git-flow feature publish ${_FEATURE_NAME}"
		debug "${_GIT_FLOW_CMD}"
		eval "${_GIT_FLOW_CMD}"
    ;;
	"feature-branch-finish")
		local _FEATURE_NAME
		_FEATURE_NAME=$(_release_feature_branch_version)

		local _GIT_FLOW_CMD="git-flow feature finish ${_FEATURE_NAME} && git push origin develop"
		debug "${_GIT_FLOW_CMD}"
		eval "${_GIT_FLOW_CMD}"
    ;;
	"feature-branch-abort")
		local _CURRENT_BRANCH_VERSION
		_CURRENT_BRANCH_VERSION=$(_release_feature_branch_version)
		local _VERSION
		_VERSION=$(_require_argument "${_ARGUMENTS[1]:-$_CURRENT_BRANCH_VERSION}" "Feature name")
		git checkout develop

		local _BRANCH_DELETE_CMD="git branch -D feature/${_VERSION} || true"
		debug "${_BRANCH_DELETE_CMD}"
		eval "${_BRANCH_DELETE_CMD}"
		git push --delete origin "feature/${_VERSION}" || true

    echo -e ''
		show_success "Deleted local and remote branches for 'feature/${_VERSION}'"
		;;
  "release-branch-start")
		local _BUMP_TYPE
		local _NEW_VERSION_CMD
		local _NEW_VERSION

		if ! [ "$(_current_branch)" == 'develop' ]; then
			_die printf "Only release from develop branch"
		fi

		_pre_release_build
		
		# _subtree_sync
		_BUMP_TYPE=$(_get_option "--bump-type" "minor")

		# using a command in the /commands directory. See here - https://goo.gl/k2a2kK
		local _CURRENT_LERNA_VERSION
		_CURRENT_LERNA_VERSION=$(_current_lerna_version)
		_NEW_VERSION_CMD="increment_semver.sh ${_BUMP_TYPE} ${_CURRENT_LERNA_VERSION}"
		debug "${_NEW_VERSION_CMD}"
		_NEW_VERSION=$(eval "${_NEW_VERSION_CMD}")
		debug "New derived semver full-release version: ${_NEW_VERSION}"
		if [[ -z "${_NEW_VERSION}" ]]; then
			_die printf "Could not calculate new increment %s version for %s\\n" "${_BUMP_TYPE}" "${_CURRENT_LERNA_VERSION}"
		fi

		local _GIT_FLOW_CMD="git-flow release start ${_NEW_VERSION}"

		debug "${_GIT_FLOW_CMD}"
		eval "${_GIT_FLOW_CMD}"
		
		# https://goo.gl/V2d4fg
		local _GIT_BRANCH_PUSH_CMD="git-flow release publish ${_NEW_VERSION}"
		debug "${_GIT_BRANCH_PUSH_CMD}"
		eval "${_GIT_BRANCH_PUSH_CMD}"

		git checkout develop; git branch
		_clean_release_local "${_NEW_VERSION}"

    echo -e ''
		show_success "Github Branch: ${PARTRIDGE_MONOREPO_HTTPS}/partridge/tree/release/${_NEW_VERSION}"
		;;
  "release-branch-prerelease-build")
		
		# we shall use the version denoted in the branch name so as to allow releases to be created
		# outside of CI context
		local _NEW_VERSION
		_NEW_VERSION=$(_release_feature_branch_version)
		local _BUMP_TYPE
		_BUMP_TYPE=$(_get_option "--bump-type" "minor")

		# this is the point in which we have a reliable `lerna changed` - we should build images etc at this point
		_CHANGED_BUILDABLE_PACKAGES=$(_changed_buildable_packages)
		_UNCHANGED_BUILDABLE_PACKAGES=$(_unchanged_buildable_packages)

		echo -e 'The following buildable packages were found to have changed:'
		echo -e "${_CHANGED_BUILDABLE_PACKAGES}"
		echo -e 'The following buildable packages were found to have not changed:'
		echo -e "${_UNCHANGED_BUILDABLE_PACKAGES}"

		git remote -v

		# # we want to do a lerna "pre-release" - https://goo.gl/XHgD5H
		local _LERNA_PRERELEASE_CMD="npx lerna version pre${_BUMP_TYPE} --git-tag-version --preid=${_PREID_PRERELEASE} --push --yes -m \"%s [skip ci]\" || true"
		debug "${_LERNA_PRERELEASE_CMD}"
		eval "${_LERNA_PRERELEASE_CMD}"

		_subtree_sync "${_NEW_VERSION}"

		local _BUILDABLE_PACKAGE_VERSION
		# we need to push the tags for all splittable packages to their repos
		for _BUILDABLE_PACKAGE in "${PARTRIDGE_SPLITTABLE_PACKAGES[@]}";
		do
			[ -z "${_BUILDABLE_PACKAGE}" ] && continue
			echo -e "doing1: |${_BUILDABLE_PACKAGE}|"
			local _BUILDABLE_PACKAGE_VERSION
			_BUILDABLE_PACKAGE_VERSION=$(_lerna_package_version "${_BUILDABLE_PACKAGE}")

			show_info "Promoting ${_BUILDABLE_PACKAGE} to version ${_BUILDABLE_PACKAGE_VERSION}"

			# the subtree_sync won't have created our prerelease tag. Do so here
			_tag_tip_of_remote_branch "${_BUILDABLE_PACKAGE}" "$(_current_branch)" "${_BUILDABLE_PACKAGE_VERSION}"
		done

		# We can now build some artifacts from this prerelease branch (done in separate explicit Cloud Build steps)

		echo -e ''
		show_success "Pre-release completed with version '${_BUILDABLE_PACKAGE_VERSION}'"
		;;
	"release-branch-finish")
		# we shall use the version denoted in the branch name so as to allow releases to be created
		# outside of CI context
		local _NEW_VERSION
		_NEW_VERSION=$(_release_feature_branch_version)

		# at this point, depending if we're employing canary testing (i.e. doing a "prerelease")
		# the branch will either be at e.g.:
		#  - 1.0.1-rerelease.0
		#  - 1.0.1

		# we need to add an empty commit to trick lerna into graduating from prerelease - https://goo.gl/b9iABC
		# git commit --allow-empty -m "Empty commit for lerna - https://goo.gl/b9iABC [skip ci]" && git push

		npx lerna changed || true
		git branch -a

		# we can therefore do a proper `lerna version` that will "graduate" it to next full release tag
		# force publish required as it'll not graduate a prerelease version if there's been no
		# further changes in the meantime - https://goo.gl/JDky5n
		
		local _LERNA_PRERELEASE_CMD="npx lerna version ${_NEW_VERSION} --force-publish=\\* --no-git-tag-version --push --yes"
		debug "${_LERNA_PRERELEASE_CMD}"
		eval "${_LERNA_PRERELEASE_CMD}"

		# we've told lerna not to tag
		git add . && git commit -m "v${_NEW_VERSION} [skip ci]" && git push

		# notice how we're allowing lerna to create our tags (semantic format e.g. v1.0.0) and just have git-flow push them
		# - https://goo.gl/yPpue9
		
		local _GIT_FLOW_SETUP_CMD="git checkout master && git-flow init --defaults; git checkout -"
		debug "${_GIT_FLOW_SETUP_CMD}"
		eval "${_GIT_FLOW_SETUP_CMD}"
		git branch -a
		local _GIT_FLOW_CMD="export GIT_MERGE_AUTOEDIT=no; git-flow release finish ${_NEW_VERSION} --nobackmerge --pushproduction --showcommands --notag -m 'releasing version ${_NEW_VERSION}'; unset GIT_MERGE_AUTOEDIT"
		debug "${_GIT_FLOW_CMD}"
		eval "${_GIT_FLOW_CMD}"

		# we'll manually add the release tag on the current commit which should be the merge back onto develop 
		# from release/xxx. This is to keep develop HEAD point of release tagging for correct `lerna changed`
		local _MANUAL_FULL_RELEASE_TAG_CMD="git pull && git tag -a v${_NEW_VERSION} -m 'Release tag ${_NEW_VERSION}'"
		debug "${_MANUAL_FULL_RELEASE_TAG_CMD}"
		eval "${_MANUAL_FULL_RELEASE_TAG_CMD}"
		git push --follow-tags

		git checkout master
		# subtree to for master but tag also
    _subtree_sync "${_NEW_VERSION}"
    git checkout develop
		# shellcheck disable=SC2119
    _subtree_sync

		# We can now build some artifacts from this released master branch (done in separate explicit Cloud Build steps)

    echo -e ''
		show_success "Git Remote: ${PARTRIDGE_MONOREPO_HTTPS}/partridge/tree/v${_NEW_VERSION}"
		;;
	"release-branch-abort")
		local _CURRENT_BRANCH_VERSION
		_CURRENT_BRANCH_VERSION=$(_release_feature_branch_version)
		local _VERSION
		_VERSION=$(_require_argument "${_ARGUMENTS[1]:-$_CURRENT_BRANCH_VERSION}" "Version")
		git checkout master
		git reset origin/master --hard
		git checkout develop
		# git reset origin/develop --hard

		_clean_release "${_VERSION}"

    echo -e ''
		show_success "Deleted local and remote branches/tags for 'release/${_VERSION}'"
		;;
	"release-branch-abort-local")
		local _CURRENT_BRANCH_VERSION
		_CURRENT_BRANCH_VERSION=$(_release_feature_branch_version)
		local _VERSION
		_VERSION=$(_require_argument "${_ARGUMENTS[1]:-$_CURRENT_BRANCH_VERSION}" "Version")
		git checkout master
		git reset origin/master --hard
		git checkout develop
		# git reset origin/develop --hard

		_clean_release_local "${_VERSION}"

    echo -e ''
		show_success "Deleted local and remote branches/tags for 'release/${_VERSION}'"
		;;
	"build-and-commit")
		local _CMD="yarn build && git add . && git commit -m 'chore: build packages [skip ci]' || true && git push || true"
		debug "${_CMD}"
		eval "${_CMD}"
		;;
	"changelog")
		_changelog "$@"
		;;
	"help")
		_print_help
		;;
	esac
}

# shellcheck disable=SC2120
_subtree_sync() {
	local _TAG_FOR_ALL_MANYREPOS="${1:-}"
	local _SPLITSH_PATH
	
	if [[ -z "${CONTINUOUS_INTEGRATION:-}" ]]; then
		local _SPLITSH_PATH="./${_PACKAGEBASE}/bin/splitsh-lite.osx"
	else
		local _SPLITSH_PATH="./${_PACKAGEBASE}/bin/splitsh-lite.linux"
	fi

	for _A_PACKAGE in "${PARTRIDGE_SPLITTABLE_PACKAGES[@]}"; do
		# wrapper around this git facility - https://goo.gl/TVuMrx
		_REPO="${PARTRIDGE_MANYREPO_GIT}/${_A_PACKAGE}.git"
		_SPLITSH_CMD="${_SPLITSH_PATH} --prefix='packages/${_A_PACKAGE}' --progress"
		debug "$_SPLITSH_CMD"
		_SHA1=$(eval "$_SPLITSH_CMD")

		# push to refs/$BRANCH so that it will create if non-existent - https://goo.gl/rZeVh7 / https://goo.gl/X2Sh43
		_PUSH_CMD="git push -f ${_REPO} ${_SHA1}:refs/heads/$(_current_branch)"

		debug "${_PUSH_CMD}"
		eval "${_PUSH_CMD}"
		
		# allow passing in of a tag that should be committed
		if [ ! -z "${_TAG_FOR_ALL_MANYREPOS}" ]; then
			show_info "pushing tags for branch"
			_tag_tip_of_remote_branch "${_A_PACKAGE}" "$(_current_branch)" "${_TAG_FOR_ALL_MANYREPOS}"
		fi

    echo -e ''
		show_success "Subtree synced for branch $(_current_branch). "
		show_success "Git Remote: ${PARTRIDGE_MONOREPO_HTTPS}/${_A_PACKAGE}/tree/$(_current_branch)"
    echo -e ''
	done
}

# allows direct tagging of a remote branch to a version
_tag_tip_of_remote_branch() {
	local _PACKAGE
	_PACKAGE=$(_require_argument "${1:-}" "Package")
	local _BRANCH
	_BRANCH=$(_require_argument "${2:-}" "Branch")
	local _TAG
	_TAG=$(_require_argument "${3:-}" "Tag")
	_REPO="${PARTRIDGE_MANYREPO_GIT}/${_PACKAGE}.git"
	local _REMOTE_BRANCH_SHA1
	_REMOTE_BRANCH_SHA1=$(git ls-remote "${_REPO}" "refs/heads/${_BRANCH}" | awk '{print $1}')
	local _PUSH_TAG_CMD="git push ${_REPO} ${_REMOTE_BRANCH_SHA1}:refs/tags/v${_TAG} || true"
	debug "${_PUSH_TAG_CMD}"
	eval "${_PUSH_TAG_CMD}"
}

_last_tag() {
	git tag --sort=v:refname | tail -n2 | head -n1 | sed 's/^v//g' | sed 's/-prerelease\..//g'
}
_current_tag() {
	git tag --sort=v:refname | tail -n1 | sed 's/^v//g' | sed 's/-prerelease\..//g'
}

_changed_buildable_packages() {
	_list_intersect "${PARTRIDGE_BUILDABLE_PACKAGES}" "$(npx lerna changed --json | grep '"name":' | awk '{print $2}' | sed 's/[",]//g' | tr '\n' ' ')"
}
_unchanged_buildable_packages() {
	unalias grep || true
	_list_diff "${PARTRIDGE_BUILDABLE_PACKAGES}" "$(npx lerna changed --json | grep '"name":' | awk '{print $2}' | sed 's/[",]//g' | tr '\n' ' ')" | grep -vE '^$' || true
}

_current_lerna_version() {
	# relies on us having fixed version mode - https://goo.gl/dGkaZA
	# must be a unique greppable package name!!
	_lerna_package_version partridge-shell
}

_release_feature_branch_version() {
	# simply reads the release/XXX_BRANCH_VERSION
	local _BRANCH
	_BRANCH=$(_current_branch)
	echo "${_BRANCH##*/}"
}

_pre_release_build() {
	show_info "Running prerelease build before release branching"
	yarn run prerelease-build
	# shellcheck disable=SC2015
	git add . && git commit -m 'chore: prerelease build' || true
	# git push || true
}

# removes local & remote branches and prerelease tags
# Can optionally remove full release tags also (only run if a release branch was not merged into master)
_clean_release() {
	local _VERSION="${1}"

	_clean_release_local "${_VERSION}"

	# prerelease tags
	local _REMOTE_PRERELEASE_TAG_DELETE_CMD
	_REMOTE_PRERELEASE_TAG_DELETE_CMD="git ls-remote --tags origin "v${_VERSION}-${_PREID_PRERELEASE}.\*" | awk '{print \$2}' | grep -v '.*{}$' | xargs git push -d origin || true"
	debug "${_REMOTE_PRERELEASE_TAG_DELETE_CMD}"
	eval "${_REMOTE_PRERELEASE_TAG_DELETE_CMD}"

	# prerelease manyrepo tags
	local _MANYREPO_REPO
	local _REMOTE_MANYREPO_PRERELEASE_TAG_DELETE_CMD
	local _REMOTE_BRANCH_DELETE_CMD
	for _A_PACKAGE in "${PARTRIDGE_SPLITTABLE_PACKAGES[@]}"; do
		_MANYREPO_REPO="${PARTRIDGE_MANYREPO_GIT}/${_A_PACKAGE}.git"
		_REMOTE_MANYREPO_PRERELEASE_TAG_DELETE_CMD="git ls-remote --tags ${_MANYREPO_REPO} "v${_VERSION}-${_PREID_PRERELEASE}.\*" | awk '{print \$2}' | grep -v '.*{}$' | xargs git push -d ${_MANYREPO_REPO} || true"
		debug "${_REMOTE_MANYREPO_PRERELEASE_TAG_DELETE_CMD}"
		eval "${_REMOTE_MANYREPO_PRERELEASE_TAG_DELETE_CMD}"
	
		# branches
		_REMOTE_BRANCH_DELETE_CMD="git push --delete ${_MANYREPO_REPO} release/v${_VERSION} || true"
		debug "${_REMOTE_BRANCH_DELETE_CMD}"
		eval "${_REMOTE_BRANCH_DELETE_CMD}"
		_REMOTE_BRANCH_DELETE_CMD="git push --delete ${_MANYREPO_REPO} release/${_VERSION} || true"
		debug "${_REMOTE_BRANCH_DELETE_CMD}"
		eval "${_REMOTE_BRANCH_DELETE_CMD}"
	done

	# release tags
	local _REMOTE_RELEASE_TAG_DELETE_CMD
	_REMOTE_RELEASE_TAG_DELETE_CMD="git ls-remote --tags origin "v${_VERSION}" | awk '{print \$2}' | grep -v '.*{}$' | xargs git push -d origin || true"
	debug "${_REMOTE_RELEASE_TAG_DELETE_CMD}"
	eval "${_REMOTE_RELEASE_TAG_DELETE_CMD}"

	# branches
	local _BRANCH_DELETE_CMD
	_BRANCH_DELETE_CMD="git push --delete origin release/${_VERSION} || true"
	debug "${_BRANCH_DELETE_CMD}"
	eval "${_BRANCH_DELETE_CMD}"
	_BRANCH_DELETE_CMD="git push --delete origin release/v${_VERSION} || true"
	debug "${_BRANCH_DELETE_CMD}"
	eval "${_BRANCH_DELETE_CMD}"
}

# removes remote branches
_clean_release_local() {
	local _VERSION="${1}"

	# prerelease tags
	local _LOCAL_PRERELEASE_TAG_DELETE_CMD
	_LOCAL_PRERELEASE_TAG_DELETE_CMD="git tag -d $(git tag -l "v${_VERSION}-${_PREID_PRERELEASE}.*") || true"
	debug "${_LOCAL_PRERELEASE_TAG_DELETE_CMD}"
	eval "${_LOCAL_PRERELEASE_TAG_DELETE_CMD}"
	_LOCAL_PRERELEASE_TAG_DELETE_CMD="git tag -d $(git tag -l "${_VERSION}-${_PREID_PRERELEASE}.*") || true"
	debug "${_LOCAL_PRERELEASE_TAG_DELETE_CMD}"
	eval "${_LOCAL_PRERELEASE_TAG_DELETE_CMD}"

	# release tags
	local _LOCAL_RELEASE_TAG_DELETE_CMD
	_LOCAL_RELEASE_TAG_DELETE_CMD="git tag -d v${_VERSION} || true"
	debug "${_LOCAL_RELEASE_TAG_DELETE_CMD}"
	eval "${_LOCAL_RELEASE_TAG_DELETE_CMD}"
	_LOCAL_RELEASE_TAG_DELETE_CMD="git tag -d ${_VERSION} || true"
	debug "${_LOCAL_RELEASE_TAG_DELETE_CMD}"
	eval "${_LOCAL_RELEASE_TAG_DELETE_CMD}"

	# branches
	local _BRANCH_DELETE_CMD
	_BRANCH_DELETE_CMD="git branch -d release/${_VERSION} || true"
	debug "${_BRANCH_DELETE_CMD}"
	eval "${_BRANCH_DELETE_CMD}"
	_BRANCH_DELETE_CMD="git branch -d release/v${_VERSION} || true"
	debug "${_BRANCH_DELETE_CMD}"
	eval "${_BRANCH_DELETE_CMD}"
	_BRANCH_DELETE_CMD="git update-ref -d refs/remotes/origin/release/${_VERSION} || true"
	debug "${_BRANCH_DELETE_CMD}"
	eval "${_BRANCH_DELETE_CMD}"
	_BRANCH_DELETE_CMD="git update-ref -d refs/remotes/origin/release/v${_VERSION} || true"
	debug "${_BRANCH_DELETE_CMD}"
	eval "${_BRANCH_DELETE_CMD}"
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
