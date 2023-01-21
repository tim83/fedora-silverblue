RUN rpm-ostree install gnome-tweaks

RUN rpm-ostree cleanup -m && ostree container commit