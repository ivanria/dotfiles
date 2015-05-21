#!/bin/bash

cp -rf .vim ~/.vim
cp .bashrc ~/.bashrc
cp .dircolors ~/.dircolors

su -
cp -rf .vim ~/.vim
cp .bashrc_root ~/.bashrc
cp .dircolors ~/.dircolors

#cp sh.vim

aptitue install cscope

