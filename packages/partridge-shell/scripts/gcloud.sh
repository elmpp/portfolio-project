#!/usr/bin/env bash

_PACKAGEBASE=packages/partridge-shell
# shellcheck disable=SC2034
_SUBCOMMAND_PROGRAM_LIST='initialise cluster-create cluster-delete node-pool:scale-down snapshot-clean login'
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
***********************************************
*** Kubernetes Partridge cluster operations *** 
***********************************************
Version: ${_VERSION}
Usage:
  ${_ME} initialise
  ${_ME} login
  ${_ME} cluster-create <cluster-name>
  ${_ME} cluster-delete <cluster-name>
  ${_ME} node-pool:scale-down <cluster-name>
  ${_ME} snapshot-clean
  ${_ME} -h | --help
  ${_ME} --version
Subcommands:
  initialise        Bootstraps commands required for building with Google Cloud Build
  login
  cluster-create
  cluster-delete
  node-pool:scale-down    Drains all pods and scales the node-pool to 0. Effectively shutting it down.
  snapshot-clean
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
	"initialise")
		_client_setup
		_enable_apis
    _kms_setup
		_serviceaccounts_roles
		# _buildtriggers_setup - manual step as function below not idempotent, see gcloud docs
		;;
	"login")
		_login_and_select_project
		;;
	"cluster-create")
    # __CLUSTER="${_ARGUMENTS[1]:-$PARTRIDGE_GCP_CLUSTER_NAME}"
    # gcloud container clusters create "${__CLUSTER}"
		;;
	"cluster-delete")
    # __CLUSTER="${_ARGUMENTS[1]:-$PARTRIDGE_GCP_CLUSTER_NAME}"
    # gcloud container clusters create "${__CLUSTER}"
		;;
	"node-pool:scale-down")
		# _do_main_NAME="$(gcloud container clusters list --format 'value(name)')"
		# gcloud container clusters resize "${PARTRIDGE_GCP_CLUSTER_NAME}" --size=0 [--node-pool="${PARTRIDGE_GCP_NODEPOOL_NAME}"]
		;;
	"snapshot-clean")
		local _SNAPSHOTS
		local _SNAPSHOT_NAME
		local _DEL_CMD
		_SNAPSHOTS=$(gcloud compute snapshots list)
		for _A_LINE in $_SNAPSHOTS; do
			_SNAPSHOT_NAME=$(echo "${_A_LINE}" | awk '{print $1}')
			if [[ "${_SNAPSHOT_NAME}" =~ 'NAME' ]]; then
				continue
			fi
			
			_DEL_CMD="gcloud compute snapshots delete ${_SNAPSHOT_NAME} --quiet"
			debug "${_DEL_CMD}"
			eval "${_DEL_CMD}"
		done

		echo -e
		show_info "Snapshots cleared"
		;;
	"help")
		_print_help
		;;
	esac
}

_login_and_select_project() {
	gcloud auth login
	debug gcloud config set project "${PARTRIDGE_GCP_PROJECT_ID}"
	debug gcloud config set container/cluster "${PARTRIDGE_GCP_CLUSTER_NAME}"
	gcloud config set compute/zone "${PARTRIDGE_GCP_ZONE}"
}

_client_setup() {
	# local docker auth when use with cloud build - # http://tinyurl.com/yxccycdv
	local _DOCKER_AUTH_CMD="gcloud auth configure-docker"
	debug "${_DOCKER_AUTH_CMD}"
	eval "${_DOCKER_AUTH_CMD}"

	# cloud run still in beta; local docker cloud builds
	local _INSTALL_CMD="gcloud components install \
		beta \
		cloud-build-local \
		docker-credential-gcr \
		|| true && gcloud components update"
	debug "${_INSTALL_CMD}"
	eval "${_INSTALL_CMD}"
}

_serviceaccountroles() {
  gcloud projects get-iam-policy partridge-alan \
  --flatten="bindings[].members" \
  --format='table(bindings.role)' \
  --filter="bindings.members:${1}"; 
  echo -e "All roles - https://tinyurl.com/y6tu3gyk"
}
_serviceaccount_enable() {
	gcloud projects add-iam-policy-binding "${PARTRIDGE_GCP_PROJECT_NUMBER}" \
  --member "serviceAccount:${1}" \
  --role "${2}";
  _serviceaccountroles "${1}";
}
# assigns role, treating service account as a resource - https://tinyurl.com/y3z29ynh
_serviceaccountaddactas() { 
  gcloud iam service-accounts add-iam-policy-binding "${1}" \
  --member "serviceAccount:${2}" \
  --role "roles/iam.serviceAccountUser";
}
_serviceaccountaddrole() { # assigns role, treating service account as an identity - https://tinyurl.com/y4hzzt2h
  gcloud projects add-iam-policy-binding "${PARTRIDGE_GCP_PROJECT_NUMBER}" \
  --member "serviceAccount:${1}" \
  --role "${2}";
  _serviceaccountroles "${1}";
}

