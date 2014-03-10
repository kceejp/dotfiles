Install homesick

    $ gem install homesick

rehash

    $ rbenv rehash

clone homesick

    $ homesick clone KCeejp/dotfiles

Create symlinks
    $ cd ~ && homesick symlink dotfiles

Adding Submodules

    $ git submodule add <repo> <path>

ignoring untracked content of submodule
.gitignore should contain something like:

    doc/
    doc/tags
    doc/tags-ja

    $ git config --global core.excludesfile ~/.gitignore
