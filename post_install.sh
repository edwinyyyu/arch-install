#!/bin/bash

mkdir -p ~/AUR/
mkdir -p ~/Games/
mkdir -p ~/Projects/
mkdir -p ~/Scripts/

# Bash
ln ./config_files/bash/.bash_profile ~/.bash_profile
ln ./config_files/bash/.bashrc ~/.bashrc

# Alacritty
mkdir -p ~/.config/alacritty/
ln ./config_files/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# SwayWM
mkdir -p ~/.config/sway/
ln ./config_files/sway/config ~/.config/sway/config
sudo ln ./config_files/sway/i3status.conf /etc/i3status.conf

# Git
ln ./config_files/git/.gitconfig ~/.gitconfig

# Neovim
git clone https://github.com/edwinyyyu/nvim-config.git ~/.config/nvim/

# Mako
mkdir -p ~/.config/mako/
ln ./config_files/mako/config ~/.config/mako/config

# Firefox
sudo mkdir -p /usr/lib/firefox/defaults/pref/
sudo ln ./config_files/firefox/autoconfig.js /usr/lib/firefox/defaults/pref/autoconfig.js
sudo ln ./config_files/firefox/firefox.cfg /usr/lib/firefox/firefox.cfg

# Thunar
mkdir -p ~/.config/xfce4/
echo "TerminalEmulator=alacritty" > ~/.config/xfce4/helpers.rc

# Undervolt
sudo nvim -i NONE /etc/intel-undervolt.conf
sudo intel-undervolt apply
sudo systemctl enable intel-undervolt.service

# VS Code
ln ./config_files/code/code-flags.conf ~/.config/

# Docker
sudo systemctl enable docker.service

# Miscellaneous
sudo cp ./config_files/misc/background.jpg /usr/share/backgrounds/background.jpg
ln ./config_files/misc/clean ~/Scripts/clean
cp ./config_files/misc/Default.ott ~/Templates/Default.ott

touch docdata
mv docdata ~/.local/share/okular/

gsettings set org.x.editor.preferences.editor restore-cursor-position false
