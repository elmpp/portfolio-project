#!/usr/bin/env bash

### This has been retained should we switch back to a minikube-based local setup

_PACKAGEBASE=packages/partridge-shell
# shellcheck disable=SC2034
_SUBCOMMAND_PROGRAM_LIST='warm-build-cache dev-env-up dev-env-down dev-env-deploy browser-open'
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
*** Commands involved in deploying artifacts *** 
*********************************************
Version: ${_VERSION}
Usage:
  ${_ME} warm-build-cache
  ${_ME} dev-env-up
  ${_ME} dev-env-down
  ${_ME} dev-env-deploy <kubernetes app_version (semantic required)> <frontend version (semantic/docker tag)> <env (local|dev|staging|prod)> <app name (partridge etc)>
  ${_ME} browser-open
  ${_ME} -h | --help
  ${_ME} --version
Subcommands:
  warm-build-cache    Simply does a docker pull of any images we may need (so can work locally)
  dev-env-up     Ensures the environment is in a state where we can be building and deploying locally. \
                This will mean minikube running with ancillary services (postgres, docker registry etc)
  dev-env-down   Idempotent command to bring down whatever dev-env-up set up
  dev-env-deploy   Deploy a chart to local minikube <env (local|dev|staging|prod)> <version (0.31.0 etc)> <app_name (partridge)>
  browser-open    Launch browser against the relevant frontend instance
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
    "warm-build-cache")
      for _AN_IMAGE in "${PARTRIDGE_BASE_IMAGES[@]}"; do
        show_info "Pulling image ${_AN_IMAGE}"
        docker pull "${_AN_IMAGE}"
      done

      echo -e ''
		  show_success "Images should now be cached locally"
      ;;
    "dev-env-up")
      if ! _is_running ; then
	show_info "*** STARTING MINIKUBE - IF IT HANGS DO \"minikube delete\". If not that then delete hyperkit.pid (https://goo.gl/Tzmdqb). If not that then DELETE FILES WITHIN ~/.MINIKUBE ***"
        minikube start --vm-driver=hyperkit --v 7
        
        # Delete the following to enable Helm support locally. (Using Knctl currently)
        #helm init --kube-context=minikube

        # http://tinyurl.com/y3tg53cd
        show_info "KNative components (Istio, Serving etc) being installed"
        knctl install --node-ports --exclude-monitoring
      fi

      # enables docker to speak to gce - https://goo.gl/EuPMyW
      gcloud auth configure-docker -q || true

      # _clear_secrets

      echo -e ''
		  show_success "Env ready for building/deploying locally"
      ;;
    "dev-env-deploy")
      local _VERSION
      local _VERSION_FRONTEND
      local _ENV
      local _APP
      _VERSION=$(_require_argument "${_ARGUMENTS[1]:-}" "Version")
      _VERSION_FRONTEND=$(_require_argument "${_ARGUMENTS[2]:-}" "Frontend Version")
      _ENV=$(_require_argument "${_ARGUMENTS[3]:-}" "Env (dev|staging etc)")
      _APP="${_ARGUMENTS[4]:-partridge}"
      # release names must be simple and match '[a-z]([-a-z0-9]*[a-z0-9])?'
      local _HELM_RELEASE_NAME="${_APP}-${_ENV}"
		  local _CHART_DIR="./packages/containers/helm" # note the ./
		  local _APP_CHART_DIR="${_CHART_DIR}/${_APP}"
      local _PASSTHRU_OPTIONS
      _PASSTHRU_OPTIONS=$(_passthru_options '--dry-run')

      # _helm_remove_releases "$@"

      kubectl config current-context

      _setup_linked_service_account

      local _HELM_PACKAGE_CMD="helm package --app-version ${_VERSION} --version ${_VERSION} --destination ${_CHART_DIR} ${_APP_CHART_DIR}" 
      debug "${_HELM_PACKAGE_CMD}"
      eval "${_HELM_PACKAGE_CMD}"

      # docs for --set : https://goo.gl/6882Eo
      local _HELM_INSTALL_CMD="helm upgrade --install --force --reset-values \
        ${_HELM_RELEASE_NAME} \
        ${_CHART_DIR}/${_APP}-${_VERSION}.tgz \
        ${_PASSTHRU_OPTIONS} \
        -f ${_APP_CHART_DIR}/values.yaml \
        -f ${_APP_CHART_DIR}/values.minikube.yaml \
        --set version=${_VERSION} \
        --set frontend.version=${_VERSION_FRONTEND} \
        --debug \
        "
      debug "${_HELM_INSTALL_CMD}"
      eval "${_HELM_INSTALL_CMD}"

      kubectl get pods || true

      echo -e ''
		  show_success "Deployed a release"
      ;;
    "dev-env-down")

      # _helm_remove_releases "$@"

      minikube stop

      echo -e ''
		  show_success "Env down for building/deploying locally"
      ;;
    "browser-open")
      local _ENV
      local _FRONTEND_SERVICE_NAME
      local _URL
      _ENV=$(_require_argument "${_ARGUMENTS[1]:-}" "Env (dev/canary etc)")
      _FRONTEND_SERVICE_NAME=$(kubectl get service | grep "${_ENV}-frontend" | awk '{print $1}')
      _URL=$(minikube service "${_FRONTEND_SERVICE_NAME}" --url)

      echo -e ''
		  show_success "Frontend deployed to ${_URL}"

      minikube service "${_FRONTEND_SERVICE_NAME}"
      ;;
    "help")
      _print_help
      ;;
  esac
}

_clear_secrets() {
  kubectl delete secret gcr-json-key || true
  # minikube/kubernetes seems to assign a default service-account-token
  kubectl get secret | grep kubernetes.io/service-account-token | awk '{print $1}' | xargs kubectl delete secret || true
}

_setup_linked_service_account() {
  # enable minikube to pull from gcr - https://goo.gl/t7zuB9
  kubectl --namespace=default create secret docker-registry gcr-json-key \
      --docker-server=https://eu.gcr.io \
      --docker-username=_json_key \
      --docker-password="$(cat ~/Google\ Drive/Partridge/keys/partridge/serviceaccount-gcr_pull-private.json)" \
      --docker-email=gcr-pull@partridge-alan.iam.gserviceaccount.com || true

  local _DOCKER_REGISTRY_PULL_CMD="kubectl --namespace=default patch serviceaccount default \
      -p '{\"imagePullSecrets\": [{\"name\": \"gcr-json-key\"}]}' || true"
  debug "${_DOCKER_REGISTRY_PULL_CMD}"
  eval "${_DOCKER_REGISTRY_PULL_CMD}"
}

_is_running() {
  minikube status
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
