set nocompatible
filetype off 

"" --- Plugins --- 
call plug#begin()
	Plug 'kien/ctrlp.vim' " Fuzzy Finder
	Plug 'sonph/onehalf', { 'rtp': 'vim' } " Color Scheme
	Plug 'itchyny/lightline.vim' " Status Bar
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-treesitter/nvim-treesitter-refactor'
	Plug 'dracula/vim'
call plug#end()
"" --------------- 




"" --- General Settings --- 
set number relativenumber
set clipboard=unnamedplus
set linebreak
set spelllang=en_au spellfile=~/.vim/spell.en.utf-8.add
set ai
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set wildmenu
set updatetime=300
"" ------------------------ 




"" --- Color Scheme ---
syntax on
set termguicolors
colorscheme onehalfdark 
set background=dark
set laststatus=2
let g:airline_theme='onehalfdark'

"" --------------------
