" by Joao MC Teixeira
" GitHub @joaomcteixeira
" joaomcteixeira[at]gmail[dot]com
" colorscheme name: CodeWise
" 25/Jun/2020
" https://jonasjacek.github.io/colors/

set bg=light
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "codewise"


" highlights trailing whitespace
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set colorcolumn=72,80

" open :help syntax
" look for keyword group-name
hi Comment           term=NONE  cterm=NONE  ctermfg=139  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Constant          term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
hi String            term=NONE  cterm=NONE  ctermfg=94  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
hi Character         term=NONE  cterm=NONE  ctermfg=94  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
hi Number            term=NONE  cterm=NONE  ctermfg=19  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
hi Boolean           term=NONE  cterm=NONE  ctermfg=54  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Float             term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Identifier        term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
hi Function          term=NONE  cterm=bold  ctermfg=28  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
hi Statement         term=NONE  cterm=NONE  ctermfg=54  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
hi Conditional       term=NONE  cterm=NONE  ctermfg=1  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
hi Repeat            term=NONE  cterm=NONE  ctermfg=1  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Label             term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
hi Operator          term=NONE  cterm=NONE  ctermfg=1  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Keyword           term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
hi Exception         term=NONE  cterm=NONE  ctermfg=1  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi PreProc           term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Include           term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Define            term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Macro             term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi PreCondit         term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Type              term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi StorageClass      term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Structure         term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Typedef           term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Special           term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi SpecialChar       term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Tag               term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Delimiter         term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi SpecialComment    term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Debug             term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Underlined        term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Ignore            term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Error             term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Todo              term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE

" Language Specific
"" Python
highlight pythonDecorator ctermbg=NONE ctermfg=240 cterm=NONE
highlight pythonDecoratorName ctermbg=NONE ctermfg=240 cterm=NONE
highlight pythonBuiltin ctermbg=NONE ctermfg=54 cterm=none


""  open :help syntax
""  look for keyword highlight-groups
hi ColorColumn       term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=248  gui=NONE  guifg=NONE  guibg=NONE
"hi Conceal           term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Cursor            term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi lCursor           term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi CursorIM          term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
hi CursorColumn      term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=14  gui=NONE  guifg=NONE  guibg=NONE
hi CursorLine        term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=14  gui=NONE  guifg=NONE  guibg=NONE
"hi Directory         term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi DiffAdd           term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi DiffChange        term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi DiffDelete        term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi DiffText          term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi EndOfBuffer       term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi ErrorMsg          term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi VertSplit         term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Folded            term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi FoldColumn        term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi SignColumn        term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi IncSearch         term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
hi LineNr            term=NONE  cterm=NONE  ctermfg=248  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi LineNrAbove       term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi LineNrBelow       term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi CursorLineNr      term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi MatchParen        term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi ModeMsg           term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi MoreMsg           term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi NonText           term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
hi Normal            term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=225  gui=NONE  guifg=NONE  guibg=NONE
"hi Pmenu             term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi PmenuSel          term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi PmenuSbar         term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi PmenuThumb        term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Question          term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi QuickFixLine      term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Search            term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
hi SpecialKey        term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=1  gui=NONE  guifg=NONE  guibg=NONE
"hi SpellBad          term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi SpellCap          term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi SpellLocal        term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi SpellRare         term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi StatusLine        term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi StatusLineNC      term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi StatusLineTerm    term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi StatusLineTermNC  term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi TabLine           term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi TabLineFill       term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi TabLineSel        term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Terminal          term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi Title             term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
hi Visual            term=NONE  cterm=reverse  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi VisualNOS         term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi WarningMsg        term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
"hi WildMenu          term=NONE  cterm=NONE  ctermfg=NONE  ctermbg=NONE  gui=NONE  guifg=NONE  guibg=NONE
