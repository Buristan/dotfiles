SHELL := /bin/bash

unpack_bash:
	cp .bashrc .bash_profile .xinitrc .vimrc .screenrc .git-completion.bash .xprofile .inputrc .ctags .gdbinit .muttrc .gitconfig ..
	cp -r .vim .mutt .gdb .config .i3 ..
	git submodule update --init --recursive
	chmod 775 ~/.gdb/detect-arch.sh
	cp -r .mutt/themes/[^.]* ../.mutt/themes
	if [ ${GIT_EMAIL} ]; then\
		git config --global user.email ${GIT_EMAIL};\
	fi
