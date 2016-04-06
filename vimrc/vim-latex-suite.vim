" =============================================================================
"      FileName: vim-latex-suite.vim
"          Desc: 
"      HomePage: 
" =============================================================================
" latex-suit: user \lx command to change compiler to xelatex
" http://blog.csdn.net/guanggy/article/details/4790111
" http://tex.stackexchange.com/questions/150770/how-to-make-vim-short-key-for-xelatex-and-pdflatex-both
let g:Tex_Flavor = "pdflatex"
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode $*'
let g:Tex_IgnoreLevel=9
" set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
function SetXeTex()
		let g:Tex_DefaultTargetFormat = 'pdf'
    let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'
endfunction
map <Leader>lx :<C-U>call SetXeTex()<CR>
