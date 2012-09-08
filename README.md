Cloning Repository

    $ git clone git@github.com:KCeejp/dotfiles.git
    $ git submodule update --init

Adding Submodules

    $ git submodule add <repo> <path>

ignoring untracked content of submodule
.gitignore should contain something like:

    doc/
    doc/tags
    doc/tags-ja

    $ git config --global core.excludesfile ~/.gitignore

make vimproc

    $ cd ~/.vim/bundle/vimproc
    $ make -f make_mac.mak

install all plugins

    $ vim +BundleInstall +qall!
