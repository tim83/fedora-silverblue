RUN rpm-ostree override remove toolbox
RUN rpm-ostree install distrobox btrfsmaintenance

RUN systemctl enable btrfs-balance.timer btrfs-scrub.timer
RUN sed -i 's/BTRFS_BALANCE_MOUNTS.*/BTRFS_BALANCE_MOUNTPOINTS=auto/' /etc/sysconfig/btrfsmaintenance
RUN sed -i 's/BTRFS_SCRUB_MOUNTS.*/BTRFS_SCUB_MOUNTPOINTS=auto/' /etc/sysconfig/btrfsmaintenance

RUN sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && systemctl enable rpm-ostreed-automatic.timer

RUN cd /etc/yum.repos.d/ && \
	curl -LO https://pkgs.tailscale.com/stable/fedora/tailscale.repo
RUN rpm-ostree install tailscale && \
	systemctl enable tailscaled

COPY repos/zerotier.repo /etc/yum.repos.d/zerotier.repo
 # RUN rpm-ostree install zerotier-one && systemctl enable zerotier-one.service

RUN rpm-ostree cleanup -m && ostree container commit
