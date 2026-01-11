#!/usr/bin/env bash
set -euxo pipefail

OPENCODE_VERSION=1.1.12 # renovate: datasource=github-releases depName=anomalyco/opencode packageName=anomalyco/opencode
DEVCONTAINERS_VERSION=0.80.3 # renovate: datasource=github-releases depName=devcontainers/cli packageName=devcontainers/cli

npm install --global opencode-ai@$OPENCODE_VERSION
npm install --global @devcontainers/cli@$DEVCONTAINERS_VERSION

for i in .bash_aliases .config/opencode/opencode.jsonc ; do
  cp "$i" "$HOME/$i"
done
