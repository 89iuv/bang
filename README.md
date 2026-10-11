# Bang

- [Bang](#bang)
  - [Requirements](#requirements)
  - [Setup](#setup)
  - [Install](#install)
  - [Usage](#usage)
    - [Scripts](#scripts)
    - [Cli](#cli)
    - [Shortcuts](#shortcuts)

## Requirements

- Folder `~/.local/bin` is created and added to `$PATH`

## Setup

Install required packages

```sh
sudo dnf install bat, fzf, nvim
```

## Install

Create symbolic link to launcher

```sh
ln -sr bang.sh ~/.local/bin/bang
```

## Usage

### Scripts

- Add new scripts to `./scripts` folder

### Cli

- Run `bang` to select the script to run
- Run `bang query` to prefill the search

Note:

- If only one script matches the query it will be run directly

### Shortcuts

- `ctrl+e`: edit script in `nvim`
- `ctrl+c`: close the launcher
