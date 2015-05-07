" use multi-byte charactors
scriptencoding utf-8

""""""""""""""""""""
" initial
""""""""""""""""""""
if filereadable($HOME."/.vimrc.initial")
  source $HOME/.vimrc.initial
endif

""""""""""""""""""""
" 一般設定
""""""""""""""""""""
if filereadable($HOME."/.vimrc.base")
  source $HOME/.vimrc.base
endif

""""""""""""""""""""
" キーマップ
""""""""""""""""""""
if filereadable($HOME."/.vimrc.keymap")
  source $HOME/.vimrc.keymap
endif

""""""""""""""""""""
" プラグイン
""""""""""""""""""""
if filereadable($HOME."/.vimrc.plugin")
  source $HOME/.vimrc.plugin
endif

""""""""""""""""""""
" タブ
""""""""""""""""""""
if filereadable($HOME."/.vimrc.tab")
  source $HOME/.vimrc.tab
endif

""""""""""""""""""""
" colorscheme
""""""""""""""""""""
if filereadable($HOME."/.vimrc.colorscheme")
  source $HOME/.vimrc.colorscheme
endif

""""""""""""""""""""
" 色
""""""""""""""""""""
if filereadable($HOME."/.vimrc.color")
  source $HOME/.vimrc.color
endif

""""""""""""""""""""
" シンタックス
""""""""""""""""""""
if filereadable($HOME."/.vimrc.syntax")
  source $HOME/.vimrc.syntax
endif

""""""""""""""""""""
" マウス
""""""""""""""""""""
if filereadable($HOME."/.vimrc.mouse")
  source $HOME/.vimrc.mouse
endif

""""""""""""""""""""
" Perl
""""""""""""""""""""
if filereadable($HOME."/.vimrc.perl")
  source $HOME/.vimrc.perl
endif

""""""""""""""""""""
" Ruby
""""""""""""""""""""
if filereadable($HOME."/.vimrc.ruby")
  source $HOME/.vimrc.ruby
endif

""""""""""""""""""""
" 検索
""""""""""""""""""""
if filereadable($HOME."/.vimrc.search")
  source $HOME/.vimrc.search
endif

""""""""""""""""""""
" ローカル設定を読み込みます
""""""""""""""""""""
if filereadable($HOME."/.vimrc.local")
  source $HOME/.vimrc.local
endif
