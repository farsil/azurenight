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

if has('gui_running')
    " 0-15 standard color names
    " 16-256  256-color terminal palette
    let s:color_map = {
        \ 0: 'Black', 1: 'DarkRed', 2: 'DarkGreen', 3: 'DarkYellow',
        \ 4: 'DarkBlue', 5: 'DarkMagenta', 6: 'DarkCyan', 7: 'Grey',
        \ 8: 'DarkGrey', 9: 'Red', 10: 'Green', 11: 'Yellow',
        \ 12: 'Blue', 13: 'Magenta', 14: 'Cyan', 15: 'White',
        \ 16: '#000000', 17: '#0C0077', 18: '#14009F', 19: '#1B00C5',
        \ 20: '#2200E8',  21: '#2900FF', 22: '#007600', 23: '#007475',
        \ 24: '#00739E', 25: '#0071C3', 26: '#006EE7', 27: '#006BFF',
        \ 28: '#009E00', 29: '#009D72', 30: '#009C9C', 31: '#009AC2',
        \ 32: '#0098E6', 33: '#0096FF', 34: '#00C300', 35: '#00C26F',
        \ 36: '#00C19A', 37: '#00C0C1', 38: '#00BFE5', 39: '#00BDFF',
        \ 40: '#00E600', 41: '#00E56B', 42: '#00E497', 43: '#00E3BF',
        \ 44: '#00E2E3', 45: '#00E1FF', 46: '#00FF00', 47: '#00FF66',
        \ 48: '#00FF94', 49: '#00FFBC', 50: '#00FFE1', 51: '#00FFFF',
        \ 52: '#7F0000', 53: '#800075', 54: '#81009E', 55: '#8200C3',
        \ 56: '#8300E7', 57: '#8500FF', 58: '#717400', 59: '#727272',
        \ 60: '#73709C', 61: '#746EC2', 62: '#766CE6', 63: '#7868FF',
        \ 64: '#629C00', 65: '#639B6F', 66: '#649A9A', 67: '#6698C1',
        \ 68: '#6897E5', 69: '#6A95FF', 70: '#49C200', 71: '#4BC16C',
        \ 72: '#4DC098', 73: '#4FBFBF', 74: '#52BDE3', 75: '#54BCFF',
        \ 76: '#07E500', 77: '#12E468', 78: '#18E395', 79: '#1EE2BD',
        \ 80: '#25E1E2', 81: '#2BE0FF', 82: '#00FF00', 83: '#00FF63',
        \ 84: '#00FF92', 85: '#00FFBB', 86: '#00FFE0', 87: '#00FFFF',
        \ 88: '#AA0000', 89: '#AA0072', 90: '#AB009C', 91: '#AC00C2',
        \ 92: '#AD00E6', 93: '#AE00FF', 94: '#A07200', 95: '#A1706F',
        \ 96: '#A16E9A', 97: '#A26CC1', 98: '#A369E5', 99: '#A566FF',
        \ 100: '#979B00', 101: '#989A6D', 102: '#989898', 103: '#9997BF',
        \ 104: '#9A95E4', 105: '#9C93FF', 106: '#8AC000', 107: '#8BC06A',
        \ 108: '#8CBF96', 109: '#8DBEBE', 110: '#8EBCE2', 111: '#90BBFF',
        \ 112: '#79E400', 113: '#7AE365', 114: '#7BE294', 115: '#7CE1BC',
        \ 116: '#7DE0E1', 117: '#7FDFFF', 118: '#5FFF00', 119: '#60FF60',
        \ 120: '#62FF90', 121: '#63FFBA', 122: '#65FFDF', 123: '#67FFFF',
        \ 124: '#D10000', 125: '#D2006F', 126: '#D2009A', 127: '#D300C1',
        \ 128: '#D300E5', 129: '#D400FF', 130: '#CA6F00', 131: '#CA6D6C',
        \ 132: '#CB6B98', 133: '#CC69BF', 134: '#CC66E3', 135: '#CD63FF',
        \ 136: '#C39900', 137: '#C4986A', 138: '#C49796', 139: '#C595BE',
        \ 140: '#C693E2', 141: '#C791FF', 142: '#BABF00', 143: '#BBBE66',
        \ 144: '#BCBD94', 145: '#BCBCBC', 146: '#BDBBE1', 147: '#BEB9FF',
        \ 148: '#AFE300', 149: '#B0E262', 150: '#B0E191', 151: '#B1E0BA',
        \ 152: '#B2DFE0', 153: '#B3DEFF', 154: '#A0FF00', 155: '#A1FF5C',
        \ 156: '#A2FF8E', 157: '#A2FFB8', 158: '#A3FFDE', 159: '#A5FFFF',
        \ 160: '#F60000', 161: '#F7006B', 162: '#F70097', 163: '#F800BF',
        \ 164: '#F800E3', 165: '#F900FF', 166: '#F16C00', 167: '#F16A68',
        \ 168: '#F16895', 169: '#F265BD', 170: '#F363E2', 171: '#F35FFF',
        \ 172: '#EB9700', 173: '#EC9565', 174: '#EC9494', 175: '#ED93BC',
        \ 176: '#ED91E1', 177: '#EE8FFF', 178: '#E4BD00', 179: '#E5BC62',
        \ 180: '#E5BC91', 181: '#E6BBBA', 182: '#E7B9E0', 183: '#E7B8FF',
        \ 184: '#DCE100', 185: '#DCE15D', 186: '#DDE08F', 187: '#DDDFB8',
        \ 188: '#DEDEDE', 189: '#DFDDFF', 190: '#D1FF00', 191: '#D2FF57',
        \ 192: '#D2FF8B', 193: '#D3FFB6', 194: '#D4FFDC', 195: '#D4FFFF',
        \ 196: '#FF0000', 197: '#FF0066', 198: '#FF0094', 199: '#FF00BC',
        \ 200: '#FF00E1', 201: '#FF00FF', 202: '#FF6700', 203: '#FF6563',
        \ 204: '#FF6392', 205: '#FF61BB', 206: '#FF5EE0', 207: '#FF5AFF',
        \ 208: '#FF9400', 209: '#FF9360', 210: '#FF9291', 211: '#FF90BA',
        \ 212: '#FF8EDF', 213: '#FF8CFF', 214: '#FFBB00', 215: '#FFBA5C',
        \ 216: '#FFBA8E', 217: '#FFB9B8', 218: '#FFB7DE', 219: '#FFB6FF',
        \ 220: '#FFE000', 221: '#FFDF57', 222: '#FFDE8B', 223: '#FFDDB6',
        \ 224: '#FFDCDC', 225: '#FFDBFF', 226: '#FCFF00', 227: '#FCFF51',
        \ 228: '#FDFF88', 229: '#FDFFB4', 230: '#FEFFDA', 231: '#FEFEFE',
        \ 232: '#060606', 233: '#171717', 234: '#252525', 235: '#323232',
        \ 236: '#3F3F3F', 237: '#4A4A4A', 238: '#565656', 239: '#606060',
        \ 240: '#6B6B6B', 241: '#757575', 242: '#7F7F7F', 243: '#888888',
        \ 244: '#929292', 245: '#9B9B9B', 246: '#A4A4A4', 247: '#ADADAD',
        \ 248: '#B6B6B6', 249: '#BFBFBF', 250: '#C7C7C7', 251: '#D0D0D0',
        \ 252: '#D8D8D8', 253: '#E0E0E0', 254: '#E9E9E9', 255: '#F1F1F1'
    \ }

    function! s:hi(item, fg, bg, style)
        let l:cmd = 'hi ' . a:item
        if a:fg != v:none
            let l:cmd = l:cmd . ' guifg=' . get(s:color_map, a:fg, a:fg)
        endif
        if a:bg != v:none
            let l:cmd = l:cmd . ' guibg=' . get(s:color_map, a:bg, a:bg)
        endif
        if a:style != v:none
            let l:cmd = l:cmd . ' gui=' . a:style
        endif
        exec l:cmd
    endfunction

    let s:colors = 256
