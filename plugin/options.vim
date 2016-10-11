" options.vim - My Vim options
" Maintainer:   Ole Kristian Sunde <ole.sunde@gmail.com>
" Version:      0.1

if exists('g:loaded_options') || &compatible
  finish
else
  let g:loaded_options = 1
endif

" Spaces and Tabs {{{
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
" }}}

" UI Config {{{
set number                          " show line numbers
set cursorline                      " highlight current line
set cursorcolumn
set colorcolumn=+1
filetype indent on                  " load filetype-specific indent files
set wildmenu                        " visual automcomplete for command menu
set lazyredraw                      " redraw only when we need to
set showmatch
" }}}

" Searching {{{
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" Folding {{{
set foldenable                      " enable folding
set foldlevelstart=10               " open most folds by default
set foldnestmax=10                  " 10 nested fold max
nnoremap <space> za
set foldmethod=indent               " fold based on indent level
" }}}

" CtrlP settings {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --no-color --hidden -g ""'
" }}}

set nowrap
set list
set visualbell

set fileformat=unix

function! s:EnsureDirExists(dir)
  if empty(glob(a:dir))
    call system("mkdir -p " . a:dir)
  endif
endfunction

" Backups
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set textwidth=80

set modelines=1

call s:EnsureDirExists(&backupdir)
call s:EnsureDirExists(&directory)
call s:EnsureDirExists(&undodir)

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
	\	if &omnifunc == "" |
	\		setlocal omnifunc=syntaxcomplete#Complete |
	\	endif
endif

" vim:foldmethod=marker:foldlevel=0
