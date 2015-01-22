"ma set mark named "a" press 'a or `a to jump to mark "a"
":tabnew create new tab :tabnext next tab
":ls list buffers :bunload! N :bdel! N delete buffer number N
":new to open new window :sp for same file in two window :vnew for vertical new window
":resize 10 to resize of 10 lines horizontal :vertical resize 10 to resize of 10 vertically lines
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"macros - press qa to start record macross named "a"
"doing some things
"type q to stop recording
"repeat writing macros type @a where "a" is a name of macross
"repeat more than one type @a10
"repeat last move press "." dot
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"building programm within vim
":make build project with Makefile
":cc jump to error
":cnext :cprevious next prev error
"clist list of errors
":copen open new window with errors
"Enter on error - jump to corresponding errors in source
":cclose close widow
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"folding
":set foldmethod=
"manusl only manual folding
"expr blocks fold corresponding of foldexpr value
"syntax folding corresponding of syntaxis. !!! the most recomended
"marke folding from markers
"""""""""""""""""""""""""
"folding commands:
" zo open folder
" zO open folder recursively
" zc close fold
" zC close fold recursively
" za if open, then close and vice versa
" zA same as previouse, but recursively
" zr FOLDLEVEL+=1
" zR open all folds in file
" zm FOLDLEVEL-=1
" zM close all folds in file
""""""""""""""""""""""""""""""""""""""""""
"vimdiff
"diff obtain
"diff put
""""""""""""""""""""""""""""""""""""""""""
"undo redo
":earlier 4m
":later 45s
":undolist
""""""""""""""""""""""""""""""""""""""""""
"Drawit plugin
":Drawit - start drawing
"\ds - stop drawing
""""""""""""""""""""""""""""""""""""""""""

set nocompatible
syntax on

let $VIMHOME = $HOME."/.vim"

if $TERM == "xterm-256color"
	set t_Co=256
endif

nnoremap tj :tabnext<CR> 
nnoremap tk :tabprev<CR> 
nnoremap <C-t> :tabnew<CR>

"color default
set scrolloff=999 "cursor on meddle alvays

filetype plugin on
filetype on
filetype indent on
autocmd BufNewFile,BufRead *.hpp source $VIMHOME/extend_files/cpp.vim 
autocmd BufNewFile,BufRead *.cpp source $VIMHOME/extend_files/cpp.vim 
autocmd BufNewFile,BufRead *.h source $VIMHOME/extend_files/linuxsty.vim 
autocmd BufNewFile,BufRead *.c source $VIMHOME/extend_files/linuxsty.vim 
autocmd BufNewFile,BufRead *.h source $VIMHOME/tags_gen.vim 
autocmd BufNewFile,BufRead *.c source $VIMHOME/tags_gen.vim 
autocmd BufNewFile *.c so $VIMHOME/extend_files/cheader.txt
autocmd BufNewFile *.cpp so $VIMHOME/extend_files/cppheader.txt
autocmd BufNewFile,BufRead *.htm  set cindent shiftwidth=2 tabstop=2 
autocmd BufNewFile,BufRead *.html set cindent shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead *.py source $VIMHOME/indent/python.vim
"autocmd BufNewFile,BufRead 

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

set fileencodings=utf-8,cp1251,cp866,koi8-r

set hlsearch

"persistent undo
set undofile
set undodir=$VIMHOME/undodir
set undolevels=1000
set undoreload=10000

":map <F11>  :sp tags<CR>:%s/^\([^	:]*:\)\=\([^	]*\).*/syntax keyword Tag \2/<CR>:wq! tags.vim<CR>/^<CR><F12>
":map <F12>  :so tags.vim<CR>

" load the types.vim highlighting file, if it exists
autocmd BufRead,BufNewFile *.[ch] let fname = expand('<afile>:p:h') . '/types.vim'
autocmd BufRead,BufNewFile *.[ch] if filereadable(fname)
autocmd BufRead,BufNewFile *.[ch]   exe 'so ' . fname
autocmd BufRead,BufNewFile *.[ch] endif

" <F7> File fileformat (dos - <CR> <NL>, unix - <NL>, mac - <CR>)
map <F7>  :execute RotateFileFormat()<CR>
vmap <F7>	<C-C><F7>
imap <F7>	<C-O><F7>
let b:fformatindex=0
function! RotateFileFormat()
  let y = -1
  while y == -1
    let encstring = "#unix#dos#mac#"
    let x = match(encstring,"#",b:fformatindex)
    let y = match(encstring,"#",x+1)
    let b:fformatindex = x+1
    if y == -1
      let b:fformatindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":set fileformat=".str
    endif
  endwhile
endfunction

" <F8> File encoding for open
" ucs-2le - MS Windows unicode encoding
map <F8>	:execute RotateEnc()<CR>
vmap <F8>	<C-C><F8>
imap <F8>	<C-O><F8>
let b:encindex=0
function! RotateEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:encindex)
    let y = match(encstring,"#",x+1)
    let b:encindex = x+1
    if y == -1
      let b:encindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":e ++enc=".str
    endif
  endwhile
endfunction

" <Shift+F8> Force file encoding for open (encoding = fileencoding)
map <S-F8>	:execute ForceRotateEnc()<CR>
vmap <S-F8>	<C-C><S-F8>
imap <S-F8>	<C-O><S-F8>
let b:encindex=0
function! ForceRotateEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:encindex)
    let y = match(encstring,"#",x+1)
    let b:encindex = x+1
    if y == -1
      let b:encindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      :execute "set encoding=".str
      return ":e ++enc=".str
    endif
  endwhile
endfunction

" <Ctrl+F8> File encoding for save (convert)
map <C-F8>	:execute RotateFEnc()<CR>
vmap <C-F8>	<C-C><C-F8>
imap <C-F8>	<C-O><C-F8>
let b:fencindex=0
function! RotateFEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:fencindex)
    let y = match(encstring,"#",x+1)
    let b:fencindex = x+1
    if y == -1
      let b:fencindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":set fenc=".str
    endif
  endwhile
endfunction

set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
set laststatus=2

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
