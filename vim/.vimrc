set nocompatible
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()

Plug 'kien/ctrlp.vim'
Plug 'dracula/vim'

call plug#end()

""Colour Theme
set t_Co=256
set termguicolors
colorscheme dracula 
set laststatus=2

""General System Settings
set number relativenumber
set clipboard=unnamedplus
set wrap linebreak textwidth=100
autocmd BufRead,BufNewFile *.bib  set nospell 
autocmd BufRead,BufNewFile *.m    set nospell 
set spell spelllang=en_au
set spellfile=~/.vim/spell.en.utf-8.add
set expandtab
set ai
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cursorline
set showmatch
set wildmode=longest:full,full
set encoding=utf-8
