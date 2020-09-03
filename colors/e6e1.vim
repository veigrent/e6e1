" -----------------------------------------------------------------------------
" File: e6e1.vim
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='e6e1'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:SCH_bold')
  let g:SCH_bold=1
endif
if !exists('g:SCH_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:SCH_italic=0
  else
    let g:SCH_italic=0
  endif
endif
if !exists('g:SCH_undercurl')
  let g:SCH_undercurl=1
endif
if !exists('g:SCH_underline')
  let g:SCH_underline=1
endif
if !exists('g:SCH_inverse')
  let g:SCH_inverse=0
endif

if !exists('g:SCH_guisp_fallback') || index(['fg', 'bg'], g:SCH_guisp_fallback) == -1
  let g:SCH_guisp_fallback='NONE'
endif

if !exists('g:SCH_improved_strings')
  let g:SCH_improved_strings=0
endif

if !exists('g:SCH_improved_warnings')
  let g:SCH_improved_warnings=0
endif

if !exists('g:SCH_termcolors')
  let g:SCH_termcolors=256
endif

if !exists('g:SCH_invert_indent_guides')
  let g:SCH_invert_indent_guides=0
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:gb = {}

" fill it with absolute colors
let s:gb.dark0       = ['#28282d', 235]
let s:gb.dark1       = ['#3c3c41', 237]
let s:gb.dark2       = ['#505055', 239]
let s:gb.dark3       = ['#646469', 241]
let s:gb.dark4       = ['#78787d', 243]
let s:gb.dark4_256   = ['#78787d', 243]

let s:gb.gray_245    = ['#909095', 245]
let s:gb.gray_244    = ['#909095', 244]

let s:gb.light0      = ['#e6e6e1', 229]
let s:gb.light1      = ['#dcdcd7', 223]
let s:gb.light2      = ['#d2d2cd', 250]
let s:gb.light3      = ['#c8c8c3', 248]
let s:gb.light4      = ['#bebeb9', 246]
let s:gb.light4_256  = ['#bebeb9', 246]

let s:gb.bright_red     = ['#d75f5f', 167]
let s:gb.bright_green   = ['#afaf00', 142]
let s:gb.bright_yellow  = ['#ffaf00', 214]
let s:gb.bright_blue    = ['#87afaf', 109]
let s:gb.bright_purple  = ['#d787af', 175]
let s:gb.bright_aqua    = ['#87af87', 108]
let s:gb.bright_orange  = ['#ff8700', 208]

let s:gb.neutral_red    = ['#af0000', 124]
let s:gb.neutral_green  = ['#87af00', 106]
let s:gb.neutral_yellow = ['#d78700', 172]
let s:gb.neutral_blue   = ['#5f8787', 66]
let s:gb.neutral_purple = ['#af5f87', 132]
let s:gb.neutral_aqua   = ['#5faf87', 72]
let s:gb.neutral_orange = ['#d75f00', 166]

let s:gb.faded_red      = ['#870000', 88]
let s:gb.faded_green    = ['#228635', 100]
let s:gb.faded_yellow   = ['#276678', 136]
let s:gb.faded_blue     = ['#005cc0', 24]
let s:gb.faded_purple   = ['#855080', 96]
let s:gb.faded_aqua     = ['#178688', 66]
let s:gb.faded_orange   = ['#af5f00', 130]

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:SCH_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:SCH_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:SCH_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:SCH_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:SCH_inverse == 0
  let s:inverse = ''
endif

let s:search = 'inverse,'
let s:cursor = 'inverse,'

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:gb.dark0

  let s:bg1  = s:gb.dark1
  let s:bg2  = s:gb.dark2
  let s:bg3  = s:gb.dark3
  let s:bg4  = s:gb.dark4

  let s:gray = s:gb.gray_245

  let s:fg0 = s:gb.light0
  let s:fg1 = s:gb.light1
  let s:fg2 = s:gb.light2
  let s:fg3 = s:gb.light3
  let s:fg4 = s:gb.light4

  let s:fg4_256 = s:gb.light4_256

  let s:red    = s:gb.bright_red
  let s:green  = s:gb.bright_green
  let s:yellow = s:gb.bright_yellow
  let s:blue   = s:gb.bright_blue
  let s:purple = s:gb.bright_purple
  let s:aqua   = s:gb.bright_aqua
  let s:orange = s:gb.bright_orange
else
  let s:bg0  = s:gb.light0

  let s:bg1  = s:gb.light1
  let s:bg2  = s:gb.light2
  let s:bg3  = s:gb.light3
  let s:bg4  = s:gb.light4

  let s:gray = s:gb.gray_244

  let s:fg0 = s:gb.dark0
  let s:fg1 = s:gb.dark1
  let s:fg2 = s:gb.dark2
  let s:fg3 = s:gb.dark3
  let s:fg4 = s:gb.dark4

  let s:fg4_256 = s:gb.dark4_256

  let s:red    = s:gb.faded_red
  let s:green  = s:gb.faded_green
  let s:yellow = s:gb.faded_yellow
  let s:blue   = s:gb.faded_blue
  let s:purple = s:gb.faded_purple
  let s:aqua   = s:gb.faded_aqua
  let s:orange = s:gb.faded_orange
endif

" reset to 16 colors fallback
if g:SCH_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:gb.bg0 = s:bg0
let s:gb.bg1 = s:bg1
let s:gb.bg2 = s:bg2
let s:gb.bg3 = s:bg3
let s:gb.bg4 = s:bg4

let s:gb.gray = s:gray

let s:gb.fg0 = s:fg0
let s:gb.fg1 = s:fg1
let s:gb.fg2 = s:fg2
let s:gb.fg3 = s:fg3
let s:gb.fg4 = s:fg4

let s:gb.fg4_256 = s:fg4_256

let s:gb.red    = s:red
let s:gb.green  = s:green
let s:gb.yellow = s:yellow
let s:gb.blue   = s:blue
let s:gb.purple = s:purple
let s:gb.aqua   = s:aqua
let s:gb.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:gb.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:gb.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:gb.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:gb.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:gb.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:gb.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:SCH_hls_cursor')
  let s:hls_cursor = get(s:gb, g:SCH_hls_cursor)
endif

let s:number_column = s:none
if exists('g:SCH_number_column')
  let s:number_column = get(s:gb, g:SCH_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:SCH_sign_column')
    let s:sign_column = get(s:gb, g:SCH_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:SCH_color_column')
  let s:color_column = get(s:gb, g:SCH_color_column)
endif

let s:vert_split = s:bg0
if exists('g:SCH_vert_split')
  let s:vert_split = get(s:gb, g:SCH_vert_split)
endif

let s:invert_signs = ''
if exists('g:SCH_invert_signs')
  if g:SCH_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:SCH_invert_selection')
  if g:SCH_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:SCH_invert_tabline')
  if g:SCH_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:SCH_italicize_comments')
  if g:SCH_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:SCH_italicize_strings')
  if g:SCH_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:SCH_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:SCH_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" MY_ Hi Groups: {{{

" memoize common hi groups
call s:HL('MY_Fg0', s:fg0)
call s:HL('MY_Fg1', s:fg1)
call s:HL('MY_Fg2', s:fg2)
call s:HL('MY_Fg3', s:fg3)
call s:HL('MY_Fg4', s:fg4)
call s:HL('MY_Gray', s:gray)
call s:HL('MY_Bg0', s:bg0)
call s:HL('MY_Bg1', s:bg1)
call s:HL('MY_Bg2', s:bg2)
call s:HL('MY_Bg3', s:bg3)
call s:HL('MY_Bg4', s:bg4)

call s:HL('MY_Red', s:red)
call s:HL('MY_RedBold', s:red, s:none, s:bold)
call s:HL('MY_Green', s:green)
call s:HL('MY_GreenBold', s:green, s:none, s:bold)
call s:HL('MY_Yellow', s:yellow)
call s:HL('MY_YellowBold', s:yellow, s:none, s:bold)
call s:HL('MY_Blue', s:blue)
call s:HL('MY_BlueBold', s:blue, s:none, s:bold)
call s:HL('MY_Purple', s:purple)
call s:HL('MY_PurpleBold', s:purple, s:none, s:bold)
call s:HL('MY_Aqua', s:aqua)
call s:HL('MY_AquaBold', s:aqua, s:none, s:bold)
call s:HL('MY_Orange', s:orange)
call s:HL('MY_OrangeBold', s:orange, s:none, s:bold)

call s:HL('MY_RedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('MY_GreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('MY_YellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('MY_BlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('MY_PurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('MY_AquaSign', s:aqua, s:sign_column, s:invert_signs)
call s:HL('MY_OrangeSign', s:orange, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/MY_/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText MY_Bg2
hi! link SpecialKey MY_Bg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:blue, s:bg0, s:search)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:search)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory MY_GreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title MY_GreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg MY_YellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg MY_YellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question MY_OrangeBold
" Warning messages
hi! link WarningMsg MY_RedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:cursor)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:SCH_improved_strings == 0
  hi! link Special MY_Orange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement MY_Red
" if, then, else, endif, swicth, etc.
hi! link Conditional MY_Red
" for, do, while, etc.
hi! link Repeat MY_Red
" case, default, etc.
hi! link Label MY_Red
" try, catch, throw
hi! link Exception MY_Red
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword MY_Red

" Variable name
hi! link Identifier MY_Blue
" Function name
hi! link Function MY_GreenBold

" Generic preprocessor
hi! link PreProc MY_Aqua
" Preprocessor #include
hi! link Include MY_Aqua
" Preprocessor #define
hi! link Define MY_Aqua
" Same as Define
hi! link Macro MY_Aqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit MY_Aqua

" Generic constant
hi! link Constant MY_Purple
" Character constant: 'c', '/n'
hi! link Character MY_Purple
" String constant: "this is a string"
if g:SCH_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean MY_Purple
" Number constant: 234, 0xff
hi! link Number MY_Purple
" Floating point constant: 2.3e10
hi! link Float MY_Purple

" Generic type
hi! link Type MY_Yellow
" static, register, volatile, etc
hi! link StorageClass MY_Orange
" struct, union, enum, etc.
hi! link Structure MY_Aqua
" typedef
hi! link Typedef MY_Yellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:SCH_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:SCH_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd MY_GreenSign
hi! link GitGutterChange MY_AquaSign
hi! link GitGutterDelete MY_RedSign
hi! link GitGutterChangeDelete MY_AquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile MY_Green
hi! link gitcommitDiscardedFile MY_Red

" }}}
" Signify: {{{

hi! link SignifySignAdd MY_GreenSign
hi! link SignifySignChange MY_AquaSign
hi! link SignifySignDelete MY_RedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign MY_RedSign
hi! link SyntasticWarningSign MY_YellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   MY_BlueSign
hi! link SignatureMarkerText MY_PurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl MY_BlueSign
hi! link ShowMarksHLu MY_BlueSign
hi! link ShowMarksHLo MY_BlueSign
hi! link ShowMarksHLm MY_BlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch MY_Yellow
hi! link CtrlPNoEntries MY_Red
hi! link CtrlPPrtBase MY_Bg2
hi! link CtrlPPrtCursor MY_Blue
hi! link CtrlPLinePre MY_Bg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket MY_Fg3
hi! link StartifyFile MY_Fg1
hi! link StartifyNumber MY_Blue
hi! link StartifyPath MY_Gray
hi! link StartifySlash MY_Gray
hi! link StartifySection MY_Yellow
hi! link StartifySpecial MY_Bg2
hi! link StartifyHeader MY_Orange
hi! link StartifyFooter MY_Bg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign MY_RedSign
hi! link ALEWarningSign MY_YellowSign
hi! link ALEInfoSign MY_BlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail MY_Aqua
hi! link DirvishArg MY_Yellow

" }}}
" Netrw: {{{

hi! link netrwDir MY_Aqua
hi! link netrwClassify MY_Aqua
hi! link netrwLink MY_Gray
hi! link netrwSymLink MY_Fg1
hi! link netrwExe MY_Yellow
hi! link netrwComment MY_Gray
hi! link netrwList MY_Blue
hi! link netrwHelpCmd MY_Aqua
hi! link netrwCmdSep MY_Fg3
hi! link netrwVersion MY_Green

" }}}
" NERDTree: {{{

hi! link NERDTreeDir MY_Aqua
hi! link NERDTreeDirSlash MY_Aqua

hi! link NERDTreeOpenable MY_Orange
hi! link NERDTreeClosable MY_Orange

hi! link NERDTreeFile MY_Fg1
hi! link NERDTreeExecFile MY_Yellow

hi! link NERDTreeUp MY_Gray
hi! link NERDTreeCWD MY_Green
hi! link NERDTreeHelp MY_Fg1

hi! link NERDTreeToggleOn MY_Green
hi! link NERDTreeToggleOff MY_Red

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}
" coc.nvim: {{{

hi! link CocErrorSign MY_RedSign
hi! link CocWarningSign MY_OrangeSign
hi! link CocInfoSign MY_YellowSign
hi! link CocHintSign MY_BlueSign
hi! link CocErrorFloat MY_Red
hi! link CocWarningFloat MY_Orange
hi! link CocInfoFloat MY_Yellow
hi! link CocHintFloat MY_Blue
hi! link CocDiagnosticsError MY_Red
hi! link CocDiagnosticsWarning MY_Orange
hi! link CocDiagnosticsInfo MY_Yellow
hi! link CocDiagnosticsHint MY_Blue

hi! link CocSelectedText MY_Red
hi! link CocCodeLens MY_Gray

call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:orange)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded MY_Green
hi! link diffRemoved MY_Red
hi! link diffChanged MY_Aqua

hi! link diffFile MY_Orange
hi! link diffNewFile MY_Yellow

hi! link diffLine MY_Blue

" }}}
" Html: {{{

hi! link htmlTag MY_Blue
hi! link htmlEndTag MY_Blue

hi! link htmlTagName MY_AquaBold
hi! link htmlArg MY_Aqua

hi! link htmlScriptTag MY_Purple
hi! link htmlTagN MY_Fg1
hi! link htmlSpecialTagName MY_AquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar MY_Orange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag MY_Blue
hi! link xmlEndTag MY_Blue
hi! link xmlTagName MY_Blue
hi! link xmlEqual MY_Blue
hi! link docbkKeyword MY_AquaBold

hi! link xmlDocTypeDecl MY_Gray
hi! link xmlDocTypeKeyword MY_Purple
hi! link xmlCdataStart MY_Gray
hi! link xmlCdataCdata MY_Purple
hi! link dtdFunction MY_Gray
hi! link dtdTagName MY_Purple

hi! link xmlAttrib MY_Aqua
hi! link xmlProcessingDelim MY_Gray
hi! link dtdParamEntityPunct MY_Gray
hi! link dtdParamEntityDPunct MY_Gray
hi! link xmlAttribPunct MY_Gray

hi! link xmlEntity MY_Orange
hi! link xmlEntityPunct MY_Orange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation MY_Orange
hi! link vimBracket MY_Orange
hi! link vimMapModKey MY_Orange
hi! link vimFuncSID MY_Fg3
hi! link vimSetSep MY_Fg3
hi! link vimSep MY_Fg3
hi! link vimContinue MY_Fg3

" }}}
" Clojure: {{{

hi! link clojureKeyword MY_Blue
hi! link clojureCond MY_Orange
hi! link clojureSpecial MY_Orange
hi! link clojureDefine MY_Orange

hi! link clojureFunc MY_Yellow
hi! link clojureRepeat MY_Yellow
hi! link clojureCharacter MY_Aqua
hi! link clojureStringEscape MY_Aqua
hi! link clojureException MY_Red

hi! link clojureRegexp MY_Aqua
hi! link clojureRegexpEscape MY_Aqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen MY_Fg3
hi! link clojureAnonArg MY_Yellow
hi! link clojureVariable MY_Blue
hi! link clojureMacro MY_Orange

hi! link clojureMeta MY_Yellow
hi! link clojureDeref MY_Yellow
hi! link clojureQuote MY_Yellow
hi! link clojureUnquote MY_Yellow

" }}}
" C: {{{

hi! link cOperator MY_Purple
hi! link cStructure MY_Orange

" }}}
" Python: {{{

hi! link pythonBuiltin MY_Orange
hi! link pythonBuiltinObj MY_Orange
hi! link pythonBuiltinFunc MY_Orange
hi! link pythonFunction MY_Aqua
hi! link pythonDecorator MY_Red
hi! link pythonInclude MY_Blue
hi! link pythonImport MY_Blue
hi! link pythonRun MY_Blue
hi! link pythonCoding MY_Blue
hi! link pythonOperator MY_Red
hi! link pythonException MY_Red
hi! link pythonExceptions MY_Purple
hi! link pythonBoolean MY_Purple
hi! link pythonDot MY_Fg3
hi! link pythonConditional MY_Red
hi! link pythonRepeat MY_Red
hi! link pythonDottedName MY_GreenBold

" }}}
" CSS: {{{

hi! link cssBraces MY_Blue
hi! link cssFunctionName MY_Yellow
hi! link cssIdentifier MY_Orange
hi! link cssClassName MY_Green
hi! link cssColor MY_Blue
hi! link cssSelectorOp MY_Blue
hi! link cssSelectorOp2 MY_Blue
hi! link cssImportant MY_Green
hi! link cssVendor MY_Fg1

hi! link cssTextProp MY_Aqua
hi! link cssAnimationProp MY_Aqua
hi! link cssUIProp MY_Yellow
hi! link cssTransformProp MY_Aqua
hi! link cssTransitionProp MY_Aqua
hi! link cssPrintProp MY_Aqua
hi! link cssPositioningProp MY_Yellow
hi! link cssBoxProp MY_Aqua
hi! link cssFontDescriptorProp MY_Aqua
hi! link cssFlexibleBoxProp MY_Aqua
hi! link cssBorderOutlineProp MY_Aqua
hi! link cssBackgroundProp MY_Aqua
hi! link cssMarginProp MY_Aqua
hi! link cssListProp MY_Aqua
hi! link cssTableProp MY_Aqua
hi! link cssFontProp MY_Aqua
hi! link cssPaddingProp MY_Aqua
hi! link cssDimensionProp MY_Aqua
hi! link cssRenderProp MY_Aqua
hi! link cssColorProp MY_Aqua
hi! link cssGeneratedContentProp MY_Aqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces MY_Fg1
hi! link javaScriptFunction MY_Aqua
hi! link javaScriptIdentifier MY_Red
hi! link javaScriptMember MY_Blue
hi! link javaScriptNumber MY_Purple
hi! link javaScriptNull MY_Purple
hi! link javaScriptParens MY_Fg3

" }}}
" YAJS: {{{

hi! link javascriptImport MY_Aqua
hi! link javascriptExport MY_Aqua
hi! link javascriptClassKeyword MY_Aqua
hi! link javascriptClassExtends MY_Aqua
hi! link javascriptDefault MY_Aqua

hi! link javascriptClassName MY_Yellow
hi! link javascriptClassSuperName MY_Yellow
hi! link javascriptGlobal MY_Yellow

hi! link javascriptEndColons MY_Fg1
hi! link javascriptFuncArg MY_Fg1
hi! link javascriptGlobalMethod MY_Fg1
hi! link javascriptNodeGlobal MY_Fg1
hi! link javascriptBOMWindowProp MY_Fg1
hi! link javascriptArrayMethod MY_Fg1
hi! link javascriptArrayStaticMethod MY_Fg1
hi! link javascriptCacheMethod MY_Fg1
hi! link javascriptDateMethod MY_Fg1
hi! link javascriptMathStaticMethod MY_Fg1

" hi! link javascriptProp MY_Fg1
hi! link javascriptURLUtilsProp MY_Fg1
hi! link javascriptBOMNavigatorProp MY_Fg1
hi! link javascriptDOMDocMethod MY_Fg1
hi! link javascriptDOMDocProp MY_Fg1
hi! link javascriptBOMLocationMethod MY_Fg1
hi! link javascriptBOMWindowMethod MY_Fg1
hi! link javascriptStringMethod MY_Fg1

hi! link javascriptVariable MY_Orange
" hi! link javascriptVariable MY_Red
" hi! link javascriptIdentifier MY_Orange
" hi! link javascriptClassSuper MY_Orange
hi! link javascriptIdentifier MY_Orange
hi! link javascriptClassSuper MY_Orange

" hi! link javascriptFuncKeyword MY_Orange
" hi! link javascriptAsyncFunc MY_Orange
hi! link javascriptFuncKeyword MY_Aqua
hi! link javascriptAsyncFunc MY_Aqua
hi! link javascriptClassStatic MY_Orange

hi! link javascriptOperator MY_Red
hi! link javascriptForOperator MY_Red
hi! link javascriptYield MY_Red
hi! link javascriptExceptions MY_Red
hi! link javascriptMessage MY_Red

hi! link javascriptTemplateSB MY_Aqua
hi! link javascriptTemplateSubstitution MY_Fg1

" hi! link javascriptLabel MY_Blue
" hi! link javascriptObjectLabel MY_Blue
" hi! link javascriptPropertyName MY_Blue
hi! link javascriptLabel MY_Fg1
hi! link javascriptObjectLabel MY_Fg1
hi! link javascriptPropertyName MY_Fg1

hi! link javascriptLogicSymbols MY_Fg1
hi! link javascriptArrowFunc MY_Yellow

hi! link javascriptDocParamName MY_Fg4
hi! link javascriptDocTags MY_Fg4
hi! link javascriptDocNotation MY_Fg4
hi! link javascriptDocParamType MY_Fg4
hi! link javascriptDocNamedParamType MY_Fg4

hi! link javascriptBrackets MY_Fg1
hi! link javascriptDOMElemAttrs MY_Fg1
hi! link javascriptDOMEventMethod MY_Fg1
hi! link javascriptDOMNodeMethod MY_Fg1
hi! link javascriptDOMStorageMethod MY_Fg1
hi! link javascriptHeadersMethod MY_Fg1

hi! link javascriptAsyncFuncKeyword MY_Red
hi! link javascriptAwaitFuncKeyword MY_Red

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword MY_Aqua
hi! link jsExtendsKeyword MY_Aqua
hi! link jsExportDefault MY_Aqua
hi! link jsTemplateBraces MY_Aqua
hi! link jsGlobalNodeObjects MY_Fg1
hi! link jsGlobalObjects MY_Fg1
hi! link jsFunction MY_Aqua
hi! link jsFuncParens MY_Fg3
hi! link jsParens MY_Fg3
hi! link jsNull MY_Purple
hi! link jsUndefined MY_Purple
hi! link jsClassDefinition MY_Yellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved MY_Aqua
hi! link typeScriptLabel MY_Aqua
hi! link typeScriptFuncKeyword MY_Aqua
hi! link typeScriptIdentifier MY_Orange
hi! link typeScriptBraces MY_Fg1
hi! link typeScriptEndColons MY_Fg1
hi! link typeScriptDOMObjects MY_Fg1
hi! link typeScriptAjaxMethods MY_Fg1
hi! link typeScriptLogicSymbols MY_Fg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects MY_Fg1
hi! link typeScriptParens MY_Fg3
hi! link typeScriptOpSymbols MY_Fg3
hi! link typeScriptHtmlElemProperties MY_Fg1
hi! link typeScriptNull MY_Purple
hi! link typeScriptInterpolationDelimiter MY_Aqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword MY_Aqua
hi! link purescriptModuleName MY_Fg1
hi! link purescriptWhere MY_Aqua
hi! link purescriptDelimiter MY_Fg4
hi! link purescriptType MY_Fg1
hi! link purescriptImportKeyword MY_Aqua
hi! link purescriptHidingKeyword MY_Aqua
hi! link purescriptAsKeyword MY_Aqua
hi! link purescriptStructure MY_Aqua
hi! link purescriptOperator MY_Blue

hi! link purescriptTypeVar MY_Fg1
hi! link purescriptConstructor MY_Fg1
hi! link purescriptFunction MY_Fg1
hi! link purescriptConditional MY_Orange
hi! link purescriptBacktick MY_Orange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp MY_Fg3
hi! link coffeeSpecialOp MY_Fg3
hi! link coffeeCurly MY_Orange
hi! link coffeeParen MY_Fg3
hi! link coffeeBracket MY_Orange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter MY_Green
hi! link rubyInterpolationDelimiter MY_Aqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier MY_Red
hi! link objcDirective MY_Blue

" }}}
" Go: {{{

hi! link goDirective MY_Aqua
hi! link goConstants MY_Purple
hi! link goDeclaration MY_Red
hi! link goDeclType MY_Blue
hi! link goBuiltins MY_Orange

" }}}
" Lua: {{{

hi! link luaIn MY_Red
hi! link luaFunction MY_Aqua
hi! link luaTable MY_Orange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp MY_Fg3
hi! link moonExtendedOp MY_Fg3
hi! link moonFunction MY_Fg3
hi! link moonObject MY_Yellow

" }}}
" Java: {{{

hi! link javaAnnotation MY_Blue
hi! link javaDocTags MY_Aqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen MY_Fg3
hi! link javaParen1 MY_Fg3
hi! link javaParen2 MY_Fg3
hi! link javaParen3 MY_Fg3
hi! link javaParen4 MY_Fg3
hi! link javaParen5 MY_Fg3
hi! link javaOperator MY_Orange

hi! link javaVarArg MY_Green

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter MY_Green
hi! link elixirInterpolationDelimiter MY_Aqua

hi! link elixirModuleDeclaration MY_Yellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition MY_Fg1
hi! link scalaCaseFollowing MY_Fg1
hi! link scalaCapitalWord MY_Fg1
hi! link scalaTypeExtension MY_Fg1

hi! link scalaKeyword MY_Red
hi! link scalaKeywordModifier MY_Red

hi! link scalaSpecial MY_Aqua
hi! link scalaOperator MY_Fg1

hi! link scalaTypeDeclaration MY_Yellow
hi! link scalaTypeTypePostDeclaration MY_Yellow

hi! link scalaInstanceDeclaration MY_Fg1
hi! link scalaInterpolation MY_Aqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 MY_GreenBold
hi! link markdownH2 MY_GreenBold
hi! link markdownH3 MY_YellowBold
hi! link markdownH4 MY_YellowBold
hi! link markdownH5 MY_Yellow
hi! link markdownH6 MY_Yellow

hi! link markdownCode MY_Aqua
hi! link markdownCodeBlock MY_Aqua
hi! link markdownCodeDelimiter MY_Aqua

hi! link markdownBlockquote MY_Gray
hi! link markdownListMarker MY_Gray
hi! link markdownOrderedListMarker MY_Gray
hi! link markdownRule MY_Gray
hi! link markdownHeadingRule MY_Gray

hi! link markdownUrlDelimiter MY_Fg3
hi! link markdownLinkDelimiter MY_Fg3
hi! link markdownLinkTextDelimiter MY_Fg3

hi! link markdownHeadingDelimiter MY_Orange
hi! link markdownUrl MY_Purple
hi! link markdownUrlTitleDelimiter MY_Green

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType MY_Yellow
" hi! link haskellOperators MY_Orange
" hi! link haskellConditional MY_Aqua
" hi! link haskellLet MY_Orange
"
hi! link haskellType MY_Fg1
hi! link haskellIdentifier MY_Fg1
hi! link haskellSeparator MY_Fg1
hi! link haskellDelimiter MY_Fg4
hi! link haskellOperators MY_Blue
"
hi! link haskellBacktick MY_Orange
hi! link haskellStatement MY_Orange
hi! link haskellConditional MY_Orange

hi! link haskellLet MY_Aqua
hi! link haskellDefault MY_Aqua
hi! link haskellWhere MY_Aqua
hi! link haskellBottom MY_Aqua
hi! link haskellBlockKeywords MY_Aqua
hi! link haskellImportKeywords MY_Aqua
hi! link haskellDeclKeyword MY_Aqua
hi! link haskellDeriving MY_Aqua
hi! link haskellAssocType MY_Aqua

hi! link haskellNumber MY_Purple
hi! link haskellPragma MY_Purple

hi! link haskellString MY_Green
hi! link haskellChar MY_Green

" }}}
" Json: {{{

hi! link jsonKeyword MY_Green
hi! link jsonQuote MY_Green
hi! link jsonBraces MY_Fg1
hi! link jsonString MY_Fg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! MY_HlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! MY_HlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:cursor)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
