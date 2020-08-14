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

" ycm
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_show_diagnostics_ui = 0

" c/cpp auto format: clang format
function! FormatFile()
  let l:lines="all"
  let g:clang_format_style = 'Google'
  py3f /usr/share/vim/addons/syntax/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call FormatFile()

" python auto format: black
autocmd BufWritePre *.py execute ':Black'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_check_on_open = 1
" cpplint --verbose=2
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_cpplint_exec = "cpplint"
let g:syntastic_cpp_checkers = ['cpplint', 'gcc']
let g:syntastic_aggregate_errors = 1
let g:syntastic_cpp_compiler_options="-Wall"
