#!/bin/bash

BANG_PATH="$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")"
export BANG_PATH

list_scripts() {
  find "$BANG_PATH/scripts" -type f -name "*.sh" \
    | sort \
    | awk -F/ '{ name = $NF; sub(/\.sh$/, "", name); print $0 "\t" name }'
}

new_script() {
  local name="$1" answer
  if [ -z "$name" ]; then
    name="new_script_$(date +%Y%m%d_%H%M%S)"
  fi

  read -r -p "Create script [${name}]: " answer
  name="${answer:-$name}"

  local file="$BANG_PATH/scripts/$name.sh"
  [ -e "$file" ] || printf '#!/bin/bash\n\n' > "$file"
  nvim "$file"
}

delete_script() {
  local file="$1"
  [ -n "$file" ] || return

  read -r -n 1 -p "Delete script $(basename -- "$file")? [y/N] " answer
  [[ "$answer" == [yY] ]] && rm -- "$file"
}

# fzf runs bind commands in a subshell, so the functions must be exported.
export -f list_scripts new_script delete_script

reload_action='reload(bash -c list_scripts)'
edit_binding="CTRL-e:execute(bash -c 'nvim \"\$1\"' _ {1})+refresh-preview"
delete_binding="CTRL-d:execute(bash -c 'delete_script \"\$1\"' _ {1})+$reload_action"
add_binding="CTRL-a:execute(bash -c 'new_script \"\$1\"' _ {q})+$reload_action+clear-query"

list_scripts \
  | fzf \
    --query "$*" \
    --select-1 \
    --delimiter '\t' \
    --with-nth=2 \
    --accept-nth=1 \
    --ghost "Type to search..." \
    --highlight-line \
    --preview 'bat --language=sh --style=plain --color=always {1}' \
    --preview-window right,wrap,border-sharp,60% \
    --layout reverse \
    --no-border \
    --bind "$edit_binding" \
    --bind "$delete_binding" \
    --bind "$add_binding" \
  | xargs -r -o -d '\n' bash
