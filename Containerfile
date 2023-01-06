FROM ghcr.io/cgwalters/fedora-silverblue:37
# See https://pagure.io/releng/issue/11047 for final location

RUN rpm-ostree override remove firefox firefox-langpacks toolbox
RUN rpm-ostree install distrobox gnome-tweaks
RUN sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf
RUN systemctl enable rpm-ostreed-automatic.timer # flatpak-automatic.timer

RUN cd /etc/yum.repos.d/ && \
	curl -LO https://pkgs.tailscale.com/stable/fedora/tailscale.repo && \
	rpm-ostree install tailscale && \
	systemctl enable tailscaled

RUN rpm-ostree cleanup -m
RUN ostree container commit