else
    function! s:hi(item, fg, bg, style)
        let l:cmd = 'hi ' . a:item
        if a:fg != v:none
            let l:cmd = l:cmd . ' ctermfg=' . a:fg
        endif
        if a:bg != v:none
            let l:cmd = l:cmd . ' ctermbg=' . a:bg
        endif
        if a:style != v:none
            let l:cmd = l:cmd . ' cterm=' . a:style
        endif
        exec l:cmd
    endfunction

    let s:colors = &t_Co
end

if s:colors >= 256
    let s:fg = '38'
    let s:bg = '233'

    let s:deleted = '203'
    let s:added = '47'
    let s:remark = '202'
    let s:dim = '248'
    let s:special = '229'

    let s:literal = '35'
    let s:builtin = '33'
    let s:emph = '252'
    let s:auto = '29'
    let s:error = '124'
    let s:rare = '93'

    let s:highlight = '24'
    let s:column = '63'
    let s:bars = '235'
    let s:passive = '243'
    let s:active = '249'
else
    let s:fg = 'Cyan'
    let s:bg = 'Black'

    let s:deleted = 'Red'
    let s:added = 'Green'
    let s:remark = 'DarkYellow'
    let s:dim = 'White'
    let s:special = 'Yellow'

    let s:literal = 'Green'
    let s:builtin = 'Blue'
    let s:emph = 'White'
    let s:auto = 'DarkGreen'
    let s:error = 'Red'
    let s:rare = 'DarkMagenta'

    let s:highlight = 'Blue'
    let s:column = 'DarkBlue'
    let s:active = 'White'
    let s:passive = 'Gray'
    let s:bars = 'DarkGray'
