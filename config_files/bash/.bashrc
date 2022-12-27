#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias sudo='sudo '

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias win='nvim -i NONE'

alias g3x='g++ -std=c++17 -fsanitize=address -fsanitize=undefined -fno-omit-frame-pointer -fsanitize=bounds -Wall -Wextra -Wno-sign-compare -Werror=return-type'

export PATH=$PATH:~/Scripts
