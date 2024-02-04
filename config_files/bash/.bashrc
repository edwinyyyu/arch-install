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

alias lvenv="ls ~/.venvs"
alias dvenv="deactivate"

cvenv() {
  if (( $# == 1 )); then
    venvpath=~/.venvs/$1
    if [[ ! -d $venvpath && ! -f $venvpath ]]; then
      python -m venv $venvpath
    else
      echo "Cannot create venv: name already exists"
    fi
  else
    echo "Cannot create venv: 1 argument expected, $# received"
  fi
}

avenv() {
  if (( $# == 1 )); then
    activatevenvpath=~/.venvs/$1/bin/activate
    if [[ -f $activatevenvpath ]]; then
      source $activatevenvpath
    else
      echo "Cannot activate venv: venv does not exist"
    fi
  else
    echo "Cannot activate venv: 1 argument expected, $# received"
  fi
}

rvenv() {
  if (( $# == 1 )); then
    venvpath=~/.venvs/$1
    if [[ -d $venvpath ]]; then
      rm -rf $venvpath
    else
      echo "Cannot remove venv: venv does not exist"
    fi
  else
    echo "Cannot remove venv: 1 argument expected, $# received"
  fi
}

export PATH=$PATH:~/Scripts

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
