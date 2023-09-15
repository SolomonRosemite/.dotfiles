if status is-interactive
    # Commands to run in interactive sessions can go here
end

set win_user_path (readlink -e /mnt/c/Users/{solomon,Jesse}/ | head -1)

# Open configurations
alias c.='n. && vim . && cd -'
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

alias d='sudo docker'
alias dc='sudo docker compose'
alias dcu='sudo docker compose up'
alias dcud='sudo docker compose up -d'
alias dcd='sudo docker compose down'
alias dcl='sudo docker compose logs -f'

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

alias h="cd $win_user_path/"
alias home="cd $win_user_path/"

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
