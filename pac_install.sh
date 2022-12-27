#!/bin/bash

# Install packages
pacman -Syu
pacman -S - < ./package_lists/packages_official
