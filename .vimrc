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
command! -nargs=* Autocmd autocmd MyVimrc <args>
command! -nargs=* AutocmdFT autocmd MyVimrc FileType <args>
function! s:hl_my_autocmd()
    highlight def link myVimAutocmd vimAutoCmd
    syntax match vimAutoCmd /\<\(Autocmd\|AutocmdFT\)\>/
endfunction
Autocmd BufWinEnter,ColorScheme *vimrc call s:hl_my_autocmd()

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

" Library {{{
NeoBundle 'Shougo/vimproc'
" }}}

set hlsearch
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

filetype plugin indent on

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

set clipboard=unnamed,autoselect

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

" Normal Mode {{{
nnoremap ; :
nnoremap : ;

nnoremap j gj
vnoremap j gj
nnoremap gj j
vnoremap gj j

nnoremap k gk
vnoremap k gk
nnoremap gk k
vnoremap gk k

nnoremap - $
"}}}

" Escape Keymaps {{{
inoremap <silent> jj <ESC>
inoremap <silent> <C-c> <ESC>
"}}}

" Search {{{
" always 'very magic'
nnoremap / /\v
" search within visual block
vnoremap / <esc>/\v%V
" clear status
nnoremap <silent><Esc><Esc>
      \ :<C-u>nohlsearch<CR>

" Automatically escape '/'
cnoremap <expr>/ getcmdtype() == '/' ? '\/' : '/'

nnoremap & :&&<CR>
xnoremap & :&&<CR>
"}}}

" Shougo/unite.vim"{{{
if neobundle#tap('unite.vim')
    " Config"{{{
    call neobundle#config({
        \   'depends': ['Shougo/vimproc'],
        \   'autoload' : {
        \     'commands' : [
        \       {
        \         'name' : 'Unite',
        \         'complete' : 'customlist,unite#complete_source'
        \       },
        \       'UniteWithCursorWord',
        \       'UniteWithInput'
        \     ]
        \   }
        \ })"}}}

    " Settings"{{{
    function! neobundle#tapped.hooks.on_source(bundle)
        let g:unite_kind_jump_list_after_jump_scroll=0
        let g:unite_enable_start_insert = 0
        let g:unite_source_rec_min_cache_files = 1000
        let g:unite_source_rec_max_cache_files = 5000
        let g:unite_source_file_mru_long_limit = 6000
        let g:unite_source_file_mru_limit = 300
        let g:unite_source_directory_mru_long_limit = 6000
        let g:unite_prompt = '❯ '
        " Open plugin directory by t
        call unite#custom#alias('directory', 'tabopen', 'tabvimfiler')
    endfunction "}}}

    " Unite {{{
    nnoremap [unite] <Nop>
    xnoremap [unite] <Nop>
    nmap ,u [unite]
    xmap ,u [unite]

    " Source
    nnoremap <silent> [unite]u :<C-u>Unite source -vertical -silent -start-insert<CR>
    " Buffer
    nnoremap <silent> [unite]b :<C-u>Unite -silent buffer file_mru bookmark<CR>
    " File List
    nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -silent -buffer-name=files file<CR>
    " Register List
    nnoremap <silent> [unite]R :<C-u>Unite -silent -buffer-name=register register<CR>
    " Restore Unite
    nnoremap <silent> [unite]r         :<C-u>UniteResume<CR>
    " Yank History
    let g:unite_source_history_yank_enable = 1
    nnoremap <silent> [unite]y :<C-u>Unite -silent history/yank<CR>
    " Show Mapping List
    nnoremap <silent> [unite]ma :<C-u>Unite -silent mapping<CR>
    " Show Message
    nnoremap <silent> [unite]me :<C-u>Unite -silent output:message<CR>
    " Jump (mnemonic : <C-o> jump to Older cursor position)
    nnoremap <silent> [unite]<C-o> :<C-u>Unite -silent change jump<CR>
    " Grep
    nnoremap <silent> [unite]gr :<C-u>Unite -silent -no-quit grep<CR>
    " Line
    nnoremap <silent> g/ :<C-u>Unite -buffer-name=search line -start-insert -no-quit<CR>
    "-Unite Plugin Settings--------------"{{{
    " Execute help.
    nnoremap <silent> [unite]gh  :<C-u>Unite -silent -start-insert -buffer-name=help help<CR>
    " Outeline
    nnoremap <silent> [unite]o :<C-u>Unite -silent outline -vertical -winwidth=40 -no-start-insert<CR>
    " Fold
    nnoremap <silent> [unite]z :<C-u>Unite -silent fold -vertical -winwidth=40 -no-start-insert<CR>
    " Unite Beautiful Atack
    nnoremap <silent> [unite]C :<C-u>Unite -auto-preview colorscheme<CR>
    "}}}

    call neobundle#untap()
endif
"}}}

" unite-sources {{{
" Shougo/unite-help {{{
if neobundle#tap('unite-help')
    call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'help'
        \     ],
        \   }
        \ })
    call neobundle#untap()
endif
"}}}
" ujihisa/unite-colorscheme {{{
if neobundle#tap('unite-colorscheme')
    call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'colorscheme'
        \     ],
        \   }
        \ })
    command! -nargs=* BeautifulAttack Unite colorscheme -auto-preview -winheight=3
    call neobundle#untap()
endif
"}}}
" Shougo/unite-outline {{{
if neobundle#tap('unite-outline')
    call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'outline'
        \     ],
        \   }
        \ })
    call neobundle#untap()
