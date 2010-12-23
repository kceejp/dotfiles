""""""""""""""""""""
" initial
""""""""""""""""""""
if filereadable("./.vimrc.initial")
  source ./.vimrc.initial
endif

""""""""""""""""""""
" 一般設定
""""""""""""""""""""
if filereadable("./.vimrc.base")
  source ./.vimrc.base
endif

""""""""""""""""""""
" キーマップ
""""""""""""""""""""
if filereadable("./.vimrc.keymap")
  source ./.vimrc.keymap
endif

""""""""""""""""""""
" タブ
""""""""""""""""""""
if filereadable("./.vimrc.tab")
  source ./.vimrc.tab
endif

""""""""""""""""""""
" 色
""""""""""""""""""""
if filereadable("./.vimrc.color")
  source ./.vimrc.color
endif

""""""""""""""""""""
" マウス
""""""""""""""""""""
if filereadable("./.vimrc.mouse")
  source ./.vimrc.mouse
endif

""""""""""""""""""""
" Perl
""""""""""""""""""""
if filereadable("./.vimrc.perl")
  source ./.vimrc.perl
endif

""""""""""""""""""""
" 検索
""""""""""""""""""""
if filereadable("./.vimrc.search")
  source ./.vimrc.search
endif

""""""""""""""""""""
" キーマップ
""""""""""""""""""""
if filereadable("./.vimrc.plugin")
  source ./.vimrc.plugin
endif

""""""""""""""""""""
" ローカル設定を読み込みます
""""""""""""""""""""
if filereadable("./.vimrc.local")
  source ./.vimrc.local
endif
