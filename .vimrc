set nocompatible

" space leader master race?
let mapleader = " "

call pathogen#infect()

set t_Co=256
set background=dark
syntax on
colorscheme solarized

filetype plugin indent on

set backspace=2
set cursorline
set nobackup
set noerrorbells
set noswapfile
set novisualbell
set nowritebackup
set nu
set splitbelow
set splitright
set title

" generic indentation
set expandtab
set tabstop=2
set shiftwidth=2

set nowrap
set textwidth=80
set colorcolumn=+1

" markdown specific
au BufRead,BufNewFile *.md,*.markdown setlocal textwidth=80 wrap filetype=markdown

" display extra whitespace
set list listchars=tab:»·,trail:·

" navigate splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" yeah, why not
nnoremap <Left> :echoe "omg use h"<CR>
nnoremap <Right> :echoe "omg use l"<CR>
nnoremap <Up> :echoe "omg use k"<CR>
nnoremap <Down> :echoe "omg use j"<CR>

if has("gui_running")
  set guioptions=-t
  set guifont=Menlo\ for\ Powerline:h13
endif
