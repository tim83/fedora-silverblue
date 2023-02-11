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

# remote access
RUN rpm-ostree install mosh
RUN systemctl enable sshd.service

# etc
COPY etc/ssh /etc/

# cli tools
RUN rpm-ostree install htop glances vim zsh borgbackup at watchdog

# firewall
RUN sed -i 's/DefaultZone.*/DefaultZone=public/' /etc/firewalld/firewalld.conf

COPY firstboot/firstboot.service /etc/systemd/system
RUN systemctl enable firstboot

COPY firstboot/firstboot.sh /etc/firstboot/
COPY firstboot/scripts.d/common*.sh /etc/firstboot/scripts.d/
