" :makeするため
compiler perl

" ,ptでperltidyで選択箇所をperltidy
map <leader>pt <Esc>:'<,'>! perltidy<CR>

autocmd FileType perl  :map <UP>     <ESC>:!/usr/bin/perlcritic %<CR>|cwin
autocmd FileType perl  :map <DOWN>   <ESC>:!/usr/bin/perl -Ilib %<CR>|cwin
