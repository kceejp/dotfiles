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
#fish_user_key_bindings

function fish_user_key_bindings
    bind \cp peco_select_history
end
function peco
    command peco --layout=bottom-up $argv
end
