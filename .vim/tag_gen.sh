#!/bin/bash
fl=$(find . \( -name '*.h' -o -name '*.c' \) -a -type f)
tmp=./.types.tmp
ctags -R --c-kinds=gstu -o- $fl | tee .test | awk 'BEGIN{printf("syntax keyword Type\t")}\
	{printf("%s ", $$1)}END{print ""}'>$tmp
if [ ! -s .test ] ; then
	echo > types.vim
else
	cp $tmp types.vim
	rm $tmp
fi
