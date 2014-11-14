function! GenerateTagsFile()
	if (filereadable("./tag_gen.sh"))
		call system("./tag_gen.sh &")
		if (filereadable("./types.vim"))
			source ./types.vim
		endif
	endif
endfunction
call GenerateTagsFile()
		" Always change to directory of the buffer currently in focus.
		"
		" " Generate tags on opening an existing file.
autocmd bufreadpost *.c   :call GenerateTagsFile()
autocmd bufreadpost *.h   :call GenerateTagsFile()
"autocmd bufreadpost *.h   source ./types.vim
"autocmd bufreadpost *.c   source ./types.vim
		" " Generate tags on save. Note that this regenerates tags for
		" all files in current folder.
autocmd bufwritepost *.c   :call GenerateTagsFile()
autocmd bufwritepost *.h   :call GenerateTagsFile()
"autocmd bufwritepost *.c   source ./types.vim
"autocmd bufwritepost *.h   source ./types.vim
