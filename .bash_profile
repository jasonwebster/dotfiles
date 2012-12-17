
export PATH="/usr/local/bin:$HOME/bin:$PATH"

# homebrew installed completions
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# autocomplete for g git alias
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \ || complete -o default -o nospace -F _git g

[[ -s "$HOME/.commonrc" ]] && source "$HOME/.commonrc"


export PS1='\[\e[1;34m\]\u@\h\[\e[0m\]:\[\e[1;35m\]\W\[\e[0m\]\[\e[1;33m\]$(__git_ps1 " (%s)") \[\e[0m\]\[\e[1;32m\]\$ \[\e[0m\]'