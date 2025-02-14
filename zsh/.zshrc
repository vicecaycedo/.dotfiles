# Prompt
PROMPT='%(?..%F{red}%?%f )%F{blue}%~
%# '

# Editor
export EDITOR=nvim

# History
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=5000
export SAVEHIST=5000
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--layout=reverse --cycle --border'

# Directory Navigation
setopt autocd autopushd pushdignoredups

# Shorten timeout for Vi mode.
export KEYTIMEOUT=1

# Handle backspace in Vi mode.
bindkey -v '^?' backward-delete-char

# Shortcut to edit command line in editor.
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Auto expand aliases.
autoload -Uz compinit && compinit
function expand-alias() {
	zle _expand_alias
	zle self-insert
}
zle -N expand-alias
function expand-alias-and-accept-line() {
	zle _expand_alias
	zle .accept-line
}
zle -N accept-line expand-alias-and-accept-line
bindkey -M viins ' ' expand-alias
bindkey -M viins '^[ ' magic-space
bindkey -M isearch ' ' magic-space

# General Aliases
alias c="clear"
alias n="nvim"
alias l="less -F"
alias r="ranger"
alias lg="lazygit"

# Tmux Aliases
alias t="tmux"
alias ta="tmux a"
alias td="tmux detach"

# Zsh Config Aliases
alias ec="$EDITOR $HOME/.zshrc"
alias so="exec zsh"

# Additional Configs
[ -f $HOME/.zshrc-glinux ] && source $HOME/.zshrc-glinux
[ -f $HOME/.zshrc-macos ] && source $HOME/.zshrc-macos

# Download plugins, if necessary.
if [[ ! -e $HOME/.zsh/zsh-autosuggestions ]]; then
	echo "Installing zsh-autosuggestions plugin..."
	git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
fi
if [[ ! -e $HOME/.zsh/fast-syntax-highlighting ]]; then
	echo "Installing fast-syntax-highlighting plugin..."
	git clone https://github.com/zdharma-continuum/fast-syntax-highlighting $HOME/.zsh/fast-syntax-highlighting
fi

# Load plugins.
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
