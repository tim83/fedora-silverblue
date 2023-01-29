RUN sed -i "2a\\NotShowIn=GNOME;KDE" /usr/share/applications/firefox.desktop && update-desktop-database
RUN rpm-ostree install firewall-config btrfs-assistant

COPY firstboot/scripts.d/graphical*.sh /etc/firstboot/scripts.d/