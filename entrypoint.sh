#!/bin/bash

set -e

cd "/home/node/app" || exit 1

#if [ ! -d "elm-stuff" ]; then
#    if [ -f "package.json" ]; then
#        npm install
#    else
#        npm install --loglevel=warn -g elm@${ELM_VERSION}
#    fi
#    elm-package install -y
#fi

if [ -z "$1" ]; then
  elm
else
  exec "$@"
fi