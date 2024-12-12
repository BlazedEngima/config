alias config="cd \"$XDG_CONFIG_HOME\""
alias nvim="nvim.appimage"
alias n="nvim"
alias q="rlwrap -r $QHOME/l64/q"

function cdf -d "Navigate to directories using fzf"
  set selected $(find * -maxdepth 1 -type d 2>/dev/null | fzf \
    --reverse --border=rounded --cycle --height=50% \
    --header='Pick a directory to navigate to')
  [ -z $selected ]; and echo 'Nothing was selected :('; or cd "$selected"
end

function numfiles -d "Count the number of file in the directory"
  set -l num $(ls -A $argv | wc -l)
  [ -n $num ]; and echo "$num files in $argv"
end
