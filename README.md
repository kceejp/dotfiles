Setting up dotfiles
===================

Setup ssh
---------

```
ssh-keygen -t rsa
```

Add public key to github
------------------------

```
cat ~/.ssh/id_rsa.pub
```

Install command line developer tools
------------------------------------

```bash
xcode-select --install
```

Install dotfiles
----------------

Install homesick

```bash
sudo gem install homesick
```

clone homesick

```bash
homesick clone kceejp/dotfiles
```

Create symlinks

```bash
cd ~ && homesick symlink dotfiles
```

Install Homebrew

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install Ansible

```bash
brew install ansible
```

Install the rest

```bash
ansible-playbook -i hosts sites.yml -t work
```
