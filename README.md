Cloning Repository

    $ cd ~
    $ git clone git@github.com:KCeejp/dotfiles.git
    $ cd ~/dotfiles
    $ sh ./script/sync_dotfiles.sh

Adding Submodules

    $ git submodule add <repo> <path>

ignoring untracked content of submodule
.gitignore should contain something like:

    doc/
    doc/tags
    doc/tags-ja

    $ git config --global core.excludesfile ~/.gitignore
