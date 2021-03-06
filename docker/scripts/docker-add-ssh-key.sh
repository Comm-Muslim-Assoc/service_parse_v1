#!/usr/bin/env bash

if [ ! "$1" ]; then
  echo "Usage: $0 <name-of-parse-server-container> <ssh-key-file>..."
  exit 1
fi

DOCKER_PARSE_SERVER_NAME="$1"
shift

if [ ! "$1" ]; then
  echo "Usage: $0 <name-of-parse-server-container> <ssh-key-file>..."
  exit 1
fi

while [ "$1" ]; do
  if [ ! -f "$1" ]; then
    shift
    continue
  fi

  docker exec -i parse-server ssh-add-key < "$1"
  shift
done