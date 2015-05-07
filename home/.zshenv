### environment
export LANG=ja_JP.UTF-8

### http://d.hatena.ne.jp/littlebuddha/20090216/1234785251
export MAILCHECK=0

### homesick
export HOMESICK_DOTFILES="$HOME/.homesick/repos/dotfiles"
export HOMESICK_DOTFILES_HOME="$HOME/.homesick/repos/dotfiles/home"

### vim
export DOTVIM_DIR="$HOMESICK_DOTFILES_HOME/.vim"

### go
export GOPATH=~/go

### ZSH
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

### PATH

export PATH=/usr/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/local/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH" # rbenv
eval "$(rbenv init -)"
export PATH=$PATH:$GOPATH/bin # go
export PATH="/usr/local/heroku/bin:$PATH" # heroku toolbelt

### npm
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH=$HOME/.npm/bin:$PATH
export NODE_PATH=$HOME/.npm/libraries:$NODE_PATH
export MANPATH=$HOME/.npm/man:$MANPATH
export PATH="$(npm bin):$PATH"

### boot2docker
if [ "`boot2docker status`" = "running" ]; then
    $(boot2docker shellinit)
fi
