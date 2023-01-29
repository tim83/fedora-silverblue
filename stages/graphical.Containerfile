 # RUN rpm-ostree override remove firefox firefox-langpacks 
RUN sed -i "2a\\NotShowIn=GNOME;KDE" /usr/share/applications/firefox.desktop && update-desktop-database
RUN rpm-ostree install firewall-config
