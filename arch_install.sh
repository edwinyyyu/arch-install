#!/bin/bash

# Select the installation drive
efibootmgr
lsblk
echo -n "Express installation drive as \"/dev/sdX\": "
read drive

# System configuration
echo -n "Hostname: "
read hostname
echo -n "User: "
read user

# Connect to the internet
iwctl
ping archlinux.org

# Update the system clock
timedatectl set-ntp true

# Partition the drive
cfdisk -z "${drive}"

# Format the partitions
mkfs.fat -F 32 "${drive}1"
mkfs.ext4 "${drive}2"

# Mount the file systems
mount "${drive}2" /mnt
mkdir /mnt/boot
mount "${drive}1" /mnt/boot

# Install essential packages
pacstrap /mnt base base-devel linux linux-firmware git neovim ripgrep networkmanager nss-mdns ntp tlp tlp-rdw cups efibootmgr intel-ucode xdg-user-dirs

# Fstab
genfstab -t PARTUUID /mnt >> /mnt/etc/fstab
sed -i s/relatime/noatime/ /mnt/etc/fstab

# Chroot
cp arch_chroot.sh /mnt
arch-chroot /mnt ./arch_chroot.sh "${drive}" "${hostname}" "${user}" 
rm /mnt/arch_chroot.sh
