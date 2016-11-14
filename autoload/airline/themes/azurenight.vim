" Vim airline theme -- azurenight
" Maintainer: farsil

"   Airline section names
" a > b > c       x < y < z

if has('gui_running')
    function! s:ab(fg, bg, style)
        return [ g:cs_palette[a:fg], g:cs_palette[a:bg], '', '', a:style ]
    endfunction
else
    function! s:ab(fg, bg, style)
        return [ '', '', g:cs_palette[a:fg], g:cs_palette[a:bg], a:style ]
    endfunction
endif

function! s:ahi(palette, section, group)
    if !has_key(g:airline#themes#azurenight#palette, a:palette)
        let g:airline#themes#azurenight#palette[a:palette] = {}
    endif

    let g:airline#themes#azurenight#palette[a:palette][a:section] =
        \ s:ab(a:group[0], a:group[1], a:group[2])
endfunction

function! s:ahig(palette, group_a, group_b, group_c)
    let g:airline#themes#azurenight#palette[a:palette] = {
        \ 'airline_a': s:ab(a:group_a[0], a:group_a[1], a:group_a[2]),
        \ 'airline_b': s:ab(a:group_b[0], a:group_b[1], a:group_b[2]),
        \ 'airline_c': s:ab(a:group_c[0], a:group_c[1], a:group_c[2]),
        \ 'airline_x': s:ab(a:group_c[0], a:group_c[1], ''),
        \ 'airline_y': s:ab(a:group_b[0], a:group_b[1], ''),
        \ 'airline_z': s:ab(a:group_a[0], a:group_a[1], '')
        \ }
endfunction

" do not use v:none, airline does not accept it
let s:normal_a = [ 'bg', 'fg', 'Bold' ]
let s:normal_b = [ 'active', 'info', '' ]
let s:insert_a = [ 'bg', 'special', 'Bold' ]
let s:insert_b = [ 'bg', 'modinfo', '' ]
let s:replace_a = [ 'error', 'emph', 'Bold' ]
let s:replace_b = [ 'bg', 'passive', '' ]
let s:visual_a = [ 'bg', 'buffer', 'Bold' ]
let s:visual_b = [ 'bg', 'bufinfo', '' ]
let s:filename = [ 'emph', 'bars', '' ]
let s:modified = [ 'special', 'bars', '' ]
let s:inactive = [ 'passive', 'bars', '' ]
let s:accent = [ 'remark', 'bars', 'Bold' ]

let g:airline#themes#azurenight#palette = {}

call s:ahig('normal', s:normal_a, s:normal_b, s:filename)
call s:ahi('normal_modified', 'airline_c', s:modified)

call s:ahig('insert', s:insert_a, s:insert_b, s:filename)
call s:ahi('insert_modified', 'airline_c', s:modified)

call s:ahig('replace', s:replace_a, s:replace_b, s:filename)
call s:ahi('replace_modified', 'airline_c', s:modified)

call s:ahig('visual', s:visual_a, s:visual_b, s:filename)
call s:ahi('visual_modified', 'airline_c', s:modified)

call s:ahig('inactive', s:inactive, s:inactive, s:inactive)
call s:ahi('accents', 'red', s:accent)

" tabline colors (WIP)
call s:ahi('tabline', 'airline_tabsel', s:normal_a)
call s:ahi('tabline', 'airline_tab', s:normal_b)

