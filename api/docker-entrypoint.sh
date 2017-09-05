#!/bin/bash

set -o errexit

bundle install

exec "$@"
