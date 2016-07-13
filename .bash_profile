export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# source homebrew installed completions
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# enable autocomplete for g git alias
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \ || complete -o default -o nospace -F _git g

# include shell agnostic configuration
[[ -s "$HOME/.commonrc" ]] && . "$HOME/.commonrc"


# don't be stupid, bash
shopt -s histappend

export PS1='\u@\h:\W$(__git_ps1 " (%s)") \$ '
