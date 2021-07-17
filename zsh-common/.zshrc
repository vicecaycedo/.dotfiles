#===============================================================================
# Zinit
#===============================================================================

# Added by Zinit's installer.
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

# End of Zinit's installer chunk.

# Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit ice depth=1; zinit light romkatv/powerlevel10k

#===============================================================================
# Powerlevel10k Prompt
#===============================================================================

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#===============================================================================
# General
#===============================================================================

# Editors.
export EDITOR="vim"
export VISUAL="vim"

# History.
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=5000
export SAVEHIST=5000
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# Directory navigation.
setopt autocd autopushd pushdignoredups

# Shorter timeout for Vi mode.
export KEYTIMEOUT=1

# Handle backspace in Vi mode.
bindkey -v '^?' backward-delete-char

#===============================================================================
# Aliases
#===============================================================================

# Auto expand aliases.
autoload -Uz compinit && compinit
function expand-alias(){
  zle _expand_alias
  zle self-insert
}
zle -N expand-alias
bindkey -M viins ' ' expand-alias
bindkey -M viins '^[ ' magic-space
bindkey -M isearch ' ' magic-space

function expand-alias-and-accept-line() {
  zle _expand_alias
  zle .accept-line
}
zle -N accept-line expand-alias-and-accept-line

# General.
alias c="clear"
alias nv="nvim"

# Git.
alias gs="git status"
alias ga="git add"
alias gap="git add -p"
alias gcm="git commit --message"
alias gd="git diff"
alias gds="git diff --staged"
alias gpush="git push"
alias gpull="git pull"
alias gl="git log"

# Tmux.
alias t="tmux"
alias ta="tmux a"
alias td="tmux detach"

# Zsh Config.
alias ec="$EDITOR $HOME/.zshrc"
alias so="source $HOME/.zshrc"

#===============================================================================
# Additional configs.
#===============================================================================

[ -f ~/.zshrc-glinux ] && source ~/.zshrc-glinux
[ -f ~/.zshrc-google ] && source ~/.zshrc-google
[ -f ~/.zshrc-macos ] && source ~/.zshrc-macos

