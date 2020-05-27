set nocompatible
filetype off 

""Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'dracula/vim'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-fugitive'

call plug#end()


""Colour Theme
set t_Co=256
set termguicolors
colorscheme dracula 
set laststatus=2

""General System Settings
set number relativenumber
set nu rnu
autocmd BufRead,BufNewFile *.wiki set textwidth=100 
autocmd BufRead,BufNewFile *.tex set textwidth=100 
autocmd BufRead,BufNewFile *.bib set nospell 
autocmd BufRead,BufNewFile *.m set nospell 
set spell spelllang=en_au
set spellfile=~/.vim/spell.en.utf-8.add
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cursorline
set showmatch
set wildmode=longest:full,full

""Running Code
let s:compiler_for_filetype = {
      \ "c,cpp"    : "gcc",
      \ "python"   : "pyunit",
      \ "tex"      : "tex",
      \ "m"   : "octave",
      \}

let s:makeprg_for_filetype = {
      \ "c"        : "clear && gcc -std=gnu11 -g % -lm -o %< && ./%<",
      \ "cpp"      : "clear && g++ -std=gnu++11 -g % -o % && ./%<",
      \ "markdown" : "grip --quiet -b %",
      \ "python"   : "clear && python %",
      \ "sh"       : "clear && chmod +x %:p && %:p",
      \ "tex"      : "clear && pdflatex % && bibtex report  && pdflatex % && pdflatex %",
      \ "java"     : "clear && javac % && java %<",
      \ "matlab"   : "clear && octave %",
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
map <F10> <ESC>:w!<CR>
map <F11> :w<CR>:VimwikiAll2HTML<Cr>


""Goyo
function! s:goyo_enter()
  set number relativenumber
  set nu rnu 
  Goyo 100x110%
endfunction
function! s:goyo_leave()
endfunction
noremap <Leader><space> :Goyo<Cr>
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

""Vimwiki
let g:vimwiki_list = [{'path': '~/documents/notes/notes/'}]
let g:vimwiki_list = [{
  \ 'path': '$HOME/documents/notes/notes/',
  \ 'template_path': '$HOME/.vim/plugged/vimwiki/autoload/vimwiki/',
  \ 'template_default': 'default',
  \ 'template_ext': '.tpl'}]

""Fugitive key bindings
nnoremap <space>ga  :G<Cr>
nnoremap <space>gs  :Gstatus<CR>
nnoremap <space>gc  :Gcommit<CR>
nnoremap <space>gt  :Gcommit<CR>
nnoremap <space>gd  :Gdelete<CR>
nnoremap <space>ge  :Gedit<CR>
nnoremap <space>gr  :Gread<CR>
nnoremap <space>gw  :Gwrite<CR><CR>
nnoremap <space>gm  :Gmove<Space>
nnoremap <space>gb  :Git branch<Space>
nnoremap <space>go  :Git checkout<Space>
nnoremap <space>gp :!git push<space>
nnoremap <space>gpl :!git pull<space>

""Key Mappings/Commands
inoremap jk <ESC>
vnoremap jk <ESC>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

