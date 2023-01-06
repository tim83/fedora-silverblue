FROM ghcr.io/cgwalters/fedora-silverblue:37
# See https://pagure.io/releng/issue/11047 for final location

RUN rpm-ostree override remove firefox firefox-langpacks toolbox nautilus
RUN rpm-ostree install distrobox gnome-tweaks
RUN sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && systemctl enable rpm-ostreed-automatic.timer

# RUN systemctl enable flatpak-automatic.timer

RUN cd /etc/yum.repos.d/ && \
	curl -LO https://pkgs.tailscale.com/stable/fedora/tailscale.repo && \
	rpm-ostree install tailscale && \
	systemctl enable tailscaled

COPY repos/zerotier.repo /etc/yum.repos.d/zerotier.repo
# RUN rpm-ostree install zerotier-one && systemctl enable zerotier-one.service

RUN rm /usr/share/flatpak/fedora-flathub.filter
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# RUN flatpak install org.mozilla.firefox

RUN rpm-ostree cleanup -m
RUN ostree container commit
