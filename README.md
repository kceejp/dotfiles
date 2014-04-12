Setting up dotfiles
===================

Install command line developer tools
------------------------------------

```bash
xcode-select --install
```

Install dotfiles
----------------

Install homesick

```bash
gem install homesick
```

rehash

```bash
rbenv rehash
```

clone homesick

```bash
homesick clone KCeejp/dotfiles
```

Create symlinks

```bash
cd ~ && homesick symlink dotfiles
```

Install apps (on Mac)
---------------------

Install Homebrew

```bash
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
```

Update brew

```bash
brew update
```

Install apps

```bash
brew bundle
```

Install Vim Plugins
-------------------

```bash
vi +NeoBundleInstall +qall!
```