endif

" normal text
call s:hi('Normal', s:fg, s:bg, v:none)
call s:hi('DiffChange', v:none, s:bg, v:none)
call s:hi('DiffAdd', s:added, s:bg, v:none)
call s:hi('DiffText', s:remark, s:bg, 'Bold')
call s:hi('DiffDelete', s:deleted, s:bg, 'NONE')
call s:hi('Folded', s:dim, s:bg, 'Underline')
call s:hi('Directory', s:fg, s:bg, v:none)
call s:hi('NonText', s:special, s:bg, 'Bold')
call s:hi('SpecialKey', s:special, s:bg, v:none)

" syntax highlighting groups (:help group-name)
call s:hi('Comment', s:dim, s:bg, v:none)
call s:hi('Statement', s:emph, s:bg, 'Bold')
call s:hi('Identifier', s:emph, s:bg, 'NONE')
call s:hi('Keyword', s:emph, s:bg, 'NONE')
call s:hi('Operator', s:emph, s:bg, v:none)
call s:hi('Delimiter', s:emph, s:bg, v:none)
call s:hi('Error', s:emph, s:error, v:none)
call s:hi('Function', s:builtin, s:bg, v:none)
call s:hi('Todo', s:remark, s:bg, 'Bold')
call s:hi('Underlined', s:fg, s:bg, 'Underline')
call s:hi('Ignore', s:dim, s:bg, v:none)
call s:hi('Constant', s:literal, s:bg, v:none)
call s:hi('Number', s:literal, s:bg, v:none)
call s:hi('Special', s:special, s:bg, v:none)
call s:hi('PreProc', s:auto, s:bg, v:none)
call s:hi('Macro', s:auto, s:bg, v:none)
call s:hi('StorageClass', s:emph, s:bg, 'Bold')
call s:hi('Structure', s:emph, s:bg, 'Bold')
call s:hi('Type', s:emph, s:bg, 'NONE')

" listings / messages
call s:hi('Title', s:rare, v:none, 'Bold')
call s:hi('ErrorMsg', s:emph, s:error, 'Bold')
call s:hi('ModeMsg', s:special, v:none, v:none)
call s:hi('Question', s:special, s:bg, v:none)
call s:hi('MoreMsg', s:special, s:bg, v:none)
call s:hi('WarningMsg', s:special, s:bg, 'Bold')

" spell-checking needs to be redefined only for terminal vim
if !has('gui_running')
    call s:hi('SpellBad', 'NONE', s:error, v:none)
    call s:hi('SpellCap', 'NONE', s:error, v:none)
    call s:hi('SpellLocal', 'NONE', s:error, v:none)
    call s:hi('SpellRare', 'NONE', s:rare, v:none)
endif

" borders / separators / menus
" TODO: PMenu is dull and boring
call s:hi('FoldColumn', s:passive, s:bg, 'Bold')
call s:hi('SignColumn', v:none, s:bg, 'Bold')
call s:hi('Pmenu', s:passive, s:bg, v:none)
call s:hi('PmenuSel', s:active, s:passive, v:none)
call s:hi('PmenuSbar', v:none, s:passive, v:none)
call s:hi('PmenuThumb', v:none, s:active, v:none)
call s:hi('WildMenu', s:active, s:rare, 'Bold')
call s:hi('VertSplit', s:bars, s:passive, v:none)
call s:hi('TabLine', s:fg, s:bars, 'NONE')
call s:hi('TabLineSel', s:bars, s:fg, 'Bold')
call s:hi('TabLineFill', s:bars, s:bars, v:none)
call s:hi('StatusLine', s:fg, s:bars, 'NONE')
call s:hi('StatusLineNC', s:passive, s:bars, 'NONE')
call s:hi('ColorColumn', v:none, s:column, v:none)
call s:hi('LineNr', s:passive, s:bg, v:none)

" cursor / dynamic / other
call s:hi('Cursor', s:bg, s:fg, v:none)
call s:hi('CursorLine', v:none, s:bars, 'NONE')
call s:hi('CursorColumn', v:none, s:bars, 'NONE')
call s:hi('DebugStop', v:none, s:bars, 'NONE')
call s:hi('Visual', v:none, s:bars, v:none)
call s:hi('Search', v:none, s:highlight, v:none)
call s:hi('MatchParen', v:none, s:highlight, v:none)

" TODO: who knows
"Scrollbar
"Tooltip
"CursorIM
"IncSearch
"VisualNOS

" restore compatibility settings
let &cpo = save_cpo
