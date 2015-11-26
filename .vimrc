set nocompatible

" space leader master race?
let mapleader = " "

call pathogen#infect()

set t_Co=256
set background=dark
syntax on
colorscheme solarized

filetype plugin indent on

" reload files changed outside vim automatically (switching branches, etc)
set autoread
set backspace=2
set cursorline
set nobackup
set noerrorbells
set noswapfile
set novisualbell
set nowritebackup
set nu
set smartcase
set splitbelow
set splitright
set title

" why oh why would anyone want these?
if exists('+ballooneval')
  set noballooneval
endif
let g:netrw_nobeval=1

" always show the statusline
set laststatus=2

" generic indentation
set expandtab
set tabstop=2
set shiftwidth=2

set nowrap
set textwidth=80
set colorcolumn=+1

set formatoptions=tcqrol

" markdown specific
au BufRead,BufNewFile *.md,*.markdown setlocal textwidth=80 wrap filetype=markdown

" display extra whitespace
set list listchars=tab:»·,trail:·

" the silver searcher
if executable('ag')
  " use ag instead of grep
  set grepprg=ag\ --nogroup\ --nocolor

  " use ag in ctrlp for listing files. will respect .gitignore by default
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

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

" unmap F1 so I stop opening help all the damn time
nmap <F1> <nop>
imap <F1> <nop>

if has("gui_running")
  set guioptions=-t
  set guifont=Menlo\ for\ Powerline:h14
endif
