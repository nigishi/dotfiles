" NeoBundle設定
source ~/dotfiles/.vimrc.bundle

" 基本設定
source ~/dotfiles/.vimrc.basic

" StatusLine設定
source ~/dotfiles/.vimrc.statusline

" Color関連
source ~/dotfiles/.vimrc.colors

" vim-fuzzy-finder設定
source ~/dotfiles/.vimrc.fuf

:call pathogen#runtime_append_all_bundles()

" 検索結果のハイライトをESC連打で消す
set hlsearch
noremap <ESC><ESC> :nohlsearch<CR><ESC>

" ステータスラインの設定
:set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
:set laststatus=2

" コロンセミコロン入れ替え
noremap ; :
noremap : ;

" 行番号表示
:set number

" インデントをスペースに
:set expandtab

" インデント関連
:set tabstop=2
:set shiftwidth=2
:set autoindent
:set smartindent

" インクリメンタルサーチ
:set incsearch

" 大文字小文字を区別しない
:set ignorecase

" 短縮入力
:inoreabbrev _mail y.yamamoto88@gmail.com
:inoreabbrev <expr> dl repeat('*', 80)
:inoreabbrev <expr> mdy strftime("%Y-%m-%d")

" スクリーンキャプチャ取得用に画面を設定する
:command! CaptureView set nonumber nolist nowrap lines=40 columns=86 noshowcmd
    \ cmdheight=1 showtabline=0 | colorscheme koehler

" 余分な半角スペースを削除する
:command! RmWhiteSpace :%s/^ *$//

" パラグラフ内の数値をインクリメントする
:command! AreaIncr norm vip:norm <C-V><C-A><CR>

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = "ng"
