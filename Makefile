unpack_bash:
	cp .bashrc .vimrc .screenrc .git-completion.bash .xprofile .inputrc .ctags .gdbinit .muttrc ..
	cp -r .vim .mutt ..
	git submodule update --init --recursive
	cp -r .mutt/themes/* ../.mutt/themes
