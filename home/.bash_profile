# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

unset USERNAME

# 文字コード
export LANG=ja_JP.UTF-8

# シェルをzshに
if [ -n "$PS1" ]; then
    SHELL=/bin/zsh
    exec /bin/zsh -l
fi

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
