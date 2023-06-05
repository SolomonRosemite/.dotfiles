# Dotfiles

## Installation

1. Clone this repo
2. Install [GNU Stow](https://www.gnu.org/software/stow/) and other dependencies (see Dockerfile in ansible-init) (TODO)
3. Run `ansible-init/pre_install.sh` to create symlink all dotfiles to your home directory (TODO)
4. Update the username in `ansible-init/playbook/ansible.yml`
5. Run `ansible-init/install.sh` to install all packages and initialize stuff using ansible.

## Test Installation using Docker

1. Cd into `ansible-init/docker-dotfiles-test`
1. Run `./build.sh && ./run.sh` to build and run the docker container


