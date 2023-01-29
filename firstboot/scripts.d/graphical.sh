#! /bin/bash

#
# Flatpaks
#

# Install flathub repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# Install flatpaks
flatpak install --noninteractive flathub \
        org.mozilla.firefox \
        org.gimp.GIMP \
        com.github.tchx84.Flatseal
