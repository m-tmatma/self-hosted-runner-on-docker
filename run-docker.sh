#!/bin/bash -e

function show_usage() {
    echo "Usage: $0 <owner> [repo]"
    echo "  owner: the owner of the repository"
    echo "  repo: the repository name"
}

function show_GITHUB_ACCESS_TOKEN() {
    echo please set GITHUB_ACCESS_TOKEN in adance
}
OWNER=$1
REPO=$2

if [ -z "$GITHUB_ACCESS_TOKEN" ]; then
  show_GITHUB_ACCESS_TOKEN
  exit 1
fi
if [ -z "$OWNER" ]; then
  show_usage
  exit 1
fi

docker run --rm -it \
    -e OWNER=$OWNER \
    -e REPO=$REPO \
    -e GITHUB_ACCESS_TOKEN=$GITHUB_ACCESS_TOKEN \
    self-hosted-runner
