#!/usr/bin/env bash

set -eu

cd "$(dirname "${0}")"

cd ../..

. ./env && RAILS_ENV=production bundle exec rails s -p $PORT -d
