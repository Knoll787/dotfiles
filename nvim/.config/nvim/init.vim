set nocompatible
filetype off 

""Plugins
call plug#begin()

Plug 'VundleVim/Vundle.vim'
Plug 'itchyny/lightline.vim'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'dracula/vim'
Plug 'vimwiki/vimwiki'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()


""Color Theme
set t_Co=256
set termguicolors
colorscheme dracula 
set laststatus=2


""General System Settings
set number
set textwidth=100
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
      \ "go"       : "go",
      \ "haskell"  : "ghc",
      \ "html"     : "tidy",
      \ "perl"     : "perl",
      \ "php"      : "php",
      \ "plaintex" : "tex",
      \ "python"   : "pyunit",
      \ "tex"      : "tex",
      \ "wiki"     : "wiki",
      \}

let s:makeprg_for_filetype = {
      \ "asm"      : "as -o %<.o % && ld -s -o %< %<.o && rm %<.o && ./%<",
      \ "basic"    : "vintbas %",
      \ "c"        : "gcc -std=gnu11 -g % -o %< && ./%<",
      \ "cpp"      : "g++ -std=gnu++11 -g % -o %< && ./%<",
      \ "go"       : "go build && ./%<",
      \ "haskell"  : "ghc -o %< %; rm %<.hi %<.o && ./%<",
      \ "html"     : "tidy -quiet -errors --gnu-emacs yes %:S; firefox -new-window % &",
      \ "lisp"     : "clisp %",
      \ "lua"      : "lua %",
      \ "markdown" : "grip --quiet -b %",
      \ "nasm"     : "nasm -f elf64 -g % && ld -g -o %< %<.o && rm %<.o && ./%<",
      \ "perl"     : "perl %",
      \ "plaintex" : "pdftex -file-line-error -interaction=nonstopmode % && zathura %<.pdf",
      \ "python"   : "python %",
      \ "rust"     : "rustc % && ./%<",
      \ "sh"       : "chmod +x %:p && %:p",
      \ "tex"      : "pdflatex -file-line-error -interaction=nonstopmode % && zathura %<.pdf",
      \ "xhtml"    : "tidy -asxhtml -quiet -errors --gnu-emacs yes %:S; brave % &",
      \ "wiki"     : "VimwikiAll2HTML",
      \ "java"     : "java %",
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
  set number
  Goyo 100x110%
endfunction
function! s:goyo_leave()
endfunction
map \g :Goyo<Cr>
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

""Vimwiki
let g:vimwiki_list = [{'path': '~/documents/notes/'}]


""Key Mappings/Commands
inoremap jj <ESC>
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