endif
"}}}
" osyo-manga/unite-fold {{{
if neobundle#tap('unite-fold')
    call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'fold'
        \     ],
        \   }
        \ })
    call neobundle#untap()
endif
"}}}
" kmnk/vim-unite-giti {{{
if neobundle#tap('vim-unite-giti')
    call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'giti'
        \     ],
        \   }
        \ })
    call neobundle#untap()
endif
"}}}
" thinca/vim-unite-history {{{
if neobundle#tap('vim-unite-history')
    call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'history'
        \     ],
        \   }
        \ })
    call neobundle#untap()
endif
"}}}
" osyo-manga/unite-quickfix {{{
if neobundle#tap('unite-quickfix')
    call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'quickfix'
        \     ],
        \   }
        \ })
    call neobundle#untap()
endif
"}}}
" End unite-sources }}}

" Shougo/VimFiler {{{
if neobundle#tap('vimfiler.vim')
    " Config {{{
    call neobundle#config({
        \   'autoload' : {
        \    'commands' : [
        \       { 'name' : 'VimFiler',
        \         'complete' : 'customlist,vimfiler#complete' },
        \       { 'name' : 'VimFilerTab',
        \         'complete' : 'customlist,vimfiler#complete' },
        \       { 'name' : 'VimFilerBufferDir',
        \         'complete' : 'customlist,vimfiler#complete' },
        \       { 'name' : 'VimFilerExplorer',
        \         'complete' : 'customlist,vimfiler#complete' },
        \       { 'name' : 'Edit',
        \         'complete' : 'customlist,vimfiler#complete' },
        \       { 'name' : 'Write',
        \         'complete' : 'customlist,vimfiler#complete' },
        \       'Read', 'Source'],
        \    'mappings' : '<Plug>(vimfiler_',
        \    'explorer' : 1,
        \   }
        \ })
    " }}}
    function! neobundle#tapped.hooks.on_source(bundle) "{{{
        hi link exrenameModified Normal
        let g:vimfiler_as_default_explorer=1

        AutocmdFT vimfiler call g:my_vimfiler_settings()

        function! g:my_vimfiler_settings()
            nmap <buffer>' <Plug>(vimfiler_toggle_mark_current_line)
            xmap <buffer>' <Plug>(vimfiler_toggle_mark_selected_lines)
            map <buffer> t :call vimfiler#mappings#do_action('tabopen')<CR>
        endfunction
    endfunction "}}}

    let g:vimfiler_safe_mode_by_default=0
    nnoremap <silent> ;vf :VimFilerBufferDir -split -simple -no-quit -winwidth=32<CR>
    nnoremap <silent> ;vt :VimFilerBufferDir -tab<CR>

    call neobundle#untap()
