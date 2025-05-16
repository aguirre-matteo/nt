<p align="center"></p><!-- spacer -->

<div align="center">
  <img  src="./assets/logo.png"
        alt="nt"
        width="200">
</div>

<p align="center"></p><!-- spacer -->

`nt` is a simple Note Management tool, designed to be easy and quick
to use. The available features are:

- Simple yet powerful fzf-based browser. Enhanced version of [fuz.sh](https://gist.github.com/BaseCase/c45299e4f8474119881d708a4b728fbf).
- Plain text note taking
- Searching (with `find` and `grep`)
- Daily notes
- `eza` integration.
- Simple config file

# Table of contents

- [Get Started](#get-started)
    - [Fzf Browser](#fzf-browser)
    - [CLI Commands](#cli-commands)
        - [Init](#init)
        - [Open note](#open-note)
        - [Daily note](#daily-note)
        - [Previous daily note](#previous-daily-note)
        - [Fuz](#fuz)
        - [Browse](#browse)
        - [Find](#find)
        - [Grep](#grep)
        - [Ls](#ls)
        - [Rm](#rm)
        - [Tree](#tree)
    - [Configuration](#configuration)
- [Contributing](#contributing)
- [Licence](#licence)

# Get started
Before using `nt`, you must first create a config file at `$XDG_CONFIG_HOME/nt` and set where your vault will be located:

```
[matteo@nixos:~/Desktop/nt]$ touch $XDG_CONFIG_HOME/nt

[matteo@nixos:~/Desktop/nt]$ nvim $XDG_CONFIG_HOME/nt
```

Every line of the config file is in the format `key=value`. For example:

```
vault=/home/matteo/Documents/nt-vault
```

## Fzf Browser
`nt` offers a powerful fzf-based browser that makes it easier to navigate through you vault.
To use it, just run `nt` or `nt fuz`. Here you can select which note you want to open. If you
want to create a new note, type the path to it in fzf's text input. For example: `linux/admin/systemd`.
`nt` will automatically handle the input to make sure it ends in `.md` so you don't have to worry about
it. You can also open daily and previous daily notes following the same syntax described in the [CLI Section](#daily-note).

## CLI Commands
The following commands are available in the CLI. They're useful for making scripts that require
interacting with your vault. 

### Init
`nt init`. Creates a basic structure in the vault.

### Open Note
`nt section/subsection/note_name`. Opens a note. Nesting sections is supported.

### Daily note
`nt .|d|daily|today`. Opens today's daily note.

### Previous daily note
`nt ..N`. Opens the daily note from N days ago.

### Fuz
`nt fuz | nt (no args)`. Opens a fzf-based browser with a preview of the contents of the selected note.
Pressing enter will open that note with your prefered editor.

### Browse
`nt browse`. Opens your vault with the configured file-manager.

### Find
`nt find name`. Looks up in your vault for files that contains 'name' in its path.

### Grep 
`nt grep text`. Looks up in all your notes for files that contains 'text'.

### Ls 
`nt ls section/subsection`. `ls` bind to your vault.

### Rm
`nt rm section/files`. `rm` bind to your vault.

### Tree
`nt tree|lt section` Draws a tree view of your vault or a section of it. It will use `eza` if it's available.

## Configuration
Each line in the config file is in the form "key=value". Here's an example config, with all the available options:

```
vault=/home/username/Documents/vault # Must be manually set
editor=nvim # Fallback to $EDITOR
file-manager=yazi # Fallback to cd
```

# Contributing
If you want to contribute to this project, feel free to open an issue reporting a bug, requesting a new feature or sharing this project with other people.

# Licence
This program is licenced under the MIT Licence. See the details [here](./LICENCE).
