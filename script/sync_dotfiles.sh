#!/bin/sh

cd $HOME/dotfiles
echo $PWD
git submodule update --init

# http://d.hatena.ne.jp/sugyan/20100602/1275414838
cd $HOME/dotfiles/global
echo $PWD
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done

cd $HOME/dotfiles
echo $PWD
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.gitignore' ] && [ $dotfile != '.gitmodules' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done

cd $HOME/dotfiles
echo $PWD
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim +NeoBundleInstall +qall!

cd $HOME/dotfiles
echo $PWD
rm -rf ~/.oh-my-zsh/custom
ln -s ~/dotfiles/oh-my-zsh-custom ~/.oh-my-zsh/custom
