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
let s:normal = [ 'bg', 'fg', 'Bold' ]
let s:normal_dim = [ 'bg', 'info', '' ]
let s:normal_inv = [ 'fg', 'bars', 'Bold' ]
let s:insert = [ 'bg', 'special', 'Bold' ]
let s:insert_dim = [ 'bg', 'modinfo', '' ]
let s:replace = [ 'error', 'emph', 'Bold' ]
let s:replace_dim = [ 'bg', 'passive', '' ]
let s:visual = [ 'bg', 'buffer', 'Bold' ]
let s:visual_dim = [ 'bg', 'bufinfo', '' ]
let s:filename = [ 'emph', 'bars', '' ]
let s:modified = [ 'special', 'bars', '' ]
let s:inactive = [ 'passive', 'bars', '' ]
let s:accent = [ 'remark', 'bars', 'Bold' ]

let g:airline#themes#azurenight#palette = {}

call s:ahig('normal', s:normal, s:normal_dim, s:filename)
call s:ahi('normal_modified', 'airline_c', s:modified)

call s:ahig('insert', s:insert, s:insert_dim, s:filename)
call s:ahi('insert_modified', 'airline_c', s:modified)

call s:ahig('replace', s:replace, s:replace_dim, s:filename)
call s:ahi('replace_modified', 'airline_c', s:modified)

call s:ahig('visual', s:visual, s:visual_dim, s:filename)
call s:ahi('visual_modified', 'airline_c', s:modified)

call s:ahig('inactive', s:inactive, s:inactive, s:inactive)
call s:ahi('accents', 'red', s:accent)

" tabline colors
call s:ahi('tabline', 'airline_tabsel', s:normal)
call s:ahi('tabline', 'airline_tab', s:normal_inv)
call s:ahi('tabline', 'airline_tabtype', s:normal)
call s:ahi('tabline', 'airline_tabfill', s:inactive)
call s:ahi('tabline', 'airline_tabmod', s:insert)
call s:ahi('tabline', 'airline_tabmod_unsel', s:modified)
call s:ahi('tabline', 'airline_tabhid', s:inactive)

" duplicate left side
let s:tabpal = g:airline#themes#azurenight#palette['tabline']
let s:tabpal['airline_tabsel_right'] = s:tabpal['airline_tabsel']
let s:tabpal['airline_tab_right'] = s:tabpal['airline_tab']
let s:tabpal['airline_tabtype_right'] = s:tabpal['airline_tabtype']
let s:tabpal['airline_tabfill_right'] = s:tabpal['airline_tabfill']
let s:tabpal['airline_tabmod_right'] = s:tabpal['airline_tabmod']
let s:tabpal['airline_tabmod_unsel_right'] = s:tabpal['airline_tabmod_unsel']
let s:tabpal['airline_tabhid_right'] = s:tabpal['airline_tabhid']

