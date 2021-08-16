set nocompatible
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()

Plug 'kien/ctrlp.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

call plug#end()

set termguicolors
colorscheme onehalfdark 
set background=dark
set number relativenumber
set clipboard=unnamedplus
set linebreak
set spelllang=en_au spellfile=~/.vim/spell.en.utf-8.add
set ai
set encoding=utf-8
setlocal tabstop=2
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal noexpandtab
