" My personal settings

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Use space key for leader
let mapleader = " "

" Set neovim to use the special neovim virtualenvs
" This is disabled if a virtualenv is active because of a bug in jedi that
" doesn't always honor VIRTUAL_ENV and instead uses the python_host_prog
" For now I'll just install neovim into each virtualenv :(
" See https://github.com/davidhalter/jedi-vim/issues/722
" If would be slightly better if this knew which python version the virtual_env
" used and only set the other version...
" let python_version = system('python --version')
" if empty($VIRTUAL_ENV) || python_version =~ "Python 2"
"   let g:python3_host_prog = $NVIM_PY3_PROG
" endif
" if empty($VIRTUAL_ENV) || python_version =~ "Python 3"
"   let g:python_host_prog = $NVIM_PY2_PROG
" endif

" Just let vim find python natively for now
"let g:python_host_prog = $NVIM_PY2_PROG
let g:python3_host_prog = "/home/aurelia/.pyenv/versions/aurelia/bin/python"

" Set make to run our linter
set makeprg=flake8

" 1. Get the absolute path of the script
" 2. Resolve symbolic links
" 3. Get the folder of the resolved absolute file
let $VIMRC_DIR=fnamemodify(resolve(expand('<sfile>:p')), ':h')
"source $VIMRC_DIR/vimrc_vundle
source $VIMRC_DIR/vimrc_plug
source $VIMRC_DIR/vimrc_airline
"source $VIMRC_DIR/vimrc_unite
"source $VIMRC_DIR/vimrc_deoplete
source $VIMRC_DIR/vimrc_ale
source $VIMRC_DIR/vimrc_options
source $VIMRC_DIR/vimrc_colors
"source $VIMRC_DIR/vimrc_vimwiki
source $VIMRC_DIR/vimrc_wiki
source $VIMRC_DIR/vimrc_lists
source $VIMRC_DIR/vimrc_linter
source $VIMRC_DIR/vimrc_autocmd
source $VIMRC_DIR/vimrc_snips
source $VIMRC_DIR/vimrc_functions
source $VIMRC_DIR/vimrc_nerdcommenter
source $VIMRC_DIR/vimrc_ack
source $VIMRC_DIR/vimrc_ctrlp
"source $VIMRC_DIR/vimrc_ycm

source $VIMRC_DIR/vimrc_cscope " TODO investigate neovim on quit caused by this
"source $VIMRC_DIR/vimrc_debug
"source $VIMRC_DIR/vimrc_linenumbers
source $VIMRC_DIR/vimrc_make
"source $VIMRC_DIR/vimrc_pretty
"source $VIMRC_DIR/vimrc_snipmate
"source $VIMRC_DIR/vimrc_versioncontrol

" Set quickfix window to span the entire bottom of screen
:botright cwindow


" Setup find path using cdpath (but replace the spaces with commas)
" let &path = ',' . substitute($CDPATH, ':', ',', 'g')
" let &cdpath = &path


" Set Tags file
" set tags=$CTAGFILE;./tags;


" Copy filename
function! CopyFilename()
    :!/home/lzulauf/scripts/putInClipboard.py %
endfunction
comm! -nargs=0 CopyFilename call CopyFilename()


" Add blank line commands
map <A-j> :put =''<CR>
map <A-k> :put! =''<CR>
function! ClearLine()
    :s/^.*$//
endfunction
map <A-l> :call ClearLine()<CR>

" Highlight current word without jumping to next match
function! Auto_Highlight_Cword()
    if "\\<".expand("<cword>")."\\>" == @/
        " TODO Figure out how to run nohighlight in this context
    else
        exe "let @/='\\<".expand("<cword>")."\\>'"
    endif
endfunction
noremap <silent> <leader><space> :call Auto_Highlight_Cword()<cr>:set hlsearch<cr>
noremap <silent> <leader>n :noh<Bar>echo<CR>


" Allow indenting during edit
"imap >> <esc>:normal mz>><CR>`zlllla
"imap << <esc>:normal mz<<<CR>`zhhhha
