" options.vim - My Vim options
" Maintainer:   Ole Kristian Sunde <ole.sunde@gmail.com>
" Version:      0.1

if exists('g:loaded_options') || &compatible
  finish
else
  let g:loaded_options = 1
endif

set nowrap
set list
set expandtab ts=4 sw=4 ai
set number
set hlsearch
set visualbell

set fileformat=unix

function! s:EnsureDirExists(dir)
  if empty(glob(a:dir))
    call system("mkdir -p " . a:dir)
  endif
endfunction

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set textwidth=80
set cursorline
set cursorcolumn
set colorcolumn=+1

call s:EnsureDirExists(&backupdir)
call s:EnsureDirExists(&directory)
call s:EnsureDirExists(&undodir)

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
	\	if &omnifunc == "" |
	\		setlocal omnifunc=syntaxcomplete#Complete |
	\	endif
endif

