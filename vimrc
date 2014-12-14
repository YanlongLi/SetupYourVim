set mouse=c
set hlsearch

" copy define fro common.vim
" System dependent options
set dictionary+=~/.dictionary,~/.mail_aliases   " Dictionary
" set backupdir=~/.vim/backup,~/tmp,.,~/,/tmp                   " Set backup dir to .
set backupdir=~/.vim/backup,/tmp
set tags+=./tags;/                              " Upward tag search
set printoptions+=syntax:y                      " Use syntax hilighting when printing

" Status line
set statusline=%<%f\ %y[%{&ff}]%m%r%w%a\ %=%l/%L,%c%V\ %P
set laststatus=2                " Always show status bar

set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,CVS/,tags

" lansunlong define
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "pdflatex"
let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode $*'
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
" latex-suit: user \lx command to change compiler to xelatex
" http://blog.csdn.net/guanggy/article/details/4790111
" http://tex.stackexchange.com/questions/150770/how-to-make-vim-short-key-for-xelatex-and-pdflatex-both
function SetXeTex()
		let g:Tex_DefaultTargetFormat = 'pdf'
    let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'
endfunction
map <Leader>lx :<C-U>call SetXeTex()<CR>
""
set autoindent
syntax on
"inoremap ( ()<ESC>i
"inoremap { {}<ESC>i
"inoremap [ []<ESC>i
"inoremap " ""<ESC>i
set ts=2
set sw=2
set showcmd
""
"##### auto fcitx  ###########
let g:input_toggle = 1
function! Fcitx2en()
	let s:input_status = system("fcitx-remote")
	if s:input_status == 2
		let g:input_toggle = 1
		let l:a = system("fcitx-remote -c")
	endif
endfunction

function! Fcitx2zh()
	let s:input_status = system("fcitx-remote")
	if s:input_status != 2 && g:input_toggle == 1
		let l:a = system("fcitx-remote -o")
		let g:input_toggle = 0
	endif
endfunction

set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
"进入插入模式
""autocmd InsertEnter * call Fcitx2zh()
"##### auto fcitx end ######
au BufEnter,BufRead *.py setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class



" Table-mode
" Use this option to define the table corner character
let g:table_mode_corner = '|'
" Use this option to define the delimiter which used by
let g:table_mode_delimiter = ' '

"
set nohlsearch
" ghmarkdown
" augroup markdown
"     au!
"     au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
" augroup END

