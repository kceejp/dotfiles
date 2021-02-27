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
set -U LANG ja_JP.UTF-8
set -U LC_ALL ja_JP.UTF-8

set -U fish_emoji_width 1
set -U fish_ambiguous_width 1

set -U EDITOR vi
set -U PAGER less

### fzf
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_TMUX 0
set -U FZF_TMUX_HEIGHT 40%
set -U FZF_DEFAULT_OPTS "--ansi --reverse --border --height 40% --preview 'cat {}'"
set -U FZF_DEFAULT_COMMAND 'ag -g ""'
#fzf_key_bindings_uninstall

### fish-ghq
set -U GHQ_SELECTOR fzf
set -U GHQ_SELECTOR_OPTS $FZF_DEFAULT_OPTS

set -gx CHEAT_USE_FZF true

### homesick
set -U HOMESICK_DOTFILES $HOME/.homesick/repos/dotfiles
set -U HOMESICK_DOTFILES_HOME $HOME/.homesick/repos/dotfiles/home

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
set -U GOPATH $HOME/go

### PATH
set -U fish_user_paths ''
set -U fish_user_paths /usr/bin $fish_user_paths
set -U fish_user_paths /usr/sbin $fish_user_paths
set -U fish_user_paths /usr/local/bin $fish_user_paths
set -U fish_user_paths /usr/local/sbin $fish_user_paths
set -U fish_user_paths $HOME/local/bin $fish_user_paths
set -U fish_user_paths $GOPATH/bin $fish_user_paths # go
#set -gx PATH /usr/local/heroku/bin $PATH # heroku toolbelt

### npm
#set -gx PATH $PATH (npm bin -g)
set -U fish_user_paths /usr/local/share/npm/bin $fish_user_paths
set -U fish_user_paths $HOME/.npm/bin $fish_user_paths
set -U NODE_PATH $HOME/.npm/libraries $NODE_PATH
set -U MANPATH $HOME/.npm/man $MANPATH
# set -gx PATH eval "npm bin" $PATH

# Android
set -gx PATH $HOME/Library/Android/sdk/platform-tools $PATH

### anyenv
#set -x PATH $HOME/.anyenv/bin $PATH
#anyenv init - fish | source

### thefuck
thefuck --alias | source

alias vi "atom"
balias cat "bat"
balias ls "exa --icons --long --group-directories-first --all --git"
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

bind \t 'complete'

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

# pyenv-virtualenv
#
# https://github.com/pyenv/pyenv-virtualenv
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

# https://github.com/junegunn/fzf/wiki/Examples-(fish)
function fco -d "Fuzzy-find and checkout a branch"
  git branch --all | grep -v HEAD | string trim | fzf-tmux | read -l result; and git checkout "$result"
end

# https://github.com/junegunn/fzf/wiki/Examples-(fish)
function fcoc -d "Fuzzy-find and checkout a commit"
  git log --pretty=oneline --abbrev-commit --reverse | fzf-tmux --tac +s -e | awk '{print $1;}' | read -l result; and git checkout "$result"
end

# https://github.com/junegunn/fzf/wiki/Examples-(fish)
function fzf-bcd-widget -d 'cd backwards'
	pwd | awk -v RS=/ '/\n/ {exit} {p=p $0 "/"; print p}' | tac | eval (__fzfcmd) +m --select-1 --exit-0 $FZF_BCD_OPTS | read -l result
	[ "$result" ]; and cd $result
	commandline -f repaint
end

# https://github.com/junegunn/fzf/wiki/Examples-(fish)
function fzf-cdhist-widget -d 'cd to one of the previously visited locations'
	# Clear non-existent folders from cdhist.
	set -l buf
	for i in (seq 1 (count $dirprev))
		set -l dir $dirprev[$i]
		if test -d $dir
			set buf $buf $dir
		end
	end
	set dirprev $buf
	string join \n $dirprev | tac | sed 1d | eval (__fzfcmd) +m --tiebreak=index --toggle-sort=ctrl-r $FZF_CDHIST_OPTS | read -l result
	[ "$result" ]; and cd $result
	commandline -f repaint
end


# anyenv
#
# https://github.com/anyenv/anyenv
set -Ux fish_user_paths $HOME/.anyenv/bin $fish_user_paths
status --is-interactive; and source (anyenv init -|psub)
