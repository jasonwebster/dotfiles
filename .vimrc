set nocompatible

set noerrorbells
set novisualbell

set nowrap

set nu

call pathogen#infect()
syntax on
set background=dark
colorscheme solarized
set t_Co=256

filetype plugin indent on

set tabstop=2
set shiftwidth=2
set expandtab

if has("gui_running")
  set guioptions=-t
endif
