#!/usr/bin/env bash

set -eu

cd "$(dirname "${0}")"

. ../_lib/echoc

cd ../..

if [[ -s tmp/pids/server.pid ]]
then
	kill -QUIT `cat tmp/pids/server.pid`
	echoc -n "Приложение остановлено." green
else
	echoc -n "Пид-файл не найден." blue
fi
