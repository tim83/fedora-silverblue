 # Enable UA wifi
RUN update-crypto-policies --set legacy --no-reload

RUN rpm-ostree cleanup -m && ostree container commit