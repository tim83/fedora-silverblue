#! /bin/bash

#
# Packages
#

# Zerotier
rpm-ostree install --assumeyes --allow-inactive --idempotent --apply-live zerotier-one
systemctl enable zerotier-one

