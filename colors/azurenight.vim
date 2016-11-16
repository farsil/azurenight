" vim color file -- azurenight
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

let g:colors_name = 'azurenight'

" share the palette
" this has the advantage of keeping the complexity of color capability
" detection in one place
let g:cs_palette = {}

if has('gui_running')
    function! s:hi(group, fg, bg, style)
        let l:cmd = 'hi ' . a:group
        if a:fg != v:none
            let l:cmd = l:cmd . ' guifg='. g:cs_palette[a:fg]
        endif
        if a:bg != v:none
            let l:cmd = l:cmd . ' guibg='. g:cs_palette[a:bg]
        endif
        if a:style != v:none
            let l:cmd = l:cmd . ' gui=' . a:style
        endif
        exec l:cmd
    endfunction

    let g:cs_palette = {
        \ 'fg'      : '#00BFE5', 'bg'       : '#171717',
        \ 'deleted' : '#FF6563', 'added'    : '#00FF66',
        \ 'remark'  : '#FF6700', 'dim'      : '#B6B6B6',
        \ 'special' : '#FDFFB4', 'literal'  : '#00C26F',
        \ 'function': '#0096FF', 'emph'     : '#D8D8D8',
        \ 'auto'    : '#009D72', 'error'    : '#D10000',
        \ 'rare'    : '#AE00FF', 'highlight': '#00739E',
        \ 'column'  : '#7868FF', 'bars'     : '#323232',
        \ 'passive' : '#888888', 'active'   : '#BFBFBF',
        \ 'info'    : '#009C9C', 'modinfo'  : '#BBBE66',
        \ 'buffer'  : '#00C26F', 'bufinfo'  : '#009D72'
    \ }
else
    function! s:hi(group, fg, bg, style)
        let l:cmd = 'hi ' . a:group
        if a:fg != v:none
            let l:cmd = l:cmd . ' ctermfg=' . g:cs_palette[a:fg]
        endif
        if a:bg != v:none
            let l:cmd = l:cmd . ' ctermbg=' . g:cs_palette[a:bg]
        endif
        if a:style != v:none
            let l:cmd = l:cmd . ' cterm=' . a:style
        endif
        exec l:cmd
    endfunction

    if &t_Co >= 256
        let g:cs_palette = {
            \ 'fg'      : '38',  'bg'       : '233',
            \ 'deleted' : '203', 'added'    : '47',
            \ 'remark'  : '202', 'dim'      : '248',
            \ 'special' : '229', 'literal'  : '35',
            \ 'function': '33',  'emph'     : '252',
            \ 'auto'    : '29',  'error'    : '124',
            \ 'rare'    : '93',  'highlight': '24',
            \ 'column'  : '63',  'bars'     : '235',
            \ 'passive' : '243', 'active'   : '249',
            \ 'info'    : '30',  'modinfo'  : '143',
            \ 'buffer'  : '35',  'bufinfo'  : '29'
        \ }
    else
        let g:cs_palette = {
            \ 'fg'      : 'Cyan',        'bg'       : 'Black',
            \ 'deleted' : 'Red',         'added'    : 'Green',
            \ 'remark'  : 'DarkYellow',  'dim'      : 'White',
            \ 'special' : 'Yellow',      'literal'  : 'Green',
            \ 'function': 'Blue',        'emph'     : 'White',
            \ 'auto'    : 'DarkGreen',   'error'    : 'Red',
            \ 'rare'    : 'DarkMagenta', 'highlight': 'Blue',
            \ 'column'  : 'DarkBlue',    'active'   : 'White',
            \ 'passive' : 'Gray',        'bars'     : 'DarkGray',
            \ 'info'    : 'DarkCyan',    'modinfo'  : 'DarkYellow',
            \ 'buffer'  : 'Green',       'bufinfo'  : 'DarkGreen'
        \ }
    endif
end

" normal text
call s:hi('Normal', 'fg', 'bg', v:none)
call s:hi('DiffChange', v:none, 'bg', v:none)
call s:hi('DiffAdd', 'added', 'bg', v:none)
call s:hi('DiffText', 'remark', 'bg', 'Bold')
call s:hi('DiffDelete', 'deleted', 'bg', 'NONE')
call s:hi('Folded', 'dim', 'bg', 'Underline')
call s:hi('Directory', 'fg', 'bg', v:none)
call s:hi('NonText', 'special', 'bg', 'Bold')
call s:hi('SpecialKey', 'special', 'bg', v:none)

