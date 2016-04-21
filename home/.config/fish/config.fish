# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/kceejp/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/kceejp/.config/omf"
set -g Z_SCRIPT_PATH (brew --prefix)/etc/profile.d/z.sh

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# set fish_greeting to null, so that the message won't appear
set fish_greeting

# Env values
set -gx LANG ja_JP.UTF-8

set -gx EDITOR vi
set -gx PAGER  less

### homesick
set -gx HOMESICK_DOTFILES $HOME/.homesick/repos/dotfiles
set -gx HOMESICK_DOTFILES_HOME $HOME/.homesick/repos/dotfiles/home

### vim
set -gx DOTVIM_DIR $HOMESICK_DOTFILES_HOME/.vim

### go
set -gx GOPATH ~/go

### PATH

set -gx PATH /usr/bin $PATH
set -gx PATH /usr/sbin $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH /usr/local/sbin $PATH
set -gx PATH $HOME/local/bin $PATH
set -gx PATH $HOME/.rbenv/bin $PATH
set -gx PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1
set -gx PATH $GOPATH/bin $PATH # go
set -gx PATH /usr/local/heroku/bin $PATH # heroku toolbelt

### npm
set -gx PATH /usr/local/share/npm/bin $PATH
set -gx PATH $HOME/.npm/bin $PATH
set -gx NODE_PATH $HOME/.npm/libraries $NODE_PATH
set -gx MANPATH $HOME/.npm/man $MANPATH
# set -gx PATH eval "npm bin" $PATH

### boot2docker
#if [ "`boot2docker status`" = "running" ]; then
#    $(boot2docker shellinit)
#fi

alias vi "vim -p"

#test $TERM != "screen"; and exec tmux -2

#set -gx fish_key_bindings

function peco
    command peco --layout=bottom-up $argv
end

# https://gist.github.com/patorash/6e8b33efd4f67690f016
function peco_delete_branch
  git branch | peco | read line
  set -l branch_name (echo $line | awk '{print $1}')
  if test "$branch_name" != "*"
    git branch -d $branch_name
  else
    echo "Can't delete current branch."
  end
end

# https://gist.github.com/patorash/6e8b33efd4f67690f016
function peco_kill
  if set -q $argv
    ps aux | peco | read proc
  else
    ps aux | peco --query $argv | read proc
  end
  if test -n "$proc"
    set -l pid (echo $proc | awk '{print $2}')
    echo "kill pid: $pid. [$proc]"
    kill $pid
  end
  set -e proc
end

# https://gist.github.com/patorash/6e8b33efd4f67690f016
function peco_select_history
  if set -q $argv
    history | peco | read line; commandline $line
  else
    history | peco --query $argv | read line; commandline $line
  end
  set -e line
end

# https://gist.github.com/patorash/6e8b33efd4f67690f016
function peco_select_history
  if set -q $argv
    history | peco | read line; commandline $line
  else
    history | peco --query $argv | read line; commandline $line
  end
  set -e line
end

# http://qiita.com/unlovingly/items/99999271df7eea7bc953
# https://github.com/yoshiori/fish-peco_select_ghq_repository/blob/master/peco_select_ghq_repository.fish
function peco_select_ghq_repository
  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  ghq list -p | peco $peco_flags | read line

  if [ $line ]
    cd $line
    commandline -f repaint
  end
end

fish_default_key_bindings

function fish_user_key_bindings
    bind \c] peco_select_ghq_repository
    bind \cr peco_select_history
    bind \ck peco_kill
end
