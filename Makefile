SHELL := /bin/bash

unpack_bash:
	cp .bashrc .vimrc .screenrc .git-completion.bash .xprofile .inputrc .ctags .gdbinit .muttrc ..
	cp -r .vim .mutt .gdb ..
	git submodule update --init --recursive
	chmod 775 ~/.gdb/detect-arch.sh
	cp -r .mutt/themes/[^.]* ../.mutt/themes
