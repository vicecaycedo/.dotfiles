# `~/.dotfiles`

A collection of configuration files for my development environment.

## Installation

Requires [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html).

Run these commands from the dotfiles repository root (e.g., `$HOME/.dotfiles`),
replacing `PACKAGE` with desired configuration to install (e.g. `wezterm`,
`lazygit`, etc.):

```sh
# Dry run (recommended first)
stow --simulate --verbose [PACKAGE...]

# Top-level package, e.g.
stow [PACKAGE...]

# Nested package set (always include base), e.g.
stow --dir="nvim" --target="$HOME" base [PACKAGE...]
```
