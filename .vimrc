:call pathogen#runtime_append_all_bundles()

" 行番号表示
:set number

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
