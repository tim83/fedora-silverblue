RUN sed -i "2a\\NotShowIn=GNOME;KDE" /usr/share/applications/firefox.desktop && update-desktop-database
RUN sed -i 's/UsePercentageForPolicy.*/UsePercentageForPolicy=false/' /etc/UPower/UPower.conf
 # RUN sed -i 's/GRUB_SAVEDEFAULT.*/GRUB_SAVEDEFAULT=true/' /etc/default/grub
 # RUN sed -i 's/GRUB_DEFAULT.*/GRUB_DEFAULT=saved/' /etc/default/grub
 # RUN sed -i 's/GRUB_DISABLE_OS_PROBER.*/GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub

RUN systemctl enable flatpak-system-update.timer

RUN rpm-ostree install firewall-config btrfs-assistant wl-clipboard NetworkManager-wifi

COPY firstboot/scripts.d/graphical*.sh /etc/firstboot/scripts.d/