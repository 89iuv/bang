# Bang

- [Bang](#bang)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)

## Prerequisites

- Installed packages: git, nvim, bat, fzf
- Folder: `~/.local/bin` created and added to `$PATH`

## Install

```sh
ln -s bang.sh ~/.local/bin/bang
```

## Usage

Scripts

- Add new scripts to `./scripts` folder

Cli

- Run `bang` to select the script to run
- Run `bang query` to prefill the search

Note:

- If only one script matches the query it will be run directly

Shortcuts

- `ctrl+e`: edit script in `nvim`
- `ctrl+c`: close the launcher
