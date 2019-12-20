"Plug in stuff
call plug#begin('~/.vim/plugged')

call plug#end()

"Basic things
set incsearch
set autoindent
set backspace=indent,eol,start
set hidden
set ruler
set wildmenu
set noequalalways

"netrw settings
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=20

"Theme
syntax enable 

"Open Netrw upon starting vim
autocmd VimEnter * :Vexplore

noremap <silent> <C-E> :Vexplore<CR>
