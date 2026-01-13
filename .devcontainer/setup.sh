#!/usr/bin/env bash
set -euxo pipefail

sudo apt update
sudo apt install --yes shellcheck

go install github.com/mikefarah/yq/v4@v4.50.1
go install mvdan.cc/sh/v3/cmd/shfmt@v3.12.0

OPENCODE_VERSION=1.1.12      # renovate: datasource=github-releases depName=anomalyco/opencode packageName=anomalyco/opencode
DEVCONTAINERS_VERSION=0.80.3 # renovate: datasource=github-releases depName=devcontainers/cli packageName=devcontainers/cli

npm install --global opencode-ai@$OPENCODE_VERSION
npm install --global @devcontainers/cli@$DEVCONTAINERS_VERSION
