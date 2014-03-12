# Install dotfiles

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

# Install apps (on Mac)

Install Homebrew
    $ ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

Update brew
    $ brew update

Install apps
    $ brew bundle

# Install Vim Plugins

    :BundleInstall
