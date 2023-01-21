RUN rpm-ostree override remove firefox firefox-langpacks 

 # RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
 # RUN flatpak install org.mozilla.firefox

RUN rpm-ostree cleanup -m && ostree container commit