#!/bin/bash
dir=$(dirname $(realpath $0))

sudo true
scp multipass-control:~/traefik-certs/multipass.local.crt $dir
sudo mv $dir/multipass.local.crt /etc/pki/ca-trust/source/anchors/
sudo update-ca-trust
