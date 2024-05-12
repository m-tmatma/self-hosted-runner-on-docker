#!/bin/bash

function show_usage() {
    echo "Usage: $0 <owner> [repo]"
    echo "  owner: the owner of the repository"
    echo "  repo: the repository name"
}

if [ -z "$OWNER" ]; then
  show_usage
  exit 1
fi
if [ -z "$REPO" ]; then
  show_usage
  exit 1
fi

if [ -z "$GITHUB_ACCESS_TOKEN" ]; then
  echo please set GITHUB_ACCESS_TOKEN in adance
  exit 1
fi
if [ -z "$LABELS" ]; then
  echo please set LABELS in adance
  exit 1
fi
if [ -z "$NAME" ]; then
  echo please set NAME in adance
  exit 1
fi

if [ -n "$REPO" ]; then
  URL=https://api.github.com/repos/$OWNER/$REPO/actions/runners/registration-token
  URL_TO_RUNNER=https://github.com/$OWNER/$REPO
else
  URL=https://api.github.com/orgs/$OWNER/actions/runners/registration-token
  URL_TO_RUNNER=https://github.com/$OWNER
fi
  TOKEN=$(curl -L \
  -X POST \
  -s \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_ACCESS_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  $URL | jq -r '.token')
#echo $TOKEN

export RUNNER_ALLOW_RUNASROOT=1

cd actions-runner
./config.sh --unattended --name $NAME-$(hostname) --url $URL_TO_RUNNER --token $TOKEN --ephemeral --labels $LABELS
./run.sh
