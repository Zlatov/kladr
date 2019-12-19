#!/usr/bin/env bash

set -eu

cd "$(dirname "${0}")"

cd ../..

. ./env && RAILS_ENV=development bundle exec rails s -p $PORT -b 0.0.0.0 -d
