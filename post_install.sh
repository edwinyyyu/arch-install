#!/bin/bash

mkdir -p ~/AUR/
mkdir -p ~/Games/
mkdir -p ~/Projects/
mkdir -p ~/Scripts/

# Bash
cp .config_files/bash/.bash_profile ~/.bash_profile
cp .config_files/bash/.bashrc ~/.bashrc

# Alacritty
mkdir -p ~/.config/alacritty/
cp ./config_files/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# SwayWM
mkdir -p ~/.config/sway/
cp ./config_files/sway/config ~/.config/sway/config

# Git
cp ./config_files/git/.gitconfig ~/.gitconfig

# Neovim
git clone https://github.com/edwinyyyu/nvim-config.git ~/.config/nvim/

# Firefox
mkdir -p /usr/lib/firefox/defaults/pref/
cp ./config_files/firefox/autoconfig.js /usr/lib/firefox/defaults/pref/autoconfig.js
cp ./config_files/firefox/firefox.cfg /usr/lib/firefox/firefox.cfg

# Thunar
mkdir -p ~/.config/xfce4/
echo "TerminalEmulator=alacritty" > ~/.config/xfce4/helpers.rc

# Undervolt
nvim -i NONE /etc/intel-undervolt.conf
intel-undervolt apply
systemctl enable intel-undervolt

# Miscellaneous
cp ./config_files/misc/background.jpg /usr/share/backgrounds/background.jpg
cp ./config_files/misc/clean ~/Scripts/clean
cp ./config_files/misc/Default.ott ~/Templates/Default.ott
