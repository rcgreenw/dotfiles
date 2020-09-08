set ts=3 ai sw=3 nowrap et ruler nrformats=hex
set background=dark
highlight comment ctermfg=cyan

set shell=/bin/bash
set shell=/bin/tcsh\ -f
set shell=/bin/zsh

:nnoremap <F8> /\<\d\{10}\><CR>ce<C-r>=strftime("%Y%m%d00")<CR><Esc>:echo @"<CR>

function! UPDSERIAL(date, num)
if (strftime("%Y%m%d") == a:date)
return a:date . a:num+1
endif
return strftime("%Y%m%d") . '00'
endfunction

command Soa :%s/\(SOA.*\)\(2[0-9]\{7}\)\([0-9]\{2}\)\(\s*\)/\=submatch(1) . UPDSERIAL(submatch(2), submatch(3)) . submatch(4)/g

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
