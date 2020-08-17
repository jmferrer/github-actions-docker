#!/bin/bash

if [ -z ${NAME+x} ]; then
  NAME=$(hostname)
fi
if [ -z ${LABELS+x} ]; then
  LABELS="self-hosted,Linux,X64"
fi
if [ -z ${WORKSPACE+x} ]; then
  WORK="/_work"
fi
if [ -z ${REPLACE+x} ]; then
  REPLACE="1"
fi

# To allow to run as root this agent, launch docker image with
# -e RUNNER_ALLOW_RUNASROOT=1

if [ -z ${TOKEN+x} ] || [ -z ${URL+x} ] ; then
  echo "Please, set TOKEN and URL vars"
  exit -1
else
  command="./config.sh --token $TOKEN --url $URL --name $NAME --labels $LABELS --work $WORK"
  if [ "${REPLACE}" = "1" ]; then
    command="$command --replace"
  fi
  $command
  if [ -n "$HTTP_PROXY"]; then
    export http_proxy=$HTTP_PROXY
  fi
  if [ -n "$HTTPS_PROXY"]; then
    export https_proxy=$HTTPS_PROXY
  fi
  if [ -n "$NO_PROXY"]; then
    export no_proxy=$no_PROXY
  fi
  ./run.sh
fi
