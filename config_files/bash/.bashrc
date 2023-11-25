#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="[\[$(tput setaf 10)\]\u\[$(tput setaf 8)\]@\[$(tput setaf 10)\]\h \[$(tput setaf 12; tput bold)\]\w\[$(tput sgr0)\]]$ "

alias sudo='sudo '

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

alias win='nvim'

alias g++='g++ -std=c++17 -g -pedantic-errors -Wall -Wextra -Weffc++ -Wconversion -Wsign-conversion -Wshadow -Werror'

export PATH=$PATH:~/Scripts

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
