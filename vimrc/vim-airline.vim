" =============================================================================
"      FileName: vim-airline.vim
"          Desc: 
"      HomePage: 
" =============================================================================
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'E:'
let g:airline#extensions#ycm#warning_symbol = 'W:'
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
    if g:airline_theme == 'dark'
        for p in values(a:palette) 
            for s in values(p)
                let s[0] = 0
                let s[1] = 255
                let s[2] = 0
                let s[3] = 255
            endfor
        endfor
    endif
endfunction
