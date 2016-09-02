" My personal settings

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let $VIMRC_DIR=expand("<sfile>:p:h")
source $VIMRC_DIR/.vimrc_vundle
source $VIMRC_DIR/.vimrc_unite
source $VIMRC_DIR/.vimrc_options
source $VIMRC_DIR/.vimrc_colors
source $VIMRC_DIR/.vimrc_cscope
source $VIMRC_DIR/.vimrc_vimwiki
source $VIMRC_DIR/.vimrc_linter
source $VIMRC_DIR/.vimrc_autocmd
source $VIMRC_DIR/.vimrc_snips
source $VIMRC_DIR/.vimrc_functions
source $VIMRC_DIR/.vimrc_nerdcommenter

"source $VIMRC_DIR/.vimrc_versioncontrol
"source $VIMRC_DIR/.vimrc_make
"source $VIMRC_DIR/.vimrc_snipmate
"source $VIMRC_DIR/.vimrc_debug
"source $VIMRC_DIR/.vimrc_pretty
"source $VIMRC_DIR/.vimrc_linenumbers

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


" quickfixsigns setup
"let g:quickfixsigns_classes = ['qfl', 'loc', 'marks', 'vcsdiff', 'breakpoints']
let g:quickfixsigns_classes = ['qfl', 'loc', 'marks', 'breakpoints']

" Multiple Cursor Setup
" Make C-n default to match whole words, (and make g<C-n> match non-word boundaries)
let g:multi_cursor_start_key='g<C-n>'
let g:multi_cursor_start_word_key='<C-n>'
" Allow normal mode leader keys to work (such as camelCaseMotion and delete motions)
let g:multi_cursor_normal_maps={',':1, 'd':1, 'g':1}

