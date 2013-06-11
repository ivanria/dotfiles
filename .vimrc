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





set nocompatible
syntax on
set scrolloff=999 "cursor on meddle alvays

filetype on
filetype plugin on
autocmd BufNewFile,BufRead *.hpp set cindent tabstop=4 shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.cpp set cindent tabstop=4 shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.h set cindent tabstop=4 shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.c set cindent tabstop=4 shiftwidth=4 expandtab
"autocmd BufNewFile,BufRead *.htm  filetype plugin indent on 
"autocmd BufNewFile,BufRead *.html filetype plugin indent on

command Thtml :%!tidy -q -i --show-errors 0

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

