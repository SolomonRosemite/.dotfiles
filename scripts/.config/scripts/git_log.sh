#!/usr/bin/env bash
# Credit: https://github.com/exosyphon/dotfiles/blob/5d6e87a583ff1ac9d244daed26d379627cd04592/scripts/fshow.sh

# Fuzzy search over Git commits
# Enter will view the commit
# Ctrl-o will checkout the selected commit
SHELL=bash
function fshow() {
  formatted_log=""
  EMPTYCHAR="‎"
  DELIMITER="‣"

  while IFS=$DELIMITER read -r prefix tag suffix; do
    if [[ $tag == *"tag:"* ]]; then
      tag="$EMPTYCHAR${tag/ /} "
    else
      tag="$tag$EMPTYCHAR"
    fi
    log="$prefix$tag$suffix"
    formatted_log+=$'\n'"$log"
  done <<< "$(git log --color=always --format="%C(auto)%h$EMPTYCHAR%C(black)%C(bold)(%cr)%C(reset)$DELIMITER%C(auto)%d$DELIMITER%C(reset)%C(auto)%s %C(dim white)- %an %C(reset)" "$@")"

  # remove first line
  formatted_log="${formatted_log#*$'\n'}"

  echo -e "$formatted_log" | fzf --delimiter="$EMPTYCHAR" --nth=1,3.. --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort --preview \
         'f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show --color=always $1 ; }; f {}' \
      --header "enter to view, ctrl-o to checkout" \
      --bind "q:abort,ctrl-f:preview-page-down,ctrl-b:preview-page-up" \
      --bind "ctrl-o:become:(echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | xargs git checkout)" \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF" --preview-window=right:50%
}
fshow "$@"
