#!/bin/sh

# http://d.hatena.ne.jp/sugyan/20100602/1275414838
cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done
