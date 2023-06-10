#!/bin/bash

echo "Checking if Nix is installed..."
nix --version
if ! [ $? -eq 0 ]; then
    echo "Nix does not seem to be installed."
    echo "Installing Nix..."
    sh <(curl -L https://nixos.org/nix/install) --no-daemon --yes
    echo "Nix installed."
else 
    echo "Nix already installed. Skipping installation..."
fi

# sudo ansible-galaxy install -r playbooks/requirements.yml --roles-path=/etc/ansible/roles
sudo ansible-playbook -v playbooks/ansible.yml

PATH=$HOME/.nix-profile/bin:$PATH/:$PATH
fish
