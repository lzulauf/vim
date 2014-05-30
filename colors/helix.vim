" Vim color file by Jörn Horstmann <joern_h@gmx.net>
" Light background in GUI, dark background in Console
" Last change 16.07.2004
" TODO

set bg=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "jhdark"

hi Normal         guifg=#999999 guibg=#000000 gui=none ctermfg=gray     ctermbg=none     cterm=none

hi ErrorMsg       guifg=#ff0000 guibg=none    gui=none ctermfg=red      ctermbg=none     cterm=none
hi Visual         guifg=none    guibg=#4444aa gui=none ctermfg=none     ctermbg=darkcyan cterm=none
hi VisualNOS      guifg=none    guibg=#4444aa gui=none ctermfg=none     ctermbg=darkcyan cterm=none
hi Todo           guifg=none    guibg=#aaaa00 gui=none ctermfg=none     ctermbg=yellow   cterm=none
"hi Todo          guifg=#884400 guibg=none    gui=none ctermfg=none     ctermbg=yellow   cterm=none
hi Search         guifg=none    guibg=#8888ee gui=none ctermfg=none     ctermbg=darkblue     cterm=none
hi IncSearch      guifg=none    guibg=#8888ee gui=none ctermfg=none     ctermbg=darkblue     cterm=none

hi SpecialKey     guifg=#775522 guibg=none    gui=none ctermfg=darkmagenta  ctermbg=none     cterm=none
hi Directory      guifg=#000088 guibg=none    gui=none ctermfg=blue     ctermbg=none     cterm=none
hi WarningMsg     guifg=#ff0000 guibg=none    gui=none ctermfg=red      ctermbg=none     cterm=none
hi WildMenu       guifg=none    guibg=#ffff00 gui=none ctermfg=none     ctermbg=yellow   cterm=none
hi ModeMsg        guifg=fg      guibg=none    gui=none ctermfg=fg       ctermbg=none     cterm=none
hi Title          guifg=fg      guibg=#cccccc gui=none ctermfg=black    ctermbg=darkgray cterm=none
hi MoreMsg        guifg=fg      guibg=none    gui=none ctermfg=blue     ctermbg=fg       cterm=none
hi Question       guifg=fg      guibg=none    gui=none ctermfg=blue     ctermbg=fg       cterm=none
hi NonText        guifg=#666666 guibg=none    gui=none ctermfg=fg       ctermbg=none     cterm=none

hi StatusLine     guifg=#dddddd guibg=#000088 gui=none ctermfg=white    ctermbg=darkblue cterm=none
hi StatusLineNC   guifg=#dddddd guibg=#333333 gui=none ctermfg=none     ctermbg=darkgray cterm=none
hi VertSplit      guifg=#dddddd guibg=#333333 gui=none ctermfg=none     ctermbg=darkgray cterm=none

hi Folded         guifg=#bb0099 guibg=#222222 gui=none ctermfg=darkmagenta ctermbg=none cterm=none
hi FoldColumn     guifg=#bb0099 guibg=#222222 gui=none ctermfg=darkmagenta ctermbg=none cterm=none
hi SignColumn     guifg=#bb0099 guibg=#222222 gui=none ctermfg=darkmagenta ctermbg=none cterm=none
hi LineNr         guifg=#bb0099 guibg=#222222 gui=none ctermfg=darkmagenta ctermbg=none cterm=none

"hi Folded         guifg=#dddddd guibg=#666666 gui=none ctermfg=darkmagenta ctermbg=none cterm=none
"hi FoldColumn     guifg=#dddddd guibg=#666666 gui=none ctermfg=darkmagenta ctermbg=none cterm=none
"hi SignColumn     guifg=#dddddd guibg=#666666 gui=none ctermfg=darkmagenta ctermbg=none cterm=none
"hi LineNr         guifg=#dddddd guibg=#666666 gui=none ctermfg=darkmagenta ctermbg=none cterm=none

hi DiffChange     guifg=none    guibg=#888800 gui=none ctermfg=none     ctermbg=brown      cterm=none
hi DiffAdd        guifg=none    guibg=#000088 gui=none ctermfg=none     ctermbg=darkblue   cterm=none
hi DiffDelete     guifg=none    guibg=#880000 gui=none ctermfg=none     ctermbg=darkred    cterm=none
hi DiffText       guifg=fg      guibg=#dd0000 gui=none ctermfg=fg       ctermbg=red        cterm=none

hi Cursor         guifg=none    guibg=fg      gui=none ctermfg=none     ctermbg=fg         cterm=none
hi lCursor        guifg=none    guibg=fg      gui=none ctermfg=none     ctermbg=fg         cterm=none

hi Comment        guifg=#008800 guibg=none    gui=none ctermfg=darkblue  ctermbg=none   cterm=none
hi Operator       guifg=fg      guibg=none    gui=none ctermfg=fg         ctermbg=none   cterm=none
hi Constant       guifg=#aa0000 guibg=none    gui=none ctermfg=blue    ctermbg=none   cterm=none
hi Special        guifg=#997700 guibg=none    gui=none ctermfg=magenta      ctermbg=none   cterm=none

hi Identifier     guifg=#dddddd guibg=none    gui=none ctermfg=white    ctermbg=none  cterm=none

hi Type           guifg=#6666dd guibg=none    gui=none ctermfg=cyan     ctermbg=none  cterm=none
hi Statement      guifg=#dddddd guibg=none    gui=none ctermfg=cyan    ctermbg=none  cterm=none

hi PreProc        guifg=#008888 guibg=none    gui=none ctermfg=darkcyan ctermbg=none  cterm=none

hi Error          guifg=fg      guibg=#ff0000 gui=none ctermfg=none     ctermbg=red   cterm=none

hi Ignore         guifg=none    ctermfg=none 
hi Underlined     guifg=fg      guibg=none ctermfg=fg ctermbg=none cterm=underline term=underline gui=underline
