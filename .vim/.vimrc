set number
set ignorecase
set smartcase
set smartindent
set wrapscan
set incsearch
set hlsearch

set expandtab
nmap <Esc><Esc> :nohlsearch<CR><Esc>

set history=10000

set display=lastline
set showmatch
set matchtime=1

set showcmd

"nnoremap ; :
"nnoremap : ;

nnoremap j gj
nnoremap k gk

inoremap <silent> jj <ESC>

let mapleader = "\<Space>"
nmap <Leader><Leader> V
nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
