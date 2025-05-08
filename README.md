<p align="center"></p><!-- spacer -->

<div align="center">
  <img  src="./assets/logo.png"
        alt="nt"
        width="200">
</div>

<p align="center"></p><!-- spacer -->

`nt` is a simple CLI Note Management tool, designed to be easy and quick
to use. The available features are:

- Plain text note taking
- Searching (with `find` and `grep`)
- Daily notes
- `fzf` and `eza` integration.
- Simple config file

# Table of contents

- [Get Started](#get-started)
    - [Commands](#commands)
        - [Init](#init)
        - [Browse](#browse)
        - [Open note](#open-note)
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

## Commands

### Init
`nt init`. Creates a basic structure in the vault.

### Browse
`nt browse | nt (no args)`. Opens a fzf-based browser with a preview of the contents of the selected note. Pressing enter will open that note with your prefered editor.

### Open Note
`nt section/subsection/note_name`. Opens a note. Nesting is supported.

### Find
`nt find name`. Looks up in your vault for files that contains 'name' in its path.

### Grep 
`nt grep text`. Looks up in all your notes for files that contains 'text'.

### Ls 
`nt ls section/subsection`. `ls` bind to your vault.

### Rm
`nt rm section/files`. `rm` bind to your vault.

### Tree
`nt tree|lt section` Draws a tree view of your vault or a section of it.

## Configuration
Each line in the config file is in the form "key=value". Here's an example config, with all the available options:

```
vault=/home/username/Documents/vault # Must be manually set
editor=nvim # If unset, will fallback to $EDITOR
```

# Contributing
If you want to contribute to this project, feel free to open an issue reporting a bug, requesting a new feature or sharing this project with other people.

# Licence
This program is licenced under the MIT Licence. See the details [here](./LICENCE).
