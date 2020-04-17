set nocompatible
filetype off 

""Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()

Plug 'VundleVim/Vundle.vim'
Plug 'itchyny/lightline.vim'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'dracula/vim'
Plug 'vimwiki/vimwiki'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
      \ "go"       : "go",
      \ "haskell"  : "ghc",
      \ "html"     : "tidy",
      \ "perl"     : "perl",
      \ "php"      : "php",
      \ "plaintex" : "tex",
      \ "python"   : "pyunit",
      \ "tex"      : "tex",
      \}

let s:makeprg_for_filetype = {
      \ "asm"      : "as -o %<.o % && ld -s -o %< %<.o && rm %<.o && ./%<",
      \ "basic"    : "vintbas %",
      \ "c"        : "clear && gcc -std=gnu11 -g % -lm -o %< && ./%<",
      \ "cpp"      : "clear && g++ -std=gnu++11 -g % -o % && ./%<",
      \ "go"       : "go build && ./%<",
      \ "haskell"  : "ghc -o %< %; rm %<.hi %<.o && ./%<",
      \ "html"     : "tidy -quiet -errors --gnu-emacs yes %:S; firefox -new-window % &",
      \ "lisp"     : "clisp %",
      \ "lua"      : "lua %",
      \ "markdown" : "grip --quiet -b %",
      \ "nasm"     : "nasm -f elf64 -g % && ld -g -o %< %<.o && rm %<.o && ./%<",
      \ "perl"     : "perl %",
      \ "plaintex" : "pdftex -file-line-error -interaction=nonstopmode % <%.pdf",
      \ "python"   : "clear && python %",
      \ "rust"     : "clear && rustc % && ./%<",
      \ "sh"       : "clear && chmod +x %:p && %:p",
      \ "tex"      : "clear && pdflatex % && bibtex report  && pdflatex % && pdflatex %",
      \ "xhtml"    : "tidy -asxhtml -quiet -errors --gnu-emacs yes %:S; brave % &",
      \ "java"     : "clear && javac % && java %",
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
map \g :Goyo<Cr>
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

""Vimwiki
let g:vimwiki_list = [{'path': '~/documents/notes/notes/'}]
let g:vimwiki_list = [{
  \ 'path': '$HOME/documents/notes/notes/',
  \ 'template_path': '$HOME/.vim/plugged/vimwiki/autoload/vimwiki/',
  \ 'template_default': 'default',
  \ 'template_ext': '.tpl'}]

""Calendar.vim
source ~/.cache/calendar.vim/credentials.vim
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1


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

""COC Settings
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif




set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
