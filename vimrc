" My personal settings

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let g:deoplete#enable_at_startup = 1
" Use space key for leader
let mapleader = " "

" 1. Get the absolute path of the script
" 2. Resolve symbolic links
" 3. Get the folder of the resolved absolute file
let $VIMRC_DIR=fnamemodify(resolve(expand('<sfile>:p')), ':h')
source $VIMRC_DIR/vimrc_vundle
"source $VIMRC_DIR/vimrc_unite
source $VIMRC_DIR/vimrc_deoplete
source $VIMRC_DIR/vimrc_ale
source $VIMRC_DIR/vimrc_options
source $VIMRC_DIR/vimrc_colors
source $VIMRC_DIR/vimrc_vimwiki
source $VIMRC_DIR/vimrc_linter
source $VIMRC_DIR/vimrc_autocmd
source $VIMRC_DIR/vimrc_snips
source $VIMRC_DIR/vimrc_functions
source $VIMRC_DIR/vimrc_nerdcommenter
source $VIMRC_DIR/vimrc_ack
source $VIMRC_DIR/vimrc_ctrlp
"source $VIMRC_DIR/vimrc_ycm

"source $VIMRC_DIR/vimrc_cscope " TODO investigate neovim on quit caused by this
"source $VIMRC_DIR/vimrc_debug
"source $VIMRC_DIR/vimrc_linenumbers
"source $VIMRC_DIR/vimrc_make
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
