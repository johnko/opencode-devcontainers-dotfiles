#!/usr/bin/env bash
set -euo pipefail

for i in $(find "$HOME/dotfiles" -type f -not -path "*/.git/*" -not -path "*/.devcontainer/*" -not -path "*/bootstrap.sh" | sed "s,$HOME/dotfiles/,,g"); do
  if [[ "$(dirname "$i")" != "." && "$(dirname "$i")" != "/" && "$(dirname "$i")" != "" ]]; then
    if [[ ! -e "$HOME/$(dirname "$i")" ]]; then
    mkdir -p "$HOME/$(dirname "$i")"
    fi
  fi
  if [[ ! -e "$HOME/$i" ]]; then
    cp -v "$HOME/dotfiles/$i" "$HOME/$i"
  fi
done

set -x

OPENCODE_VERSION=1.1.12      # renovate: datasource=github-releases depName=anomalyco/opencode packageName=anomalyco/opencode
DEVCONTAINERS_VERSION=0.80.3 # renovate: datasource=github-releases depName=devcontainers/cli packageName=devcontainers/cli

npm install --global opencode-ai@$OPENCODE_VERSION
npm install --global @devcontainers/cli@$DEVCONTAINERS_VERSION
