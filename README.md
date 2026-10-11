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

Add new scripts in ./scripts folder

run: `bang` and select the script to run
run: `bang query` to prefill the search with `query`

Note:

- if only one script matches the query it will be run directly
