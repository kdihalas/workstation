#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1
wget https://download.docker.com/linux/fedora/docker-ce.repo -O /etc/yum.repos.d/docker-ce.repo
# remove Firefox
rpm-ostree override remove firefox firefox-langpacks
# this installs a package from fedora repos
rpm-ostree install tmux distrobox gnome-tweaks
rpm-ostree install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
rpm-ostree install zsh vim

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File
