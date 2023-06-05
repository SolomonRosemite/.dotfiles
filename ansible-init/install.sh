#!/bin/bash

echo "Checking if Nix is installed..."
nix --version
if ! [ $? -eq 0 ]; then
    echo "Nix does not seem to be installed but in needed."
    read -e -p "Should it be installed? [y/n]: " choice

    if [[ "$choice" == [Yy]* ]]; then
        echo "Installing Nix..."
        sh <(curl -L https://nixos.org/nix/install) --daemon --yes
        echo "Nix installed."
    else
        echo "I will take it as a no. Exiting..."
        exit 1
    fi
else 
    echo "Nix already installed. Skipping installation..."
fi

sudo ansible-galaxy install -r playbooks/requirements.yml --roles-path=/etc/ansible/roles
sudo ansible-playbook playbooks/ansible.yml

PATH=/nix/var/nix/profiles/default/bin/:$PATH
zsh
