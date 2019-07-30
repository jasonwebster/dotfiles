HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep

bindkey -e

export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

autoload -Uz compinit
compinit

# enable autocomplete for g git alias
compdef g='git'

fpath=(/usr/local/share/zsh-completions $fpath)

# disable paste highlighting
zle_highlight+=(paste:none)

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats ' (%b)'

setopt PROMPT_SUBST
PROMPT='%n@%m:${PWD/#$HOME/~}${vcs_info_msg_0_} \$ '

# include shell agnostic configuration
[[ -s "$HOME/.commonrc" ]] && . "$HOME/.commonrc"

# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi

export PATH=".git/safe/../../bin:$PATH"
