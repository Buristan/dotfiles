call plug#begin()
	Plug 'kien/ctrlp.vim'
	Plug 'airblade/vim-gitgutter'
	"Wakatime
	Plug 'wakatime/vim-wakatime'
	"Browser
	Plug 'tyru/open-browser.vim'
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
set term=$TERM
nnoremap <silent> <ESC>OA <Nop>
nnoremap <silent> <ESC>OB <Nop>
nnoremap <silent> <ESC>OC <Nop>
nnoremap <silent> <ESC>OD <Nop>
inoremap <silent> <ESC>OA <Nop>
inoremap <silent> <ESC>OB <Nop>
inoremap <silent> <ESC>OC <Nop>
inoremap <silent> <ESC>OD <Nop>

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

"keymap normal mode
nmap <C-j> jzz
nmap <C-k> kzz
nmap <silent> [[ k$?{<CR>0f{:noh<cr>
nmap <silent> ][ j0/{<CR>0f{:noh<cr>
nmap <silent> ]] $/}<CR>$F}:noh<cr>
nmap <silent> [] 0?}<CR>$F}:noh<cr>

"keymap visual mode "TODO NORMAL FOR ALL lang
xmap <C-_> 0<C-v>I#<Esc>

"Hanging <Tab>-s
inoremap <Esc> ~<bs><Esc>
inoremap <cr> ~<bs><cr>

"commands
command! W w
command! Game exec "! git blame %"
command! Giff exec "! git diff %"
command! Fresh exec "source ~/.vimrc"

"F5 to see .tex file in pdf
autocmd FileType tex noremap <buffer> <F5> :w<CR> :!pdflatex -shell-escape "%" && evince %:p:r.pdf<CR>

" If it looks like URI, open an URI under cursor.
" Otherwise, search a word under cursor.
nmap gs <Plug>(openbrowser-smart-search)
" If it looks like URI, open selected URI.
" Otherwise, search selected word.
vmap gs <Plug>(openbrowser-smart-search)

"Cyrillic settings
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

"Not hightlighting last search after reload
noh
