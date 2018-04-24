"   __  __ _ _____ _________
"   "   \ \ | |_|     V  __/  __|
"   "    \ \| | | | | | |  | [__
"   " [_] \___|_|_|_|_|_|  \____|
"
"

let mapleader = ","

nnoremap <Leader>w :w<CR>

" Encoding {{{
set encoding=utf-8
scriptencoding utf-8
set guifont=Fira\ Code:h2
" }}}

" MyVimrc {{{
augroup MyVimrc
  autocmd!
augroup END
command! -nargs=* Autocmd autocmd MyVimrc <args>
command! -nargs=* AutocmdFT autocmd MyVimrc FileType <args>
" }}}

set number
set clipboard+=unnamed

" Normal Mode {{{
nnoremap ; :
nnoremap : ;

" Escape Keymaps {{{
inoremap <silent> jj <ESC>
inoremap <silent> <C-c> <ESC>
"}}}
