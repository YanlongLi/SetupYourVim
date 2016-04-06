" =============================================================================
"      FileName: vim-autoformat.vim
"          Desc: 
"      HomePage: 
" =============================================================================
let g:formatdef_my_custom_c = '"astyle --mode=c --style=google -pcHs2"'
let g:formatters_c = ['my_custom_c']
let g:formatters_cpp = ['my_custom_c']

nmap <c-s-f> : Autoformat<cr>
