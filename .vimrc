call plug#begin()
	Plug 'kien/ctrlp.vim'
	"colorschemes
	Plug 'Haron-Prime/evening_vim'
	Plug 'fsrc/lyla-vim'
	Plug 'tbastos/vim-lua'
	Plug 'joshdick/onedark.vim'
	Plug 'gosukiwi/vim-atom-dark'
	Plug 'okoshovetc/yvcs'
call plug#end()

"Not clear buffer when exit vim
autocmd VimLeave * call system("xsel -ib", getreg('+'))

"numbers, tapstops, history and search
set nu
set hlsearch
set incsearch
set tabstop=4
set shiftwidth=4
set autoindent
set listchars=tab:\|.,trail:~
set list
set showmatch
set showcmd
set history=200
set cursorline

"nice tab complection
set wildmenu

"mappings for arrow keys
"map <up> :echo 'KAPLUN NE NADO'<CR>
"map <down> :echo 'KAPLUN NE NADO'<CR>
"map <right> :echo 'KAPLUN NE NADO'<CR>
"map <left> :echo 'KAPLUN NE NADO'<CR>
"
"imap <up> <ESC> :echo 'KAPLUN NE NADO'<CR>
"imap <down> <ESC> :echo 'KAPLUN NE NADO'<CR>
"imap <right> <ESC> :echo 'KAPLUN NE NADO'<CR>
"imap <left> <ESC> :echo 'KAPLUN NE NADO'<CR>

"lighting
syntax on
set t_Co=256
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
set background=dark
colorscheme yvpale

"folding
set foldenable
set foldmethod=indent

"status line
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set nu

"keymap
nmap <C-j> jzz
nmap <C-k> kzz

"Hanging <Tab>-s
inoremap <Esc> ~<bs><Esc>
inoremap <cr> ~<bs><cr>

"commands
command! W w
command! Game exec "! git blame %"
command! Giff exec "! git diff %"
command! Fresh exec "source ~/.vimrc"