" syntax highlighting groups (:help group-name)
call s:hi('Comment', 'dim', 'bg', v:none)
call s:hi('Statement', 'emph', 'bg', 'Bold')
call s:hi('Identifier', 'emph', 'bg', 'NONE')
call s:hi('Keyword', 'emph', 'bg', 'NONE')
call s:hi('Operator', 'emph', 'bg', v:none)
call s:hi('Delimiter', 'emph', 'bg', v:none)
call s:hi('Error', 'emph', 'error', v:none)
call s:hi('Function', 'function', 'bg', v:none)
call s:hi('Todo', 'remark', 'bg', 'Bold')
call s:hi('Underlined', 'fg', 'bg', 'Underline')
call s:hi('Ignore', 'dim', 'bg', v:none)
call s:hi('Constant', 'literal', 'bg', v:none)
call s:hi('Number', 'literal', 'bg', v:none)
call s:hi('Special', 'special', 'bg', v:none)
call s:hi('PreProc', 'auto', 'bg', v:none)
call s:hi('Macro', 'auto', 'bg', v:none)
call s:hi('StorageClass', 'emph', 'bg', 'Bold')
call s:hi('Structure', 'emph', 'bg', 'Bold')
call s:hi('Type', 'emph', 'bg', 'NONE')

" listings / messages
call s:hi('Title', 'rare', v:none, 'Bold')
call s:hi('ErrorMsg', 'emph', 'error', 'Bold')
call s:hi('ModeMsg', 'special', v:none, v:none)
call s:hi('Question', 'special', 'bg', v:none)
call s:hi('MoreMsg', 'special', 'bg', v:none)
call s:hi('WarningMsg', 'special', 'bg', 'Bold')

" spell-checking needs to be redefined only for terminal vim
if !has('gui_running')
    call s:hi('SpellBad', v:none, 'error', v:none)
    call s:hi('SpellCap', v:none, 'error', v:none)
    call s:hi('SpellLocal', v:none, 'error', v:none)
    call s:hi('SpellRare', v:none, 'rare', v:none)
endif

" borders / separators / menus
" TODO: PMenu is dull and boring
call s:hi('FoldColumn', 'passive', 'bg', 'Bold')
call s:hi('SignColumn', v:none, 'bg', 'Bold')
call s:hi('Pmenu', 'passive', 'bg', v:none)
call s:hi('PmenuSel', 'active', 'passive', v:none)
call s:hi('PmenuSbar', v:none, 'passive', v:none)
call s:hi('PmenuThumb', v:none, 'active', v:none)
call s:hi('WildMenu', 'active', 'rare', 'Bold')
call s:hi('VertSplit', 'bars', 'passive', v:none)
call s:hi('TabLine', 'fg', 'bars', 'NONE')
call s:hi('TabLineSel', 'bars', 'fg', 'Bold')
call s:hi('TabLineFill', 'bars', 'bars', v:none)
call s:hi('StatusLine', 'fg', 'bars', 'NONE')
call s:hi('StatusLineNC', 'passive', 'bars', 'NONE')
call s:hi('ColorColumn', v:none, 'column', v:none)
call s:hi('LineNr', 'passive', 'bg', v:none)

" cursor / dynamic / other
call s:hi('Cursor', 'bg', 'fg', v:none)
call s:hi('CursorLine', v:none, 'bars', 'NONE')
call s:hi('CursorColumn', v:none, 'bars', 'NONE')
call s:hi('DebugStop', v:none, 'bars', 'NONE')

call s:hi('Visual', v:none, 'bars', v:none)
call s:hi('Search', v:none, 'highlight', v:none)
call s:hi('MatchParen', v:none, 'highlight', v:none)

" TODO: who knows
"Scrollbar
"Tooltip
"CursorIM
"IncSearch
"VisualNOS

" restore compatibility settings
let &cpo = save_cpo
