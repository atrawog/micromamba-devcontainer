#!/usr/bin/env bash

set -ef -o pipefail

echo "$@"

# Activate the environment if $MAMBA_DOCKERFILE_ACTIVATE=1
if [[ "${MAMBA_DOCKERFILE_ACTIVATE}" == "1" ]]; then
  source _activate_current_env.sh
fi

# Set umask if given
if [[ ! -z "${DOCKERFILE_UMASK}" ]]; then
  umask "${DOCKERFILE_UMASK}"
fi

exec bash -o pipefail -c "$@"