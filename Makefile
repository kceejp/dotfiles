.PHONY: install-dotfiles install-submodules install-vim-bundles all install-vimproc-linux install-vimproc-mac

all: install-dotfiles install-submodules install-vim-bundles

vimproc-mac:   install-vimproc-mac
vimproc-linux: install-vimproc-linux

install-dotfiles:
	@echo "install dotfiles"
	sh ./script/sync_dotfiles.sh
	@echo "Done!"

install-submodules:
	@echo "install submodules"
	git submodule update --init
	@echo "Done!"

install-vim-bundles:
	@echo "install vim bundles"
	vim +BundleInstall +BundleClean +qall!
	@echo "Done!"

install-vimproc-mac:
	@echo "install vimproc for mac"
	cd .vim/bundle/vimproc; make -f make_mac.mak;
	@echo "Done!"

install-vimproc-linux:
	@echo "install vimproc for linux"
	cd .vim/bundle/vimproc; make -f make_unix.mak;
	@echo "Done!"
