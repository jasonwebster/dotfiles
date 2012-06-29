
export PATH="/usr/local/bin:$HOME/bin:$PATH"

# homebrew installed completions
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi


[[ -s "$HOME/.commonrc" ]] && source "$HOME/.commonrc"


export PS1='\u@\h:\W$(__git_ps1 " (%s)") \$ '