endif
"}}}

" Shougo/vimshell.vim {{{
if neobundle#tap('vimshell.vim')
    call neobundle#config({
        \   'depends': ['Shougo/vimproc'],
        \   'autoload' : {
        \       'commands' : [
        \       { 'name' : 'VimShell',
        \         'complete' : 'customlist,vimshell#complete'},
        \       { 'name' : 'VimShellTab',
        \         'complete' : 'customlist,vimshell#complete'},
        \       { 'name' : 'VimShellBufferDir',
        \         'complete' : 'customlist,vimshell#complete'},
        \         'VimShellExecute', 'VimShellInteractive',
        \         'VimShellTerminal', 'VimShellPop'],
        \   }
        \ })
    function! neobundle#tapped.hooks.on_source(bundle)
        " Use current directory as vimshell prompt.
        let g:vimshell_prompt_expr =
                    \ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
        let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
        let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]%p", "(%s)-[%b|%a]%p")'
    endfunction

    call neobundle#untap()
endif
"}}}

" Shougo/neosnippet.vim "{{{
if neobundle#tap('neosnippet.vim')
    call neobundle#config({
        \   'autoload' : {
        \     'insert' : 1,
        \     'filetypes' : 'neosnippet',
        \     'unite_sources' : [
        \       'snippet', 'neosnippet/user', 'neosnippet/runtime'
        \       ],
        \   }
        \ })

    function! neobundle#tapped.hooks.on_source(bundle) "{{{
        " For snippet_complete marker.
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif
        " Enable snipMate compatibility feature.
        let g:neosnippet#enable_snipmate_compatibility = 1
        " Remove snippets marker automatically
        Autocmd InsertLeave * :NeoSnippetClearMarkers
    endfunction "}}}

    " haya14busa-snippets {{{
    let g:neosnippet#snippets_directory=$HOME.'/.vim/myplugin/haya14busa-snippets/neosnippets'
    "}}}

    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)"
                \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)"
                \: "\<TAB>"

    " Plugin key-mappings.
    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)
    xmap <C-k> <Plug>(neosnippet_expand_target)
    xmap <C-l> <Plug>(neosnippet_start_unite_snippet_target)

    call neobundle#untap()
endif
"}}}

