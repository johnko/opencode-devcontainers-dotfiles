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
set +e
