#! /bin/bash

echo "Opening browser with the acces token page"
xdg-open https://github.com/settings/personal-access-tokens/476664

read -p "GitHub access token: " gh_token

certificate_file="./cosign.pub"
if [ ! -e $certificate_file ] ; then 
    touch $certificate_file
fi

podman run \
    -e GITHUB_TOKEN=$gh_token \
    -e COSIGN_PASSWORD=$(pwgen -nsy 64 -N 1) \
    -v $certificate_file:/home/nonroot/cosign.pub:z,rw \
    --userns="keep-id" \
    gcr.io/projectsigstore/cosign \
    generate-key-pair github://tim83/fedora-silverblue

chmod 620 $certificate_file