" vim color file -- rigel
" Maintainer: farsil

" only works with dark background
set background=dark

" clear previous theme colors
highlight clear
if exists('syntax_on')
    syntax reset
endif

" backup compatibility settings
let save_cpo = &cpo
set cpo&vim

let g:colors_name = 'rigel'

" share the palette
" this has the advantage of keeping the complexity of color capability
" detection in one place
let g:colors_palette = {}

if has('gui_running')
    function! s:hi(group, fg, bg, style)
        let l:cmd = 'hi ' . a:group
        if a:fg != ''
            let l:cmd = l:cmd . ' guifg='. g:colors_palette[a:fg]
        endif
        if a:bg != ''
            let l:cmd = l:cmd . ' guibg='. g:colors_palette[a:bg]
        endif
        if a:style != ''
            let l:cmd = l:cmd . ' gui=' . a:style
        endif
        exec l:cmd
    endfunction

    let g:colors_palette = {
        \ 'fg'      : '#00BFE5', 'bg'        : '#171717',
        \ 'deleted' : '#FF6563', 'added'     : '#00FF66',
        \ 'remark'  : '#FF6700', 'comment'   : '#B6B6B6',
        \ 'special' : '#FDFFB4', 'literal'   : '#00C26F',
        \ 'function': '#0096FF', 'bright'    : '#D8D8D8',
        \ 'macro'   : '#009D72', 'error'     : '#D10000',
        \ 'rare'    : '#AE00FF', 'highlight' : '#00739E',
        \ 'column'  : '#7868FF', 'bars'      : '#323232',
        \ 'passive' : '#888888', 'active'    : '#BFBFBF',
        \ 'fgdim'   : '#009C9C', 'specialdim': '#BBBE66',
    \ }
else
    function! s:hi(group, fg, bg, style)
        let l:cmd = 'hi ' . a:group
        if a:fg != ''
            let l:cmd = l:cmd . ' ctermfg=' . g:colors_palette[a:fg]
        endif
        if a:bg != ''
            let l:cmd = l:cmd . ' ctermbg=' . g:colors_palette[a:bg]
        endif
        if a:style != ''
            let l:cmd = l:cmd . ' cterm=' . a:style
        endif
        exec l:cmd
    endfunction

    if &t_Co >= 256
        let g:colors_palette = {
            \ 'fg'      : '38',  'bg'        : '233',
            \ 'deleted' : '203', 'added'     : '47',
            \ 'remark'  : '202', 'comment'   : '248',
            \ 'special' : '229', 'literal'   : '35',
            \ 'function': '33',  'bright'    : '252',
            \ 'macro'   : '29',  'error'     : '124',
            \ 'rare'    : '93',  'highlight' : '24',
            \ 'column'  : '63',  'bars'      : '235',
            \ 'passive' : '243', 'active'    : '249',
            \ 'fgdim'   : '30',  'specialdim': '143'
        \ }

    else
        let g:colors_palette = {
            \ 'fg'      : 'Cyan',        'bg'        : 'Black',
            \ 'deleted' : 'Red',         'added'     : 'Green',
            \ 'remark'  : 'DarkYellow',  'comment'   : 'White',
            \ 'special' : 'Yellow',      'literal'   : 'Green',
            \ 'function': 'Blue',        'bright'    : 'White',
            \ 'macro'   : 'DarkGreen',   'error'     : 'Red',
            \ 'rare'    : 'DarkMagenta', 'highlight' : 'Blue',
            \ 'column'  : 'DarkBlue',    'active'    : 'White',
            \ 'passive' : 'Gray',        'bars'      : 'DarkGray',
            \ 'fgdim'   : 'DarkCyan',    'specialdim': 'DarkYellow'
        \ }
    endif
end

