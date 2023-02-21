 # Enable UA wifi
RUN update-crypto-policies --set legacy --no-reload

 # tpm + luks
RUN rpm-ostree install clevis clevis-luks clevis-dracut clevis-udisks2 clevis-systemd
RUN dracut -f --regenerate-all