# Make an alias for invoking commands you use constantly
# File system
if command -v eza &>/dev/null; then
  alias ls='eza --group-directories-first --icons=auto'
  alias l='eza -lhF --group-directories-first --icons=auto'
  alias la='eza -lahF --group-directories-first --icons=auto'
fi

alias grep='grep --color=auto'
alias ffe="fzf --preview 'bat --style=numbers --color=always {}' -e"
