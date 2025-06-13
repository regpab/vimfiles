set background=dark
hi clear

if exists('g:syntax_on')
  syntax reset
endif

let g:colors_name = 'justdark'
hi Normal ctermbg=0 ctermfg=2*
hi Comment ctermfg=9 cterm=bold
hi Constant ctermfg=2*
hi String	ctermfg=1
hi Char	ctermfg=2*
hi Number	ctermfg=2*
hi Boolean	ctermfg=2*
hi Float ctermfg=2*
hi Identifier ctermfg=2*
hi Function ctermfg=2*
hi Statement ctermfg=2*
hi Conditional ctermfg=2*
hi Repeat ctermfg=2*
hi Label ctermfg=2*
hi Operator ctermfg=2*
hi Keyword ctermfg=2*
hi Exception ctermfg=2*
hi PreProc ctermfg=2*
hi Include ctermfg=2*
hi Define ctermfg=2*
hi Macro ctermfg=2*
hi PreCondit ctermfg=2*
hi Type ctermfg=2*
hi StorageClass ctermfg=2*
hi Structure ctermfg=2*
hi Typedef ctermfg=2*
hi Special ctermfg=2*
hi SpecialChar ctermfg=2*
hi Tag ctermfg=2*
hi Delimiter ctermfg=2*
hi SpecialComment ctermfg=2*
hi Debug ctermfg=2*
hi Underlined ctermfg=2*
hi Ignore ctermfg=2*
hi Error ctermfg=2* ctermbg=NONE
hi Todo ctermfg=0 ctermbg=10
hi Added ctermfg=2*
hi Changed ctermfg=2*
hi Removed ctermfg=2*

hi MatchParen ctermfg=0 ctermbg=10
hi Directory ctermfg=2
hi CursorLine ctermfg=2 ctermbg=0*
hi EndOfBuffer ctermfg=2
hi ErrorMsg ctermfg=2* ctermbg=NONE
hi Folded ctermfg=9 ctermbg=0
hi FoldColumn ctermfg=2* ctermbg=NONE
hi SignColumn ctermfg=2* ctermbg=NONE
hi LineNr ctermfg=2 ctermbg=0
hi CursorLineNr ctermfg=2 cterm=bold
hi MoreMsg ctermfg=2
hi NonText ctermfg=9
hi PmenuThumb ctermfg=2*
hi CurSearch ctermfg=0 ctermbg=3
hi Search ctermfg=0 ctermbg=10
hi QuickFixLine ctermfg=0 ctermbg=10
hi SpecialKey ctermfg=2*
hi WarningMsg ctermfg=2*
hi ErrorMsg ctermfg=2*
hi Visual ctermbg=3 ctermfg=0
hi Statusline ctermbg=0 ctermfg=2 cterm=italic
hi StatusLineNC ctermbg=10 ctermfg=0 
hi StatusLineTerm ctermbg=0 ctermfg=1 cterm=italic
hi StatusLineTermNC ctermbg=0 ctermfg=9 

hi SpellBad ctermfg=0 ctermbg=1
hi SpellCap ctermfg=0 ctermbg=2
hi SpellRare ctermfg=0 ctermbg=11
hi SpellLocal ctermfg=0 ctermbg=3

hi Pmenu ctermfg=2 ctermbg=0
hi PmenuSel ctermfg=0 ctermbg=2
hi PmenuSbar ctermfg=2 ctermbg=0
hi PmenuThumb ctermfg=2 ctermbg=2

hi DiffAdd ctermfg=0 ctermbg=10
hi DiffChange ctermfg=0 ctermbg=11
hi DiffDelete ctermfg=0 ctermbg=9
hi DiffText ctermfg=3 ctermbg=0 cterm=italic
hi DiffTextAdd ctermfg=0 ctermbg=2

hi ALEErrorSign ctermbg=1 ctermfg=0
hi ALEWarningSign ctermbg=2 ctermfg=0
