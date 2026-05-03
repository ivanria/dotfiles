" :xa                 --- exit from all tabs and windows
" :bufdo (command)    --- run command in all buffers
" :ma (name mark)     --- set mark named "a"
" press "'a" or "`a"  --- to jump to mark "a"
" :tabnew             --- create new tab :tabnext next tab
" :ls                 --- list buffers
" :bunload! N         --- buffer unload
" :bdel! N            --- delete buffer number N
" :new                --- to open new window
" :sp                 --- for same file in two window
" :vnew               --- for vertical new window
" :resize 10          --- to resize of 10 lines horizontal
" :vertical resize 10 --- to resize of 10 vertically lines
" '. or CTRL+O        --- jump to last modification line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" macros
" qa      --- to start record macross named "a"
"         --- doing some things
" q       --- to stop recording
" @a      --- repeat "a" macros
" @a10    --- repeat "a" macros 10 times 
" "." dot --- repeat last
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" building programm within vim
" :make   --- build project with Makefile
" :cc     --- jump to error
" :cnext  --- :cprevious next prev error
" :cprev
" :clist  --- list of errors
" :copen  --- open new window with errors
" Enter on error - jump to corresponding errors in source
" :cclose --- close widow
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" folding
" :set foldmethod=
" manusl --- only manual folding
" expr   --- blocks fold corresponding of foldexpr value
" syntax --- folding corresponding of syntaxis. !!! the most recomended
" marke  --- folding from markers
"""""""""""""""""""""""""
" folding commands:
" zo --- open folder
" zO --- open folder recursively
" zc --- close fold
" zC --- close fold recursively
" za --- if open, then close and vice versa
" zA --- same as previouse, but recursively
" zr --- FOLDLEVEL+=1
" zR --- open all folds in file
" zm --- FOLDLEVEL-=1
" zM --- close all folds in file
""""""""""""""""""""""""""""""""""""""""""
" vimdiff
" diff obtain do
" diff put dp
""""""""""""""""""""""""""""""""""""""""""
" undo redo
" :earlier 4m
" :later 45s
" :undolist
""""""""""""""""""""""""""""""""""""""""""
" Drawit plugin
" :Drawit - start drawing
" \ds - stop drawing
""""""""""""""""""""""""""""""""""""""""""
" tabs
" :tabnew             --- open new tab
" to move tab to left --- :tabm +1
" to move tab rigth   --- :tabm -1
" to move tab to end  --- :tabm
""""""""""""""""""""""""""""""""""""""""""
" vim session
" to save session           --- :mksession ~/mysession.vim
" to load session from file --- :source ~/mysession.vim
" to load session wheen run vim
"                           --- vim -S ~/mysession.vim
""""""""""""""""""""""""""""""""""""""""""
" windows
" Ctrl+W   --- r rotate windows left
" Ctrl+W R --- rotate windows right
" Ctrl+W x --- change two windows places
""""""""""""""""""""""""""""""""""""""""""
" tagging
" set cursor on keyword: for example "main"
" and press   --- Ctrl+] --- move to function "main" definition
" :tag "main" --- same as Ctrl+]
" Ctrl+t      --- move to previous position
" :tags       --- list previously finded tags
"""""""""""""""""""""""""""""""""""""""""
"cscope: 
" in project dir run vim -t main
" or in source code press ctrl+spacebar and press s
" :ho scs find g main 	--- definition of function main --- split window horiz
" :ho scs find t main	--- all places where main found --- split, new below
" :cs show main		--- dependency graph
"
"   's'   symbol: find all references to the token under cursor
"   'g'   global: find global definition(s) of the token under cursor
"   'c'   calls:  find all calls to the function name under cursor
"   't'   text:   find all instances of the text under cursor
"   'e'   egrep:  egrep search for the word under cursor
"   'f'   file:   open the filename under cursor
"   'i'   includes: find files that include the filename under cursor
"   'd'   called: find functions that function under cursor calls
"   'a'   assign: Find places where this symbol is assigned a value
"""""""""""""""""""""""""""""""""""""""""
"Yank Paste. Delete Paste
" "1-9p or 1-9P it is delete from 1 to 9. 0p or 0P it is last yank
" :reg show all register yanc and delete
"""""""""""""""""""""""""""""""""""""""""

set nocompatible
syntax on

"set number

let $VIMHOME = $HOME."/.vim"

if $TERM == "xterm-256color"
	set t_Co=256
endif

"if has("termguicolors")
    "set termguicolors
"endif

set clipboard=unnamedplus

"set virtualedit=all

set cscopeverbose

let g:gutensyntax_enable = 1
let g:gutensyntax_syntax_defs = [
\ ['MyCustomCType',  'sgut', 'Type'],
\ ['MyCustomCMacro', 'de',   'PreProc'],
\ ['MyCustomCFunc',  'f',    'Function']
\ ]

let g:netrw_dirhistmax=0

let g:gutentags_enabled = 1
"check in the future is .git gutentags_project_root
let g:gutentags_exclude_project_root = ['/home/ivr/programming/c']
let g:gutentags_add_default_project_roots = 1
"let g:gutentags_project_root = ['__gutentags_enable_file']
"I'll check in the future whether it works or not "gutentags_root".
let g:gutentags_modules = ['cscope', 'ctags']
"let g:gutentags_modules = ['ctags']
"let g:gutentags_ctags_extra_args = ['--links=no', '--languages=c']
"let g:gutentags_ctags_auto_set_tags = "1"
let g:gutentags_ctags_tagfile = "__ctags_syntax_src"
"let g:gutentags_ctags_extra_args = ['--recurse', '--tag-relative=no', '--fields=+a', '--languages=C,C++,Make,Yacc,Flex']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 1
let g:gutentags_cscope_build_inverted_index = 1
"let g:gutentags_exclude_filetypes = ['out']
"let g:gutentags_file_list_command = 'find . -type f -a \( -name "*.c" -o -name "*.h" -o -name "*.y" -o -name "*.l" -o -name Makefile \) -a -not -name "cscope.*" -a -not \( -path "*/.git/*" -prune \)'
let g:gutentags_trace = 1


nnoremap tk :tabnext<CR> 
nnoremap tj :tabprev<CR> 
"nnoremap <C-t> :tabnew<CR>

"color default
set scrolloff=999 "cursor on meddle alvays

filetype plugin on
filetype on
filetype indent on
""""""""""file extensions""""""""""
"autocmd BufNewFile,BufRead *.hpp source $VIMHOME/extend_files/cpp.vim 
"autocmd BufNewFile,BufRead *.cpp source $VIMHOME/extend_files/cpp.vim 
autocmd BufNewFile,BufRead *.h source $VIMHOME/extend_files/linuxsty.vim 
autocmd BufNewFile,BufRead *.c source $VIMHOME/extend_files/linuxsty.vim 
autocmd BufNewFile,BufRead *.bb set syntax=bitbake
"autocmd BufNewFile,BufRead *.h source $VIMHOME/tags_gen.vim 
"autocmd BufNewFile,BufRead *.c source $VIMHOME/tags_gen.vim 
autocmd BufNewFile *.c so $VIMHOME/extend_files/cheader.txt
"autocmd BufNewFile *.cpp so $VIMHOME/extend_files/cppheader.txt
"autocmd BufNewFile,BufRead *.htm  set cindent shiftwidth=2 tabstop=2 
"autocmd BufNewFile,BufRead *.html set cindent shiftwidth=2 tabstop=2
"autocmd BufNewFile,BufRead *.py source $VIMHOME/indent/python.vim
"autocmd BufNewFile,BufRead 
"""""""""""end of file extensions section""""""""""

set smartcase

set hlsearch

"persistent undo
set undofile
set undodir=$VIMHOME/undodir
set undolevels=1000
set undoreload=10000


""""""""""""""""""""""""""
"disble arrow keys in vim"
""""""""""""""""""""""""""
map <silent> <up>       <nop>
map <silent> <down>     <nop>
map <silent> <left>     <nop>
map <silent> <right>    <nop>

imap <silent> <up>       <nop>
imap <silent> <down>     <nop>
imap <silent> <left>     <nop>
imap <silent> <right>    <nop>

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
