SHELL := /bin/bash

unpack_bash:
	cp .bashrc .bash_profile .xinitrc .vimrc .screenrc .gitconfig .git-completion.bash .inputrc .ctags .gdbinit .muttrc .touch.sh ..
	cp -r .vim .mutt .gdb .config .i3 ..
	git submodule update --init --recursive
	chmod 775 ~/.gdb/detect-arch.sh
	cp -r .mutt/themes/[^.]* ../.mutt/themes
	cp -r .i3/i3blocks-contrib/[^.]* ../.i3/i3blocks-contrib
