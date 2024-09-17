if status is-interactive
    # Commands to run in interactive sessions can go here
end

set win_user_path (readlink -e /mnt/c/Users/{solomon,Jesse}/ | head -1)
set h $win_user_path
set hd "$win_user_path/Donwloads"

# Open configurations
alias c.='n. && nvim . && cd -'
alias cb='nvim ~/.config/bat/config'
alias cf='nvim ~/.config/fish/config.fish'
alias cs='nvim ~/.config/starship.toml'
alias cn='nn && nvim . && cd -'
alias ck='nk && nvim . && cd -'
alias ct="nvim $win_user_path/AppData/Local/Packages/Microsoft.WindowsTerminal_*/LocalState/settings.json"
alias cw='nw && nvim . && cd -'
alias cws='nws && nvim . && cd -'
alias cy='ny && nvim . && cd -'

alias n.='cd ~/.dotfiles/'
alias nn='cd ~/.dotfiles/nvim/.config/nvim/'
alias nk="cd $win_user_path/.config/komorebi/"
alias nw="cd $win_user_path/.win.dotfiles/"
alias nd="cd /mnt/c/Users/Jesse/Pictures/Walli/.drawings"
alias nws="cd $win_user_path/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/"
alias ny="cd $win_user_path/.yasb/"

alias d='docker'
alias dp='docker ps'
alias ds='docker stop'
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

alias cc='cd (~/.dotfiles/scripts/.config/scripts/open_dir.sh "$HOME/personal" "$HOME/dev" "$HOME/work/services/" "$HOME/work/common/" "$HOME/work/ad-tech/") && [ -f package.json ] || cd src > /dev/null 2>&1 || true'

alias ffd='_fzf_search_directory'
alias ffh='_fzf_search_history'
alias ffp='_fzf_search_processes'

alias gs='git status'
alias gsw='git switch -'
alias gc='git_commit_or_git_checkout'
alias gco='git checkout'
alias gpl='git pull'
alias gp='git push'
alias gl='sh ~/.dotfiles/scripts/.config/scripts/git_log.sh -i'
alias gbc='sh ~/.dotfiles/scripts/.config/scripts/git_clear_branches.sh'

alias ga='git add'
alias gap='git add -p'
alias gaa='git add -A'
alias gdd='git diff'
alias gdc='git diff --cached'

alias a='~/.dotfiles/scripts/.config/scripts/authy.sh'
alias auth='~/.dotfiles/scripts/.config/scripts/authy.sh'
alias authy='~/.dotfiles/scripts/.config/scripts/authy.sh'
alias cat='bat'
alias clip='utf8clip.exe'
alias fj='~/.dotfiles/scripts/.config/scripts/format_json.sh'
alias grep='rg'
alias gtp='~/.dotfiles/scripts/.config/scripts/increment_tag_push.sh'
alias jwt='~/.dotfiles/scripts/.config/scripts/decode_jwt.sh'
alias l='exa -hl'
alias la='exa -hla'
alias lt='exa --tree'
alias less='bat --paging=always'
alias task='go-task'

alias nvm='fnm'
alias r='trash'

alias hd="cd $win_user_path/Downloads"

alias s='source ~/.config/fish/config.fish'
alias take 'function __take; mkdir -p $argv; cd $argv; end; __take'

alias v='/usr/sbin/nvim . -c "Oil ."'
alias vv='/usr/sbin/nvim . -c "Oil ." -c "Codeium Disable"'

alias wts="sh $win_user_path/.win.dotfiles/scripts/win-terminal-background.sh --select"

alias za='zellij attach -c'
alias ze='zellij'

set fish_greeting ""
set fish_user_paths "$HOME/.nix-profile/bin/" $fish_user_paths
set fish_user_paths "$HOME/.go/bin/" $fish_user_paths
set fish_user_paths "$HOME/.local/bin/" $fish_user_paths
set fish_user_paths "$HOME/.cargo/bin/" $fish_user_paths
set -gx GOPATH "$HOME/.go/"

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

starship init fish | source

# opam configuration
source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
bash -c 'syncthing &>/dev/null &'
export FZF_DEFAULT_OPTS='--layout=reverse'

# functions
function git_commit_or_git_checkout
    set -l cmd "git commit"
    set -l found_m false
    for arg in $argv
        if test "$arg" = "-m"
            set cmd "$cmd -m"
            set found_m true
        else
            set cmd "$cmd \"$arg\""
        end
    end

    if test "$found_m" = "false"
      sh ~/.dotfiles/scripts/.config/scripts/git_checkout.sh
    else
        eval $cmd
    end
end
