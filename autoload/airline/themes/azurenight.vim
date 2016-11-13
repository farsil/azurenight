" Vim airline theme -- azurenight
" Maintainer: farsil

" Default section contents
" section_a     (mode, crypt, paste, spell, iminsert)
" section_b     (hunks, branch)
" section_c     (bufferline or filename)
" section_x     (tagbar, filetype, virtualenv)
" section_y     (fileencoding, fileformat)
" section_z     (percentage, line number, column number)

function! s:rhl(group)
    let l:fg = synIDattr(synIDtrans(hlID(a:group)), 'fg')
    let l:bg = synIDattr(synIDtrans(hlID(a:group)), 'bg')

    " TODO: support multiple styles
    if synIDattr(synIDtrans(hlID(a:group)), 'bold')
        let l:style = 'bold'
    elseif synIDattr(synIDtrans(hlID(a:group)), 'underline')
        let l:style = 'underline'
    else
        let l:style = ''
    endif

    if has('gui_running')
        return [ l:fg, l:bg, '', '', l:style ]
    else
        return [ '', '', l:fg, l:bg, l:style ]
    endif
endfunction

function! s:sp(palette, section, group)
    if !has_key(g:airline#themes#azurenight#palette, a:palette)
        let g:airline#themes#azurenight#palette[a:palette] = {}
    endif

    let g:airline#themes#azurenight#palette[a:palette][a:section] =
        \ s:rhl(a:group)
endfunction

function! s:spg(palette, group_a, group_b, group_c)
    let l:hla = s:rhl(a:group_a)
    let l:hlb = s:rhl(a:group_b)
    let l:hlc = s:rhl(a:group_c)

    let g:airline#themes#azurenight#palette[a:palette] = {
        \ 'airline_a': [ l:hla[0], l:hla[1], l:hla[2], l:hla[3], l:hla[4] ],
        \ 'airline_b': [ l:hlb[0], l:hlb[1], l:hlb[2], l:hlb[3], l:hlb[4] ],
        \ 'airline_c': [ l:hlc[0], l:hlc[1], l:hlc[2], l:hlc[3], l:hlc[4] ],
        \ 'airline_x': [ l:hlc[0], l:hlc[1], l:hlc[2], l:hlc[3], '' ],
        \ 'airline_y': [ l:hlb[0], l:hlb[1], l:hlb[2], l:hlb[3], '' ],
        \ 'airline_z': [ l:hla[0], l:hla[1], l:hla[2], l:hla[3], '' ]
        \ }
endfunction

let g:airline#themes#azurenight#palette = {}

call s:spg('normal', 'AirlineNormalMode', 'AirlineNormalInfo', 'AirlineBar')
call s:sp('normal_modified', 'airline_c', 'AirlineModified')

call s:spg('insert', 'AirlineInsertMode', 'AirlineInsertInfo', 'AirlineBar')
call s:sp('insert_modified', 'airline_c', 'AirlineModified')

call s:spg('replace', 'AirlineReplaceMode', 'AirlineReplaceInfo', 'AirlineBar')
call s:sp('replace_modified', 'airline_c', 'AirlineModified')

call s:spg('visual', 'AirlineVisualMode', 'AirlineVisualInfo', 'AirlineBar')
call s:sp('visual_modified', 'airline_c', 'AirlineModified')

call s:spg('inactive', 'AirlineInactive', 'AirlineInactive', 'AirlineInactive')
call s:sp('accents', 'red', 'AirlineRemark')

