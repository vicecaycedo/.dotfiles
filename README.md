# `~/.dotfiles`

A collection of configuration files for my development environment.

## FAQs

### How do you manage your dotfiles?

[GNU Stow](https://www.gnu.org/software/stow/manual/stow.html)

### Example commands

Run from `~/.dotfiles`.

```sh
# Nested nvim packages under ./nvim/{base,tsk}
stow -d nvim -t ~ base tsk

# Regular top-level package (./wezterm)
stow wezterm
```
