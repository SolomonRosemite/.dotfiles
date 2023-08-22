if status is-interactive
    # Commands to run in interactive sessions can go here
end

set usernames "{Jesse,solomon}"

# Open configurations
alias c.='n. && vim .'
alias cf='vim ~/.config/fish/config.fish'
alias cs='vim ~/.config/starship.toml'
alias cn='nn && vim .'
alias ck='nk && vim .'
alias ct="vim /mnt/c/Users/$usernames/AppData/Local/Packages/Microsoft.WindowsTerminal_*/LocalState/settings.json"
alias cw='nw && vim .'
alias cy='ny && vim .'

alias n.='cd ~/.dotfiles/'
alias nn='cd ~/.dotfiles/nvim/.config/nvim/'
alias nk="cd /mnt/c/Users/$usernames/.config/komorebi/"
alias nw="cd /mnt/c/Users/$usernames/win.dotfiles/"
alias ny="cd /mnt/c/Users/$usernames/.yasb/"

alias d='sudo docker'
alias dc='sudo docker compose'
alias dcu='sudo docker compose up'
alias dcud='sudo docker compose up -d'
alias dcd='sudo docker compose down'
alias dcl='sudo docker compose logs -f'

alias cc='cd (~/.dotfiles/scripts/.config/scripts/open_proj.sh --only-echo)'
alias c='cd (~/.dotfiles/scripts/.config/scripts/open_proj.sh --only-echo) && code .'
alias cat='bat'
alias copy='function __copy; cat $argv | clip.exe; end; __copy'
alias clip='clip.exe'
alias grep='rg'
alias l='exa -hl'
alias ls='exa'

alias nvm='fnm'
alias rm='echo -e "Woahh, you are using rm instead of r!\nBe careful..." && /usr/sbin/rm -i'
alias r='trash'

alias h="cd /mnt/c/Users/$usernames/"
alias home="cd /mnt/c/Users/$usernames/"

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
