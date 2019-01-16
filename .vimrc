set nocompatible

" space leader master race?
noremap <Space> <Nop>
let mapleader = " "

call pathogen#infect()

set termguicolors
set background=dark
syntax on

let g:solarized_old_cursor_style = 1
colorscheme solarized8

" reset solarized spell highlights because changing the colour of already syntax
" highlighted things is rude af. just underlines is good enough thnx.
hi clear SpellBad
hi clear SpellLocal
hi clear SpellCap
hi clear SpellRare
hi SpellBad    guibg=NONE guisp=#6c71c4 cterm=NONE,underline gui=NONE,undercurl
hi SpellCap    guibg=NONE guisp=#6c71c4 cterm=NONE,underline gui=NONE,undercurl
hi SpellLocal  guibg=NONE guisp=#b58900 cterm=NONE,underline gui=NONE,undercurl
hi SpellRare   guibg=NONE guisp=#2aa198 cterm=NONE,underline gui=NONE,undercurl

filetype plugin indent on

" reload files changed outside vim automatically (switching branches, etc)
set autoread

" be quiet
set noeb vb t_vb=

set backspace=2
set cursorline
set nobackup
set noswapfile
set nowritebackup
set nu
set ignorecase
set smartcase
set splitbelow
set splitright
set title

" relative line numbers only in active buffer
set number
set relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * set norelativenumber
augroup END

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

" display extra whitespace
set list listchars=tab:»·,trail:·

set spelllang=en_ca

""" file type specific configuration

" markdown
autocmd BufRead,BufNewFile *.md,*.markdown setlocal textwidth=80 wrap filetype=markdown spell
let g:markdown_fenced_languages = ['html', 'ruby', 'js=javascript', 'json', 'bash=sh', 'graphql']

" ruby
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_block_style = 'do'

" git commits
autocmd FileType gitcommit setlocal spell

" the silver searcher
if executable('ag')
  " use ag instead of grep
  set grepprg=ag\ --nogroup\ --nocolor

  " use ag in ctrlp for listing files. will respect .gitignore by default
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " use ag for ack.vim
  let g:ackprg = 'ag --vimgrep --smart-case'
  cnoreabbrev Ag Ack
endif

" saner ctrlp buffer behaviour
let g:ctrlp_switch_buffer = 'et'

" set working path to nearest ancestor that is a scm checkout
let g:ctrlp_working_path_mode = 'ra'

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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

" use C-a in ex mode to jump to beginning of line, like literally every other
" piece of software in the world
cnoremap <C-a> <C-b>

if has("gui_running")
  set guioptions=-t
  set guifont=Menlo\ for\ Powerline:h14
endif

" use powerline symbols
let g:airline_powerline_fonts = 1

" ale config
nmap <LEADER>af :ALEFix<CR>

let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 1
let g:ale_set_loclist = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
\   'ruby:': ['rubocop', 'ruby'],
\}

let g:ale_fixers = {
\  'ruby': [
\    'remove_trailing_lines',
\    'trim_whitespace',
\    'rubocop'
\  ]
\}
