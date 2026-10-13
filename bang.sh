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
    --select-1 \
    --preview-window right,wrap,border-sharp \
    --preview 'bat --language=sh --style=plain --color=always {1}' \
    --bind 'CTRL-e:execute(nvim {1})+refresh-preview' \
    --layout reverse \
    --border sharp \
  | xargs -r -o bash