#!/bin/sh

set -o errexit

yarn install
#yarn install --no-progress

exec "$@"