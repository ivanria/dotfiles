"ma set mark named "a" press 'a or `a to jump to mark "a"
":tabnew create new tab :tabnext next tab
":ls list buffers :bunload! N :bdel! N delete buffer number N
":new to open new window :sp for same file in two window :vnew for vertical new window
":resize 10 to resize of 10 lines horizontal :vertical resize 10 to resize of 10 vertically lines

"macros - press qa to start record macross named "a"
"doing some things
"type q to stop recording
"repeat writing macros type @a where "a" is aname of macross
"repeat more than one type @a10
"repeat last move press "." dot


nnoremap tj :tabnext<CR> 
nnoremap tk :tabprev<CR> 
nnoremap <C-t> :tabnew<CR>

set nocompatible
syntax on
set scrolloff=999 "cursor on meddle alvays

filetype on
filetype plugin on
autocmd BufNewFile,BufRead *.hpp set cindent tabstop=4 shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.cpp set cindent tabstop=4 shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.h set cindent tabstop=4 shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.c set cindent tabstop=4 shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.htm  set cindent expandtab shiftwidth=2 tabstop=2 
autocmd BufNewFile,BufRead *.html set cindent expandtab shiftwidth=2 tabstop=2

command Thtml :%!tidy -utf8 -q -i --show-errors 0

set laststatus=2
set statusline=
set statusline+=%-3.3n\
set statusline+=%f\
set statusline+=%h%m%r%w
set statusline+=\[%{strlen(&ft)?&ft:'none'}]
set statusline+=%=
"set statusline+=0x%-8B
set statusline+=%-14(%l,%c%V%)
set statusline+=%<%P

set ruler

set showcmd

set showmode

set smartcase

map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map . /

map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
map , ?
