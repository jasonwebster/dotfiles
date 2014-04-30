set nocompatible


call pathogen#infect()

set t_Co=256
set background=dark
syntax on
colorscheme solarized

filetype plugin indent on

set colorcolumn=80
set cursorline
set expandtab
set noerrorbells
set noswapfile
set novisualbell
set nowrap
set nu
set shiftwidth=2
set splitbelow
set splitright
set tabstop=2
set title


" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


if has("gui_running")
  set guioptions=-t
  set guifont=Menlo\ Regular:h12
endif
