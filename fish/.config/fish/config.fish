if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias cf='vim ~/.config/fish/config.fish'
alias cs='vim ~/.config/starship.toml'
alias cn='cd ~/.config/nvim/ && vim .'
alias ck='cd /mnt/c/Users/TestUser/.config/komorebi/ && vim .'
alias cw='cd /mnt/c/Users/TestUser/win.dotfiles/ && vim .'
alias cy='cd /mnt/c/Users/TestUser/.yasb/ && vim .'

alias d='sudo /usr/sbin/docker'
alias dc='sudo /usr/sbin/docker compose'
alias dcu='sudo /usr/sbin/docker compose up'
alias dcud='sudo /usr/sbin/docker compose up -d'
alias dcd='sudo /usr/sbin/docker compose down'
alias dcl='sudo /usr/sbin/docker compose logs -f'
alias docker='sudo /usr/sbin/docker'

alias nvm='fnm'

alias h='cd /mnt/c/Users/TestUser/'
alias home='cd /mnt/c/Users/TestUser/'

alias vim='/usr/sbin/nvim'

set fish_greeting ""
set fish_user_paths "$HOME/.nix-profile/bin/" $fish_user_paths
set -gx GOPATH "$HOME/.local/share/pnpm"

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
# set -gx PNPM_HOME "/home/solomon/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

starship init fish | source
