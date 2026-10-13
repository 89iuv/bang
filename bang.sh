#!/bin/bash

BANG_PATH="$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")"
find $BANG_PATH/scripts -type f -name "*.sh" \
  | sort \
  | awk -F/ '{ print $0 "\t" $NF }' \
  | fzf \
    --delimiter '\t' \
    --with-nth=2 \
    --accept-nth=1 \
    --query "$*" \
    --ghost "Search for script" \
    --select-1 \
    --preview 'bat --language=sh --style=plain --color=always {1}' \
    --preview-window right,wrap,border-sharp,60% \
    --no-border \
    --layout reverse \
    --bind 'CTRL-e:execute(nvim {1})+refresh-preview' \
  | xargs -r -o bash