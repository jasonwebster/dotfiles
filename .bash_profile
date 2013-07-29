
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# homebrew installed completions
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# autocomplete for g git alias
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \ || complete -o default -o nospace -F _git g

[[ -s "$HOME/.commonrc" ]] && source "$HOME/.commonrc"


export PS1='\u@\h:\W$(__git_ps1 " (%s)") \$ '
