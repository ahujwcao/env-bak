set nocompatible
set encoding=utf8

set novisualbell
set visualbell t_vb=

set clipboard=unnamedplus

set number
set ruler
set showcmd
set showmode
set scrolloff=10
set showmatch
set matchtime=0

set hlsearch
set incsearch
set ignorecase
set smartcase

set expandtab
set smarttab
set autoindent
set smartindent
set backspace=indent,eol,start
set tabstop=2
set softtabstop=2
set shiftwidth=2
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType make setlocal noexpandtab

" set list
set list listchars=tab:▸\ ,trail:¬,

syntax on
filetype on
filetype indent on

" vim plugin
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'psf/black', { 'branch': 'stable' }
call plug#end()

" auto enable/disable paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" c/cpp auto format: clang format
function! Formatonsave()
  let l:formatdiff = 1
  py3f /usr/share/vim/addons/syntax/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

" python auto format: black
autocmd BufWritePre *.py execute ':Black'
