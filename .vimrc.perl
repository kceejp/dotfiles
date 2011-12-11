" :makeするため
autocmd FileType perl :compiler perl

" .t ファイルでもperl syntax highlighting
autocmd BufReadPost,BufNewFile *.t :setl filetype=perl

" ,ptでperltidyで全体をperltidy
map <leader>pt  <Esc>:%! perltidy<CR>
" ,ptvでperltidyで選択箇所をperltidy
map <leader>ptv <Esc>:'<,'>! perltidy<CR>

autocmd FileType perl  :map <UP>     <ESC>:!/usr/bin/perlcritic %<CR>|cwin
autocmd FileType perl  :map <DOWN>   <ESC>:!/usr/bin/perl -Ilib %<CR>|cwin

autocmd FileType perl set makeprg=$HOME/.vim/bin/vimparse.pl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set shellpipe=2>&1\ >
autocmd BufWritePost,FileWritePost *.pm,*.pl,*.t silent make %
autocmd QuickfixCmdPost make if len(getqflist()) != 0 | copen | endif
