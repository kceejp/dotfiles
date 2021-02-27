# Path to Oh My Fish install.
#set -gx OMF_PATH $HOME/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "$HOME/.config/omf"
set -g Z_SCRIPT_PATH (brew --prefix)/etc/profile.d/z.sh

# Load oh-my-fish configuration.
#source $OMF_PATH/init.fish

# set fish_greeting to null, so that the message won't appear
set fish_greeting

starship init fish | source

#set fish_theme fishface

# Env values
set -gx LANG ja_JP.UTF-8

set -gx EDITOR vi
set -gx PAGER  less

set -gx CHEAT_USE_FZF true

### homesick
set -gx HOMESICK_DOTFILES $HOME/.homesick/repos/dotfiles
set -gx HOMESICK_DOTFILES_HOME $HOME/.homesick/repos/dotfiles/home

set -gx PATH /opt/homebrew/bin $PATH

set -gx LDFLAGS "-L/opt/homebrew/opt/openssl@1.1/lib" $LDFLAGS
set -gx CPPFLAGS "-I/opt/homebrew/opt/openssl@1.1/include" $CPPFLAGS
set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/openssl@1.1/lib/pkgconfig" $PKG_CONFIG_PATH

set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=/opt/homebrew/opt/openssl@1.1"

set -gx LDFLAGS "-L/opt/homebrew/opt/libffi/lib" $LDFLAGS
set -gx CPPFLAGS "-I/opt/homebrew/opt/libffi/include" $CPPFLAGS
set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/libffi/lib/pkgconfig" $PKG_CONFIG_PATH

set -gx CONFIGURE_OPTS "--with-openssl="(brew --prefix openssl@1.1)

set -gx LDFLAGS "-L/opt/homebrew/opt/readline/lib" $LDFLAGS
set -gx CPPFLAGS "-I/opt/homebrew/opt/readline/include" $CPPFLAGS
set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/readline/lib/pkgconfig" $PKG_CONFIG_PATH

### vim
set -gx DOTVIM_DIR $HOMESICK_DOTFILES_HOME/.vim

### go
set -gx GOPATH $HOME/go

### PATH
set -gx PATH /usr/bin $PATH
set -gx PATH /usr/sbin $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH /usr/local/sbin $PATH
set -gx PATH $HOME/local/bin $PATH
set -gx PATH $GOPATH/bin $PATH # go
#set -gx PATH /usr/local/heroku/bin $PATH # heroku toolbelt

### npm
set -gx PATH $PATH `npm bin -g`
set -gx PATH /usr/local/share/npm/bin $PATH
set -gx PATH $HOME/.npm/bin $PATH
set -gx NODE_PATH $HOME/.npm/libraries $NODE_PATH
set -gx MANPATH $HOME/.npm/man $MANPATH
# set -gx PATH eval "npm bin" $PATH

# Android
set -gx PATH $HOME/Library/Android/sdk/platform-tools $PATH

### anyenv
set -x PATH $HOME/.anyenv/bin $PATH
anyenv init - fish | source

### thefuck
thefuck --alias | source

alias vi "atom"
alias cat "bat"
alias ls "exa --icons"
alias tree "exa --icons --tree"

#test $TERM != "screen"; and exec tmux -2

#set -gx fish_key_bindings

function peco
    command peco --layout=bottom-up $argv
end

function save_history --on-event fish_preexec
    history --save
end

fish_default_key_bindings

function fish_user_key_bindings
    bind \c] peco_select_ghq_repository
    bind \cr peco_select_history
    bind \ck peco_kill
    bind \e\e 'thefuck-command-line'

    # 独自
    bind \cb fzf_git_branches
    bind \cf fzf_cheats
end

function fzf_cheats
  if test (count $argv) = 0
    set fzf_flags --height 50%
  else
    set fzf_flags --height 50% --query "$argv"
  end

  set fzf_preview --preview 'cheat personal | sed \'/^$/d\' | grep \'^#\' | sed -n (expr {n} + 1)p'

  cheat personal | sed '/^$/d' | grep -v '^#' | fzf $fzf_flags --prompt 'COMMAND>' $fzf_preview | read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end

function fzf_git_branches
  if test (count $argv) = 0
    set fzf_flags --height 50%
  else
    set fzf_flags --height 50% --query "$argv"
  end

  set fzf_preview --preview "git log --color=always {}"

  git branch -a | tr -d " " | fzf $fzf_flags --prompt "CHECKOUT BRANCH>" $fzf_preview | head -n 1 | sed -e "s/^\*\s*//g" | perl -pe "s/remotes\/origin\///g" | read foo

  if [ $foo ]
    commandline "git checkout $foo"
  else
    commandline ''
  end
end

# Load anyenv automatically by adding
# the following to ~/.config/fish/config.fish:
# status --is-interactive; and source (anyenv init -|psub)
# status --is-login; and status --is-interactive; and exec byobu-launcher
set -gx PATH "/opt/homebrew/opt/openssl@1.1/bin" $PATH
set -gx PATH "/opt/homebrew/opt/readline/bin" $PATH
set -gx PATH "/opt/homebrew/opt/readline/bin" $PATH
