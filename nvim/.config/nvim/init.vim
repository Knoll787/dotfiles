set nocompatible
filetype off 
set rtp+=~/.config/nvim/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'dracula/vim'

call vundle#end()

filetype plugin indent on

"Color Theme
set t_Co=256
set termguicolors
colorscheme dracula 
set laststatus=2


"General System Settings
set number
syntax on  
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cursorline
set showmatch
set wildmode=longest:full,full


"Goyo
function! s:goyo_enter()
  set number
  Goyo 100x110%
endfunction

function! s:goyo_leave()
endfunction
map \g :Goyo<Cr>
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


"Key Mappings/Commands
inoremap jj <ESC>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

inoremap " ""<left>
"inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

map <F9> :w<CR>:!python %<CR>
map <F10> :w<CR>:!pdflatex %<CR>
map <F12> <ESC>:w!<CR>