" normal text
call s:hi('Normal', 'fg', 'bg', '')
call s:hi('DiffChange', '', 'bg', '')
call s:hi('DiffAdd', 'added', 'bg', '')
call s:hi('DiffText', 'remark', 'bg', 'Bold')
call s:hi('DiffDelete', 'deleted', 'bg', 'NONE')
call s:hi('Folded', 'comment', 'bg', 'Underline')
call s:hi('Directory', 'fg', 'bg', '')
call s:hi('NonText', 'special', 'bg', 'Bold')
call s:hi('SpecialKey', 'special', 'bg', '')

" syntax highlighting groups (:help group-name)
call s:hi('Comment', 'comment', 'bg', '')
call s:hi('Statement', 'bright', 'bg', 'Bold')
call s:hi('Identifier', 'bright', 'bg', 'NONE')
call s:hi('Keyword', 'bright', 'bg', 'NONE')
call s:hi('Operator', 'bright', 'bg', '')
call s:hi('Delimiter', 'bright', 'bg', '')
call s:hi('Error', 'bright', 'error', '')
call s:hi('Function', 'function', 'bg', '')
call s:hi('Todo', 'remark', 'bg', 'Bold')
call s:hi('Underlined', 'fg', 'bg', 'Underline')
call s:hi('Ignore', 'comment', 'bg', '')
call s:hi('Constant', 'literal', 'bg', '')
call s:hi('Number', 'literal', 'bg', '')
call s:hi('Special', 'special', 'bg', '')
call s:hi('PreProc', 'macro', 'bg', '')
call s:hi('Macro', 'macro', 'bg', '')
call s:hi('StorageClass', 'bright', 'bg', 'Bold')
call s:hi('Structure', 'bright', 'bg', 'Bold')
call s:hi('Type', 'bright', 'bg', 'NONE')

" listings / messages
call s:hi('Title', 'rare', '', 'Bold')
call s:hi('ErrorMsg', 'bright', 'error', 'Bold')
call s:hi('ModeMsg', 'special', '', '')
call s:hi('Question', 'special', 'bg', '')
call s:hi('MoreMsg', 'special', 'bg', '')
call s:hi('WarningMsg', 'special', 'bg', 'Bold')

" spell-checking needs to be redefined only for terminal vim
if !has('gui_running')
    call s:hi('SpellBad', '', 'error', '')
    call s:hi('SpellCap', '', 'error', '')
    call s:hi('SpellLocal', '', 'error', '')
    call s:hi('SpellRare', '', 'rare', '')
endif

" borders / separators / menus
" TODO: PMenu is dull and boring
call s:hi('FoldColumn', 'passive', 'bg', 'Bold')
call s:hi('SignColumn', '', 'bg', 'Bold')
call s:hi('Pmenu', 'passive', 'bg', '')
call s:hi('PmenuSel', 'active', 'passive', '')
call s:hi('PmenuSbar', '', 'passive', '')
call s:hi('PmenuThumb', '', 'active', '')
call s:hi('WildMenu', 'active', 'rare', 'Bold')
call s:hi('VertSplit', 'bars', 'passive', '')
call s:hi('TabLine', 'fg', 'bars', 'NONE')
call s:hi('TabLineSel', 'bars', 'fg', 'Bold')
call s:hi('TabLineFill', 'bars', 'bars', '')
call s:hi('StatusLine', 'fg', 'bars', 'NONE')
call s:hi('StatusLineNC', 'passive', 'bars', 'NONE')
call s:hi('ColorColumn', '', 'column', '')
call s:hi('LineNr', 'passive', 'bg', '')

" cursor / dynamic / other
call s:hi('Cursor', 'bg', 'fg', '')
call s:hi('CursorLine', '', 'bars', 'NONE')
call s:hi('CursorColumn', '', 'bars', 'NONE')
call s:hi('DebugStop', '', 'bars', 'NONE')
call s:hi('Visual', '', 'bars', '')
call s:hi('Search', '', 'highlight', '')
call s:hi('MatchParen', '', 'highlight', '')

" TODO: who knows
"Scrollbar
"Tooltip
"CursorIM
"IncSearch
"VisualNOS

" restore compatibility settings
let &cpo = save_cpo
