if status is-interactive
    # Commands to run in interactive sessions can go here
end

set win_user_path (readlink -e /mnt/c/Users/{solomon,Jesse}/ | head -1)
set h $win_user_path
set hd $win_user_path

# Open configurations
alias c.='n. && vim . && cd -'
alias cb='vim ~/.config/bat/config'
alias cf='vim ~/.config/fish/config.fish'
alias cs='vim ~/.config/starship.toml'
alias cn='nn && vim . && cd -'
alias ck='nk && vim . && cd -'
alias ct="vim $win_user_path/AppData/Local/Packages/Microsoft.WindowsTerminal_*/LocalState/settings.json"
alias cw='nw && vim . && cd -'
alias cy='ny && vim . && cd -'

alias n.='cd ~/.dotfiles/'
alias nn='cd ~/.dotfiles/nvim/.config/nvim/'
alias nk="cd $win_user_path/.config/komorebi/"
alias nw="cd $win_user_path/win.dotfiles/"
alias ny="cd $win_user_path/.yasb/"

alias d='docker'
alias dp='docker ps'
alias dr='docker remove'

alias dc='docker compose'
alias dcu='docker compose up'
alias dcud='docker compose up -d'
alias dcd='docker compose down'
alias dcl='docker compose logs -f'
alias dclf='docker compose logs -f'

alias dv='docker volume'
alias dvl='docker volume ls'
alias dvr='docker volume rm'

alias cc='cd (~/.dotfiles/scripts/.config/scripts/open_proj.sh --only-echo) && cd src > /dev/null 2>&1'
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

alias d="cd $win_user_path/"
alias hd="cd $win_user_path/Downloads"

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
