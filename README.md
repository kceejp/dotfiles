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
