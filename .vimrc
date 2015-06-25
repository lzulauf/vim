" My personal settings

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let $VIMRC_DIR=expand("<sfile>:p:h")
source $VIMRC_DIR/.vimrc_vundle
source $VIMRC_DIR/.vimrc_unite
source $VIMRC_DIR/.vimrc_options
source $VIMRC_DIR/.vimrc_colors
"source $VIMRC_DIR/.vimrc_versioncontrol
source $VIMRC_DIR/.vimrc_cscope
source $VIMRC_DIR/.vimrc_linter
source $VIMRC_DIR/.vimrc_autocmd
source $VIMRC_DIR/.vimrc_snips
source $VIMRC_DIR/.vimrc_functions


" Set quickfix window to span the entire bottom of screen
:botright cwindow

" Line Numbers
function! ToggleLineNumbers()
    if &number == 1
        set relativenumber
        echo "Relative Numbers set"
    else
        if &relativenumber == 1 
            set norelativenumber
            echo "No numbers set"
        else
            set number
            echo "Numbers set"
        endif
    endif
    :redraw!
endfunction

":nmap <C-N> :silent call ToggleLineNumbers()<CR>

" Map Ctrl-Left/Right to previous/next tab
:noremap <C-Right> :tabn<CR>
:inoremap <C-Right> <ESC>:tabn<CR>
:noremap <C-Left> :tabp<CR>
:inoremap <C-Left> <ESC>:tabp<CR>


" Setup find path using cdpath (but replace the spaces with commas)
let &path = ',' . substitute($CDPATH, ':', ',', 'g')
let &cdpath = &path


" Set Tags file
set tags=$CTAGFILE;./tags;


" Copy filename
function! CopyFilename()
    :!/home/lzulauf/scripts/putInClipboard.py %
endfunction
comm! -nargs=0 CopyFilename call CopyFilename()


" gundo
nnoremap <F5> :GundoToggle<CR>

" Jump to directory of current file
function! ChangeDirectoryToCurrentFile()
    exe "lcd %:p:h"
endfunction
comm! -nargs=0 Cd call ChangeDirectoryToCurrentFile()

" Make directory of current file
function! MakeInFileDirectory()
    let l:cwd = getcwd()
    exe "Cd"
    if expand("%:e") == "scss"
        setlocal makeprg=/usr/bin/sass\ \"%\"\ \"%:p:h/../css/%:p:t:r.css\"
    endif
    exe "make!"
    "exe "!makebg" v:servername "'" . &makeprg . "'" &makeef
    exe "normal \<Esc>"
    exe "lcd ".l:cwd
endfunction

" This will run make in the background
" Caveat: you need to run cgetfile regularly to update the window while the build is in progress
" Caveat: you don't get a system beep when the build is done
function! MakeInFileDirectory_Background()
    exe "Cd"
    exe "silent! !scons -u $SCCACHE_ENABLE PX_OPTLEVEL=$FLAVOR_MODE &> ~/tmp/build_output &"
    exe "cgetfile ~/tmp/build_output"
    exe "copen"
endfunction
comm! -nargs=0 Make call MakeInFileDirectory()


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



" Used for filtering menv30 trace dumps.  This folds any line that starts 
" with "spaces" number of spaces at the start of the line.
function! FilterTrace(spaces)
    let x='^'
    let l:count=0
    while l:count < a:spaces
        let x = x . '\ '    
        let l:count = l:count + 1
    endwhile
    let x = x . '.*$'
    exe "set foldexpr=getline(v:lnum)=~\'" . x . "\'"
    set foldmethod=expr
endfunction

" Signify options
let g:signify_vcs_list = ['git', 'perforce']

" TODO - this doesn't work right, yet
function! CustomCompile(makeprg, errorformat)
    let oldMakeprg = &makeprg
    let oldErrorFormat = &efm
    set makeprg=&a:makeprg
    set efm=&a:errorformat
    exe "Cd"
    exe "make!"
    let &makeprg=l:oldMakeprg
    set efm=&oldErrorFormat
endfunction



" Paste escaped characters into command buffer
" I never got this working... originally found at:
" http://facebook.stackoverflow.com/questions/7400743/create-a-mapping-for-vims-command-line-that-escapes-the-contents-of-a-register
"function! s:PasteEscaped()
"  " show some kind of feedback
"  echo ":".getcmdline()."..."
"
"  " get a character from the user
"  let char = getchar()
"
"  if char == "\<esc>"
"    return ''
"  else
"    let register_content = getreg(nr2char(char))
"    return escape(register_content, '/')
"  endif
"endfunction
"cnoremap <c-d> <SID>PasteEscaped()<CR>

" Vimwiki
" Enable syntax highlighting of checked checkboxes
let g:vimwiki_hl_cb_checked=1
" Disable folding
let g:vimwiki_folding=0
" Disable auto-linking
let g:vimwiki_camel_case=0
" Enable chome usage
let g:vimwiki_browsers=['google-chrome', 'firefox', 'chromium']
" Disable hilighting of non-existent wiki links
if !exists("g:vimwiki_list")
    let g:vimwiki_list = [{'path' : '~/Dropbox/vimwiki', 'path_html' : '~/Dropbox/vimwiki_html', 'maxhi': 0}]
endif

" It looks like g:vimwiki_browsers no longer works. I can redefine the 
" WeblinkHandler to open up chrome explicitly
function! VimwikiWeblinkHandler(weblink) 
    let browser = '/usr/bin/google-chrome'
    execute '!'.browser.' "'.a:weblink.'"'
endfunction 

" Special Vimwiki Syntax hilighting
function! VimwikiColors()
    hi! link VimwikiHeader1 Type
    hi! link VimwikiHeader2 Statement
    hi! link VimwikiHeader3 vimHiGroup
    hi! link VimwikiHeader4 vimCommentString
endfunction

" Allow indenting during edit
"imap >> <esc>:normal mz>><CR>`zlllla
"imap << <esc>:normal mz<<<CR>`zhhhha

" nerd commenter setup
let g:NERDCustomDelimiters = {
    \ 'html': { 'left': '<!-- ', 'right': '-->', 'leftAlt': '{#', 'rightAlt': '#}' }
    \ }
let g:NERDSpaceDelims=1

if !has("win32")
    function! XmlPretty()
        :1,$ !xmllint --format -
    endfunction
    command! XmlPretty call XmlPretty()

    function! JsonPretty()
      :1,$ !python -m json.tool
    endfunction
    command! JsonPretty call JsonPretty()
endif

" Displays the syntax hilight in the status line
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction
"set statusline+=%{SyntaxItem()}
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


" quickfixsigns setup
"let g:quickfixsigns_classes = ['qfl', 'loc', 'marks', 'vcsdiff', 'breakpoints']
let g:quickfixsigns_classes = ['qfl', 'loc', 'marks', 'breakpoints']

" Multiple Cursor Setup
" Make C-n default to match whole words, (and make g<C-n> match non-word boundaries)
let g:multi_cursor_start_key='g<C-n>'
let g:multi_cursor_start_word_key='<C-n>'
" Allow normal mode leader keys to work (such as camelCaseMotion and delete motions)
let g:multi_cursor_normal_maps={',':1, 'd':1, 'g':1}

