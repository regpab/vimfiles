set background=light
hi clear

if exists('g:syntax_on')
  syntax reset
endif

let g:colors_name = 'just'
" rerwerew
hi Comment ctermfg=8 cterm=bold
hi Constant ctermfg=0
hi String	ctermfg=2
hi Char	ctermfg=0
hi Number	ctermfg=0
hi Boolean	ctermfg=0
hi Float ctermfg=0
hi Identifier ctermfg=0
hi Function ctermfg=0
hi Statement ctermfg=0
hi Conditional ctermfg=0
hi Repeat ctermfg=0
hi Label ctermfg=0
hi Operator ctermfg=0
hi Keyword ctermfg=0
hi Exception ctermfg=0
hi PreProc ctermfg=0
hi Include ctermfg=0
hi Define ctermfg=0
hi Macro ctermfg=0
hi PreCondit ctermfg=0
hi Type ctermfg=0
hi StorageClass ctermfg=0
hi Structure ctermfg=0
hi Typedef ctermfg=0
hi Special ctermfg=0
hi SpecialChar ctermfg=0
hi Tag ctermfg=0
hi Delimiter ctermfg=0
hi SpecialComment ctermfg=0
hi Debug ctermfg=0
hi Underlined ctermfg=0
hi Ignore ctermfg=0
hi Error ctermfg=1 ctermbg=NONE
hi Todo ctermfg=15 ctermbg=8
hi Added ctermfg=0
hi Changed ctermfg=0
hi Removed ctermfg=0

hi Directory ctermfg=0
hi CursorLine ctermfg=0 ctermbg=15
hi EndOfBuffer ctermfg=0
hi ErrorMsg ctermfg=1 ctermbg=NONE
hi Folded ctermfg=15 ctermbg=8
hi FoldColumn ctermfg=0 ctermbg=NONE
hi SignColumn ctermfg=0 ctermbg=NONE
hi LineNr ctermfg=15 ctermbg=0
hi CursorLineNr ctermfg=0
hi MoreMsg ctermfg=2
hi NonText ctermfg=8
hi PmenuThumb ctermfg=15
hi CurSearch ctermfg=15 ctermbg=0
hi QuickFixLine ctermfg=15 ctermbg=0
hi SpecialKey ctermfg=0
hi WarningMsg ctermfg=1
hi ErrorMsg ctermfg=0
hi Visual ctermbg=8 ctermfg=15
hi StatusLineNC ctermbg=7
hi StatusLineTermNC ctermfg=8

hi ALEErrorSign ctermbg=1
hi ALEWarningSign ctermbg=7
