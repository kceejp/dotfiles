" use multi-byte charactors
scriptencoding utf-8

""""""""""""""""""""
" initial
""""""""""""""""""""
if filereadable($HOME."/.vim/rc/.vimrc.initial")
  source $HOME/.vim/rc/.vimrc.initial
endif

""""""""""""""""""""
" 一般設定
""""""""""""""""""""
if filereadable($HOME."/.vim/rc/.vimrc.base")
  source $HOME/.vim/rc/.vimrc.base
endif

""""""""""""""""""""
" キーマップ
""""""""""""""""""""
if filereadable($HOME."/.vim/rc/.vimrc.keymap")
  source $HOME/.vim/rc/.vimrc.keymap
endif

""""""""""""""""""""
" プラグインマネージャ
""""""""""""""""""""
if filereadable($HOME."/.vim/rc/.vimrc.dein")
  source $HOME/.vim/rc/.vimrc.dein
endif

""""""""""""""""""""
" プラグイン
""""""""""""""""""""
if filereadable($HOME."/.vim/rc/.vimrc.plugin")
  source $HOME/.vim/rc/.vimrc.plugin
endif

""""""""""""""""""""
" インデント
""""""""""""""""""""
if filereadable($HOME."/.vim/rc/.vimrc.indent")
  source $HOME/.vim/rc/.vimrc.indent
endif

""""""""""""""""""""
" カーソルライン
""""""""""""""""""""
if filereadable($HOME."/.vim/rc/.vimrc.cursorline")
  source $HOME/.vim/rc/.vimrc.cursorline
endif

""""""""""""""""""""
" タブ
""""""""""""""""""""
if filereadable($HOME."/.vim/rc/.vimrc.tab")
  source $HOME/.vim/rc/.vimrc.tab
endif

""""""""""""""""""""
" 色
""""""""""""""""""""
if filereadable($HOME."/.vim/rc/.vimrc.color")
  source $HOME/.vim/rc/.vimrc.color
endif

""""""""""""""""""""
" シンタックス
""""""""""""""""""""
if filereadable($HOME."/.vim/rc/.vimrc.filetype")
  source $HOME/.vim/rc/.vimrc.filetype
endif

""""""""""""""""""""
" シンタックス
""""""""""""""""""""
if filereadable($HOME."/.vim/rc/.vimrc.syntax")
  source $HOME/.vim/rc/.vimrc.syntax
endif

""""""""""""""""""""
" マウス
""""""""""""""""""""
if filereadable($HOME."/.vim/rc/.vimrc.mouse")
  source $HOME/.vim/rc/.vimrc.mouse
endif

""""""""""""""""""""
" Perl
""""""""""""""""""""
if filereadable($HOME."/.vim/rc/.vimrc.perl")
  source $HOME/.vim/rc/.vimrc.perl
endif

""""""""""""""""""""
" 検索
""""""""""""""""""""
if filereadable($HOME."/.vim/rc/.vimrc.search")
  source $HOME/.vim/rc/.vimrc.search
endif

""""""""""""""""""""
" ローカル設定を読み込みます
""""""""""""""""""""
if filereadable($HOME."/.vim/rc/.vimrc.local")
  source $HOME/.vim/rc/.vimrc.local
endif
