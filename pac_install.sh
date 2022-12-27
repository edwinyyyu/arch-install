#!/bin/bash

# Install packages
pacman -Syu
pacman -S - < "${1}"
