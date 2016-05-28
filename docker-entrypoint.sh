#!/bin/bash

set -e

if [[ ${1:0:1} = '-' ]]; then
  ARGS="$@"
  set --
elif [[ ${1} == named || ${1} == $(command -v named) ]]; then
  ARGS="${@:2}"
  set --
fi

if [[ -z ${1} ]]; then
  exec $(command -v named) -u bind -g ${ARGS}
else
  exec "$@"
fi