_serviceaccounts_roles() {

	# Cloud Build KMS cryptokey for github ssh keys - http://tinyurl.com/y4r9xrqk
	_serviceaccount_enable "701251931769@cloudbuild.gserviceaccount.com" "roles/cloudkms.cryptoKeyDecrypter"
	
	# Cloud Build deploy to Cloud Run perm - https://tinyurl.com/y6fgjs7e
	_serviceaccount_enable "701251931769@cloudbuild.gserviceaccount.com" "roles/run.admin" 
	_serviceaccountaddactas "701251931769-compute@developer.gserviceaccount.com" "701251931769@cloudbuild.gserviceaccount.com"

	# Cloud Build connect to Cloud SQL (via proxy) - 
	_serviceaccount_enable "701251931769@cloudbuild.gserviceaccount.com" "roles/cloudsql.client" 

	# @see gcloud.md for details about logging service account etc

	# Logging and Error Reporting - https://tinyurl.com/y3ex3u25
	_serviceaccountaddrole "partridge-logging@partridge-alan.iam.gserviceaccount.com" "roles/monitoring.metricWriter"
	_serviceaccountaddrole "partridge-logging@partridge-alan.iam.gserviceaccount.com" "roles/logging.logWriter"
	_serviceaccountaddrole "partridge-logging@partridge-alan.iam.gserviceaccount.com" "roles/errorreporting.writer"
}

_enable_apis() {
	# list of APIs - `gcloud services list`
	local _APIS_ENABLE_CMD="gcloud services enable \
		cloudkms.googleapis.com \
		cloudbuild.googleapis.com \
		containerregistry.googleapis.com \
		sqladmin.googleapis.com \
		clouderrorreporting.googleapis.com \
		|| true"
	debug "${_APIS_ENABLE_CMD}"
	eval "${_APIS_ENABLE_CMD}"
}

# Cloud Key Management (KMS) needs setting up - http://tinyurl.com/y6mwbvhq
_kms_setup() {
	local _KEYRING_CREATE_CMD="gcloud kms keyrings create partridge-keyring --location=global || true"
	debug "${_KEYRING_CREATE_CMD}"
	eval "${_KEYRING_CREATE_CMD}"
	
	local _CRYPTOKEY_CREATE_CMD="gcloud kms keys create partridge-github-key \
		--location=global --keyring=partridge-keyring \
		--purpose=encryption || true"
	debug "${_CRYPTOKEY_CREATE_CMD}"
	eval "${_CRYPTOKEY_CREATE_CMD}"
	
	local _ENCRYPT_CREATE_CMD="gcloud kms encrypt --plaintext-file=${_PACKAGEBASE}/../containers/etc/ssh-keys/odds4udotcom_githubmachineuser_rsa \
		--ciphertext-file=${_PACKAGEBASE}/../containers/etc/ssh-keys/odds4udotcom_githubmachineuser_rsa.enc \
		--location=global --keyring=partridge-keyring --key=partridge-github-key"
	debug "${_ENCRYPT_CREATE_CMD}"
	eval "${_ENCRYPT_CREATE_CMD}"

	ssh-keyscan -t rsa github.com > "${_PACKAGEBASE}/../containers/etc/ssh-keys/known_hosts"
}

# Build triggers - http://tinyurl.com/y6zwuvsx
#  - see docs regarding required manual step. 
#  - Must be created with curl for now - http://tinyurl.com/y6mzhlsy
_buildtriggers_setup() {
	# release branches
	local _RELEASE_API_BODY
	_RELEASE_API_BODY=$(cat <<'EOF'
{
  "trigger_template": {
    "repoName": "partridge",
    "branchName": "release/.*"
  },
  "filename": "cloudbuild-release.yaml"
}
EOF
	)

	local _RELEASE_CURL_CMD
	_RELEASE_CURL_CMD="curl -X POST --data '${_RELEASE_API_BODY}' -H \"Accept: application/json\" -H \"Content-Type: application/json\" -H \"Authorization: Bearer $(gcloud config config-helper --format='value(credential.access_token)')\" \"https://cloudbuild.googleapis.com/v1/projects/${PARTRIDGE_GCP_PROJECT_ID}/triggers\""
	debug "${_RELEASE_CURL_CMD}"
	eval "${_RELEASE_CURL_CMD}"
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
