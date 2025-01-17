#/usr/bin/sh

function show_usage() {
    echo "Usage: $0 <owner> [repo]"
    echo "  owner: the owner of the repository"
    echo "  repo: the repository name"
}

OWNER=$1
if [ -z "$OWNER" ]; then
  show_usage
  exit 1
fi

if [ -z "$GITHUB_ACCESS_TOKEN" ]; then
  echo please set GITHUB_ACCESS_TOKEN in adance
  exit 1
fi

REPO=$2
ORG=$OWNER

if [ -n "$REPO" ]; then
  URL=https://api.github.com/repos/$OWNER/$REPO/actions/runners/registration-token
else
  URL=https://api.github.com/orgs/$ORG/actions/runners/registration-token
fi
  TOKEN=$(curl -L \
  -X POST \
  -s \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_ACCESS_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  $URL | jq -r '.token')
echo $TOKEN


