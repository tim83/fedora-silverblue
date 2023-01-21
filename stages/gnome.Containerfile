RUN rpm-ostree install gnome-tweaks
RUN rm /usr/share/flatpak/fedora-flathub.filter

RUN rpm-ostree cleanup -m && ostree container commit