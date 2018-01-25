set ts=3 ai sw=3 nowrap et ruler nrformats=hex
set background=dark
highlight comment ctermfg=cyan

set shell=/bin/bash
set shell=/bin/tcsh\ -f

:nnoremap <F8> /\<\d\{10}\><CR>ce<C-r>=strftime("%Y%m%d00")<CR><Esc>:echo @"<CR>

function! UPDSERIAL(date, num)
if (strftime("%Y%m%d") == a:date)
return a:date . a:num+1
endif
return strftime("%Y%m%d") . '00'
endfunction

command Soa :%s/\(2[0-9]\{7}\)\([0-9]\{2}\)\(\s*; [sS]erial\)/\=UPDSERIAL(submatch(1), submatch(2)) . submatch(3)/g

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
