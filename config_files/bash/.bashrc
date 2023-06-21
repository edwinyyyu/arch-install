#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="[\[$(tput setaf 10)\]\u\[$(tput setaf 8)\]@\[$(tput setaf 10)\]\h \[$(tput setaf 12)\]\W\[$(tput sgr0)\]]$ "

alias sudo='sudo '

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

alias win='nvim -i NONE'

alias g3x='g++ -std=c++17 -fsanitize=address -fsanitize=undefined -fno-omit-frame-pointer -fsanitize=bounds -Wall -Wextra -Wno-sign-compare -Werror=return-type'

export PATH=$PATH:~/Scripts
