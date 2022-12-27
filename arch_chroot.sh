#!/bin/bash

drive=${1}
hostname=${2}
user=${3}

# Time zone
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
hwclock --systohc

# Localization
sed -i s/'#en_US.UTF-8 UTF-8'/'en_US.UTF-8 UTF-8'/ /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# Network configuration
echo "${hostname}" > /etc/hostname
echo -e "127.0.0.1\tlocalhost" >> /etc/hosts
echo -e "::1\t\tlocalhost" >> /etc/hosts
echo -e "127.0.1.1\t${hostname}" >> /etc/hosts

sed -i s/'mymachines resolve'/'mymachines mdns_minimal [NOTFOUND=return] resolve'/ /etc/nsswitch.conf

systemctl enable NetworkManager.service
systemctl start NetworkManager.service

systemctl mask systemd-resolved.service
systemctl enable avahi-daemon.service
systemctl start avahi-daemon.service

# Clock synchronization
systemctl enable ntpd.service

# CUPS
systemctl enable cups.socket

# Power management
sed -i s/'#START_CHARGE_THRESH_BAT0=75'/'START_CHARGE_THRESH_BAT0=0'/ /etc/tlp.conf
sed -i s/'#STOP_CHARGE_THRESH_BAT0=80'/'STOP_CHARGE_THRESH_BAT0=60'/ /etc/tlp.conf

systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket
systemctl enable NetworkManager-dispatcher.service
systemctl enable tlp.service
tlp start

# Swappiness
echo "vm.swappiness=0" > /etc/sysctl.d/99-swappiness.conf

# Root password
passwd

# EFISTUB
for i in {0..9}; do
    efibootmgr -b "000${i}" -B
done

efibootmgr --disk "${drive}" --part 1 --create --label "Arch Linux" --loader /vmlinuz-linux --unicode "root=PARTUUID=$(blkid -s PARTUUID -o value ${drive}2) rw initrd=\intel-ucode.img initrd=\initramfs-linux.img" --verbose

# Add user
useradd -m -g users -G wheel "${user}"
xdg-user-dirs-update

# User password
passwd "${user}"

# Sudoers
EDITOR="nvim -i NONE" visudo
