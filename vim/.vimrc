set nocompatible
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()

Plug 'kien/ctrlp.vim'
Plug 'dracula/vim'

call plug#end()

set termguicolors
colorscheme dracula 
highlight Comment guifg=#80a0ff 
set number relativenumber
set clipboard=unnamedplus
set linebreak
set spelllang=en_au spellfile=~/.vim/spell.en.utf-8.add
set ai
set tabstop=2
set encoding=utf-8
