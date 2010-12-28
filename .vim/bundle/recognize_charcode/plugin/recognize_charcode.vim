"==============================================================
" ʸ�������ɤμ�ưǧ���ץ饰����
" recognize_charcode.vim
"==============================================================
" [����] (����)
" �������ɤΤۤ����Ƥ򡢤���Wiki����Ρ�ʸ�������ɤμ�ưǧ����
"   (http://www.kawaz.jp/pukiwiki/?vim#cb691f26)����Ѥ�����ĺ���Ƥ���
" ������Wiki����Υ����ɤ��Ф��뽤���ϡ�Heavens hell����Ρ�vim �Ǥ��ޤ�ʸ��������
"   (http://d.hatena.ne.jp/heavenshell/20080105/1199536148)
" ���ץ饰����κ�����ϡ�KaoriYa.net����Ρ�Vim���ܸ�ɥ�����ȡ�
"   (http://www.kaoriya.net/vimdoc_j/)�����������ɤ������ʥåץ���å����
"   runtime/doc/usr_41.jax 41.11��֥ץ饰�����񤯡ס�
"   �ڤӡ�̵̾����VIM�Ȥ�����Ρ�1�ե�����ǹ��������ץ饰����Υƥ�ץ졼�ȡ�
"   (http://nanasi.jp/articles/code/stdplugin/template.html)�򻲹ͤˤ���
"
" [���Υץ饰����μ¹���]
" (1) ���Υե������ Ǥ�եǥ��쥯�ȥ�/recognize_charcode.vim ����¸����
" (2) ~/.vimrc �� 
"        source Ǥ�եǥ��쥯�ȥ�/recognize_charcode.vim
"     ��ä���
"     ��Ǥ�եǥ��쥯�ȥ�� �� ��~/.vim�� �Ȥ���Τ�ɸ��餷��


"--------------------------------------------------------------

" �ץ饰��������
" �ץ饰����2���ɤ߹��ޤ�뤳�Ȥ��ɻ�
if exists("loaded_recognize_charcode")
  finish
endif
let loaded_recognize_charcode = 1

" �桼�������ƨ��
let s:save_cpo = &cpo
set cpo&vim

"-------------------- ʸ��������ǧ���� ���� --------------------

if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconv��eucJP-ms���б����Ƥ��뤫������å�
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconv��JISX0213���б����Ƥ��뤫������å�
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif

  " fileencodings����
  if &encoding ==# 'utf-8'
    
    "(A)
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc

    if s:fileencodings_default =~ 'utf-8'
      let &fileencodings = &fileencodings .','. s:fileencodings_default
      let &fileencodings = substitute(&fileencodings, "utf-8", "utf-8,cp932", "g")
    else
      let &fileencodings = &fileencodings .',cp932,'. s:fileencodings_default
    endif
    unlet s:fileencodings_default
    "(B)

  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " ������ʬ
  unlet s:enc_euc
  unlet s:enc_jis
endif
" ���ܸ��ޤޤʤ����� fileencoding �� encoding ��Ȥ��褦�ˤ���
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" ���ԥ����ɤμ�ưǧ��
set fileformats=unix,dos,mac
" ���Ȥ�����ʸ�������äƤ⥫��������֤�����ʤ��褦�ˤ���
if exists('&ambiwidth')
  set ambiwidth=double
endif

"-------------------- ʸ��������ǧ���� ��λ --------------------

" ƨ�����Ƥ����桼�����������
let &cpo = s:save_cpo
