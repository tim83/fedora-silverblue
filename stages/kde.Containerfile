RUN rpm-ostree install kde-partitionmanager
RUN rpm-ostree cleanup -m && ostree container commit
