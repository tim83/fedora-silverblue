RUN rpm-ostree override remove firefox firefox-langpacks 
RUN rpm-ostree install firewall-config

RUN rpm-ostree cleanup -m && ostree container commit
