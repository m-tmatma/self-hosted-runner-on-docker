#!/bin/bash -e

# https://docs.github.com/ja/actions/hosting-your-own-runners/managing-self-hosted-runners/adding-self-hosted-runners

if [ -d "actions-runner" ]; then
  echo "actions-runner directory already exists. Please remove it first."
  exit 1
fi

# Create a folder
mkdir actions-runner && cd actions-runner

# Download the latest runner package
curl -o actions-runner-linux-x64-2.316.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.316.1/actions-runner-linux-x64-2.316.1.tar.gz

# Optional: Validate the hash
echo "d62de2400eeeacd195db91e2ff011bfb646cd5d85545e81d8f78c436183e09a8  actions-runner-linux-x64-2.316.1.tar.gz" | shasum -a 256 -c

# Extract the installer
tar xzf ./actions-runner-linux-x64-2.316.1.tar.gz

# install dependencies
./bin/installdependencies.sh
