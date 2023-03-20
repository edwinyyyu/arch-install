#!/bin/bash

mkdir -p ~/AUR/
mkdir -p ~/Games/
mkdir -p ~/Projects/
mkdir -p ~/Scripts/

# Bash
cp ./config_files/bash/.bash_profile ~/.bash_profile
cp ./config_files/bash/.bashrc ~/.bashrc

# Alacritty
mkdir -p ~/.config/alacritty/
cp ./config_files/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# SwayWM
mkdir -p ~/.config/sway/
cp ./config_files/sway/config ~/.config/sway/config
sudo cp ./config_files/sway/i3status.conf /etc/i3status.conf

# Git
cp ./config_files/git/.gitconfig ~/.gitconfig

# Neovim
git clone https://github.com/edwinyyyu/nvim-config.git ~/.config/nvim/

# Mako
mkdir -p ~/.config/mako/
cp ./config_files/mako/config ~/.config/mako/config

# Firefox
sudo mkdir -p /usr/lib/firefox/defaults/pref/
sudo cp ./config_files/firefox/autoconfig.js /usr/lib/firefox/defaults/pref/autoconfig.js
sudo cp ./config_files/firefox/firefox.cfg /usr/lib/firefox/firefox.cfg

# Thunar
mkdir -p ~/.config/xfce4/
echo "TerminalEmulator=alacritty" > ~/.config/xfce4/helpers.rc

# Undervolt
sudo nvim -i NONE /etc/intel-undervolt.conf
sudo intel-undervolt apply
sudo systemctl enable intel-undervolt

# VS Code
cp ./config_files/code/code-flags.conf ~/.config/

# Miscellaneous
sudo cp ./config_files/misc/background.jpg /usr/share/backgrounds/background.jpg
cp ./config_files/misc/clean ~/Scripts/clean
cp ./config_files/misc/Default.ott ~/Templates/Default.ott

gsettings set org.x.editor.preferences.editor restore-cursor-position false
