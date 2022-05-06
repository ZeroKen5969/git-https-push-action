#!/bin/bash -l
set -xeEuo pipefail

if [[ -z "${1:-}" ]]; then
  echo "Usage: $0 REMOTE_URL" >&2
  exit 1
fi

REMOTE_URL=$1
REMOTE=upstream-$(date +%s)

trap "git remote rm $REMOTE" ERR SIGHUP SIGINT SIGTERM

git remote add $REMOTE $REMOTE_URL
git push -f $REMOTE HEAD:master
