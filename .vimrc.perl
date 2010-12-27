" :makeするため
compiler perl

" ,ptでperltidyで選択箇所をperltidy
map <leader>pt <Esc>:'<,'>! perltidy<CR>

" autocmd FileType perl  :map <UP>     <ESC>:!/usr/bin/perl ~/working/svn/codereview-tool/codereview.pl --all %<CR>|cwin
" autocmd FileType perl  :map <DOWN>   <ESC>:!/usr/bin/perl -Ilib -It/inc                       %<CR>|cwin
