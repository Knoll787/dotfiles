set nocompatible
filetype off 

"" --- Plugins --- 
call plug#begin()
	Plug 'kien/ctrlp.vim'
	Plug 'sonph/onehalf', { 'rtp': 'vim' }
	Plug 'sheerun/vim-polyglot'
	Plug 'itchyny/lightline.vim'
call plug#end()


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

"" --- Color Scheme ---
set termguicolors
colorscheme onehalfdark
set background=dark
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }


"" --- Running Code ---""Running Code
let s:compiler_for_filetype = {
      \ "c,cpp"    : "gcc",
      \ "tex"      : "pdflatex",
      \ "python"   : "python"
      \}

let s:makeprg_for_filetype = {
      \ "c"        : "make clean && clear && ./a.out",
      \ "cpp"        : "make clean && clear && ./a.out",
      \}

let &shellpipe="2> >(tee %s)"

for [ft, comp] in items(s:compiler_for_filetype)
	execute "autocmd filetype ".ft." compiler! ".comp
endfor

function! CompileAndRun() abort
	write
	let l:makeprg_temp = &makeprg
	let &l:makeprg = "(".s:makeprg_for_filetype[&ft].")"
	make
	let &l:makeprg = l:makeprg_temp
endfunction

nnoremap <F9> :call CompileAndRun()<CR>