" Shougo/neocomplete.vim"{{{
if neobundle#tap('neocomplete.vim')
    call neobundle#config({
        \   'autoload' : {
        \     'insert' : 1,
        \   }
        \ })
    function! neobundle#tapped.hooks.on_source(bundle)
        " Use smartcase.
        let g:neocomplete#enable_smart_case = 1
        let g:neocomplete#enable_camel_case = 1
        let g:neocomplete#enable_underbar_completion = 1

        " Use fuzzy completion.
        let g:neocomplete#enable_fuzzy_completion = 1

        " Set minimum syntax keyword length.
        let g:neocomplete#sources#syntax#min_keyword_length = 3
        " Set auto completion length.
        let g:neocomplete#auto_completion_start_length = 2
        " Set manual completion length.
        let g:neocomplete#manual_completion_start_length = 0
        " Set minimum keyword length.
        let g:neocomplete#min_keyword_length = 3

        let g:neocomplete#disable_auto_select_buffer_name_pattern =
                    \ '\[Command Line\]'

        " Enable omni completion.
        AutocmdFT css setlocal omnifunc=csscomplete#CompleteCSS
        AutocmdFT html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        AutocmdFT javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        AutocmdFT xml setlocal omnifunc=xmlcomplete#CompleteTags
        AutocmdFT python setlocal omnifunc=jedi#completions

        if !exists('g:neocomplete#force_omni_input_patterns')
            let g:neocomplete#force_omni_input_patterns = {}
        endif
        let g:jedi#auto_vim_configuration = 0
        let g:neocomplete#force_omni_input_patterns.python =
                    \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    endfunction
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1

    " <C-f>, <C-b>: page move.
    inoremap <expr><C-f>  pumvisible() ? "\<PageDown>" : "\<Right>"
    inoremap <expr><C-b>  pumvisible() ? "\<PageUp>"   : "\<Left>"
    " <C-y>: paste.
    " inoremap <expr><C-y>  pumvisible() ? neocomplete#close_popup() :  "\<C-r>\""
    " <C-e>: close popup.
    inoremap <expr><C-e>  pumvisible() ? neocomplete#cancel_popup() : "\<End>"

    call neobundle#untap()
endif
"}}}

" Shougo/neocomplcache.vim"{{{
if neobundle#tap('neocomplcache.vim')
    call neobundle#config({
        \   'autoload' : {
        \     'insert' : 1,
        \   }
        \ })
    function! neobundle#tapped.hooks.on_source(bundle)
        let g:neocomplcache_enable_smart_case = 1
    endfunction
    call neobundle#untap()
endif
"}}}

" thinca/vim-quickrun {{{
if neobundle#tap('vim-quickrun')
    call neobundle#config({
        \   'autoload' : {
        \     'commands' : 'QuickRun',
        \     'mappings' : '[<Plug>(quickrun)]',
        \   }
        \ })
    function! neobundle#tapped.hooks.on_source(bundle)
        let g:quickrun_config = {
                    \   "_" : {
                    \       "runner" : "vimproc",
                    \       "runner/vimproc/updatetime" : 60
                    \   },
                    \}
        let g:quickrun_config.markdown = {
                    \ 'type': 'markdown/pandoc',
                    \ 'cmdopt': '-s',
                    \ 'outputter': 'browser'
                    \ }
    endfunction
    nnoremap <Leader>q  <Nop>
    nnoremap <silent><Leader>qr :<C-u>QuickRun<CR>
    vnoremap <silent><Leader>qr :QuickRun<CR>

    let g:quickrun_config = {
                \   "_" : {
                \       "runner" : "vimproc",
                \       "runner/vimproc/updatetime" : 60
                \   },
                \}
    if executable('pyflakes')
        let g:quickrun_config['syntax/python'] = {
                    \ 'command' : 'pyflakes',
                    \ 'exec' : '%c %o %s:p',
                    \ 'runner' : 'vimproc',
                    \ 'errorformat' : '%f:%l:%m',
                    \ }
        Autocmd BufWritePost *.py QuickRun -outputter quickfix -type syntax/python
    endif

    call neobundle#untap()
endif
"}}}

" rhysd/unite-codic.vim {{{
if neobundle#tap('unite-codic.vim')
    " Config {{{
    call neobundle#config({
        \   'depends': ['koron/codic-vim'],
        \   'autoload' : {
        \     'unite_sources' : [
        \       'codic',
        \     ],
        \   }
        \ })
    " }}}
    call neobundle#untap()
endif
" }}}

" jedi-vim {{{
if neobundle#tap('jedi-vim')
    call neobundle#config({
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"],
        \ },
        \ "build": {
        \   "mac": "pip install jedi",
        \   "unix": "pip install jedi",
        \ }})
    function! neobundle#tapped.hooks.on_source(bundle) "{{{
        " Disable automatically set completeopt+=preview
        let g:jedi#auto_vim_configuration = 0
        " Disable automatically select the first entry that pops up
        let g:jedi#popup_select_first = 0
        " Disable automatically starts completion upon typing a period
        let g:jedi#popup_on_dot = 0
        " For quickrun
        let g:jedi#rename_command = '<Leader>R'
        " For gundo
        let g:jedi#goto_assignments_command = '<Leader>G'
        let g:jedi#completions_command = "<C-N>"
    endfunction "}}}
    call neobundle#untap()
endif
"}}}

NeoBundleCheck
