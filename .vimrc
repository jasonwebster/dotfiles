set nocompatible


call pathogen#infect()

set t_Co=256
set background=dark
syntax on
colorscheme solarized

filetype plugin indent on

set cursorline
set expandtab
set noerrorbells
set novisualbell
set nowrap
set nu
set shiftwidth=2
set tabstop=2


if has("gui_running")
  set guioptions=-t
  set guifont=Menlo\ Regular:h12
endif
