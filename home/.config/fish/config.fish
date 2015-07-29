# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Custom plugins and themes may be added to ~/.oh-my-fish/custom
# Plugins and themes can be found at https://github.com/oh-my-fish/
# Theme 'robbyrussell'
Plugin 'theme'
Plugin 'z'
Plugin 'peco'
Plugin 'bundler'
Plugin 'emoji-clock'
Plugin 'tmux'
Plugin 'ssh'
Plugin 'osx'
Plugin 'brew'
# Plugin 'better-alias'

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

test $TERM != "screen"; and exec tmux -2

