if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Open configurations
alias c.='cd ~/.dotfiles/ && vim .'
alias cf='vim ~/.config/fish/config.fish'
alias cs='vim ~/.config/starship.toml'
alias cn='cd ~/.config/nvim/ && vim .'
alias ck='cd /mnt/c/Users/Jesse/.config/komorebi/ && vim .'
alias ct='vim /mnt/c/Users/Jesse/AppData/Local/Packages/Microsoft.WindowsTerminal_*/LocalState/settings.json'
alias cw='cd /mnt/c/Users/Jesse/win.dotfiles/ && vim .'
alias cy='cd /mnt/c/Users/Jesse/.yasb/ && vim .'

alias d='sudo docker'
alias dc='sudo docker compose'
alias dcu='sudo docker compose up'
alias dcud='sudo docker compose up -d'
alias dcd='sudo docker compose down'
alias dcl='sudo docker compose logs -f'

alias cc='~/.dotfiles/scripts/.config/scripts/open_proj.sh'
alias c='cd (~/.dotfiles/scripts/.config/scripts/open_proj.sh --only-echo) && code . && cd -'
alias cat='bat'
alias clip='clip.exe'
alias grep='rg'
alias l='exa -hl'
alias ls='exa'

alias nvm='fnm'
alias rm='echo -e "Woahh, you are using rm instead of r!\nBe careful..." && /usr/sbin/rm -i'
alias r='trash'

alias h='cd /mnt/c/Users/Jesse/'
alias home='cd /mnt/c/Users/Jesse/'

alias s='source ~/.config/fish/config.fish'
alias take 'function __take; mkdir -p $argv; cd $argv; end; __take'

alias vim='/usr/sbin/nvim'
alias v='/usr/sbin/nvim .'

set fish_greeting ""
set fish_user_paths "$HOME/.nix-profile/bin/" $fish_user_paths
set fish_user_paths "$HOME/go/bin/" $fish_user_paths
set fish_user_paths "$HOME/.local/bin/" $fish_user_paths
set fish_user_paths "$HOME/.cargo/bin/" $fish_user_paths
set -gx GOPATH "$HOME/go/"

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

starship init fish | source
