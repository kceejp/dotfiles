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
export LANG=ja_JP.eucJP

# シェルをzshに
if [ -n "$PS1" ]; then
    SHELL=/bin/zsh
    exec /bin/zsh -l
fi
