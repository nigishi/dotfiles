"   __  __ _ _____ _________
"   "   \ \ | |_|     V  __/  __|
"   "    \ \| | | | | | |  | [__
"   " [_] \___|_|_|_|_|_|  \____|
"
"
" Encoding {{{
set encoding=utf-8
scriptencoding utf-8
" }}}

" MyVimrc {{{
augroup MyVimrc
  autocmd!
augroup END

" NeoBundle {{{
if has('vim_starting')
  set nocompatible
  set runtimepath& runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Unite {{{
NeoBundleLazy 'Shougo/unite.vim'
NeoBundleLazy 'Shougo/unite-help'
NeoBundleLazy 'ujihisa/unite-colorscheme'
NeoBundleLazy 'Shougo/unite-outline'
NeoBundleLazy 'osyo-manga/unite-fold'
NeoBundleLazy 'kmnk/vim-unite-giti'
NeoBundleLazy 'thinca/vim-unite-history'
NeoBundleLazy 'osyo-manga/unite-quickfix'
" }}}

NeoBundleLazy 'Shougo/vimfiler.vim'
NeoBundleLazy 'Shougo/vimshell.vim'

" Writing {{{
" neocomplete {{{
if has('lua') && v:version >= 703
  NeoBundleLazy 'Shougo/neocomplete.vim'
else
  NeoBundleLazy 'Shougo/neocomplcache.vim'
endif
" }}}

NeoBundleLazy 'Shougo/neosnippet.vim'
NeoBundleLazy 'mattn/emmet-vim'
NeoBundleLazy 'deris/vim-rengbang'
NeoBundleLazy 'h1mesuke/vim-alignta'
NeoBundleLazy 'autodate.vim'
NeoBundleLazy 'tyru/caw.vim'
" }}}

" Development {{{
NeoBundleLazy 'thinca/vim-quickrun'
NeoBundleLazy 'scrooloose/syntastic'
NeoBundleLazy 'koron/codic-vim'
NeoBundleLazy 'rhysd/unite-codic.vim'
" }}}

set hlsearch
noremap <ESC><ESC> :nohlsearch<CR><ESC>

set number

" ColorScheme {{{
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'vim-scripts/rdark'
NeoBundle 'djjcast/mirodark'
NeoBundle 'sjl/badwolf'
NeoBundle 'cocopon/iceberg.vim' " A dark color scheme for Vim, came from Antarctica
NeoBundle 'reedes/vim-colors-pencil'
"}}}

" Git {{{
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'gregsexton/gitv'
NeoBundle 'mhinz/vim-signify'

NeoBundleLazy 'thinca/vim-openbuf'
NeoBundleLazy 'Shougo/vim-vcs', {
      \ 'depends' : 'thinca/vim-openbuf',
      \ 'autoload' : {'commands' : 'Vcs'},
      \ }
"}}}

" UI {{{
NeoBundle 'itchyny/lightline.vim'
NeoBundleLazy 'nathanaelkane/vim-indent-guides'
NeoBundleLazy 't9md/vim-quickhl' " quickly highlight <cword> or visually selected word
"TODO
NeoBundleLazy 'osyo-manga/vim-automatic', {
    \ 'depends' : [ 'osyo-manga/vim-gift', 'osyo-manga/vim-reunions' ] }
" }}}

" Filetype {{{
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'othree/html5.vim'
NeoBundle 'plasticboy/vim-markdown'

" Python {{{
NeoBundleLazy 'davidhalter/jedi-vim'
NeoBundleLazy 'heavenshell/vim-pydocstring'
NeoBundleLazy 'tell-k/vim-autopep8'
NeoBundleLazy 'hynek/vim-python-pep8-indent'
"}}}

" END NeoBundle}}}

" Tab Basic Settings {{{
set autoindent "Copy indent from current line when starting a new line
set expandtab "Use the appropriate number of spaces to insert a <Tab>
set shiftround "Round indent to multiple of 'shiftwidth'
set shiftwidth=4 "Number of spaces to use for each step of (auto)indent
set softtabstop=4 "Number of spaces that a <Tab> counts for while editing operations
set tabstop=4 "Number of spaces that a <Tab> in the file counts for
"}}}

" Search Basic Settings {{{
set incsearch "Incremental searching
set ignorecase "Ignore case in search patterns
set smartcase "Override the ignorecase option if the pattern contains upper case
set hlsearch | nohlsearch "Highlight search patterns, support reloading
"}}}

" Backup Settings {{{
"Don't create backup
set nobackup "Don't make a backup before overwriting a file
set nowritebackup "Don't make a backup before overwriting a file
set backupdir-=. "List of directories for the backup file
"}}}

" Colorscheme {{{
if has('vim_starting')
    syntax enable
    set t_Co=256
    if &t_Co < 256
        colorscheme default
    else
        try
            colorscheme jellybeans
        catch
            colorscheme desert
        endtry
    endif
endif
"}}}

" Escape Keymaps {{{
inoremap <silent> jj <ESC>
inoremap <silent> <C-c> <ESC>
"}}}

" Shougo/unite.vim"{{{
if neobundle#tap('unite.vim')
    " Unite {{{
    nnoremap [unite] <Nop>
    xnoremap [unite] <Nop>
    nmap ; [unite]
    xmap ; [unite]

    " Source
    nnoremap <silent> [unite]u :<C-u>Unite source -vertical -silent -start-insert<CR>
    call neobundle#untap()
endif
"}}}

