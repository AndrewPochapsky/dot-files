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
let g:netrw_list_hide= '.*\.swp$'
let g:netrw_altv=0

"Theme
syntax enable 

"Open Netrw upon starting vim
autocmd VimEnter * :Lexplore

"Allows Netrw to create new file without opening it 
autocmd filetype netrw call Netrw_mappings()
function! Netrw_mappings()
  noremap <buffer>% :call CreateInPreview()<cr>
endfunction

function! CreateInPreview()
  let l:filename = input("please enter filename: ")
  execute 'silent !touch ' . b:netrw_curdir.'/'.l:filename 
  redraw!
endf

noremap <silent> <C-E> :Lexplore<CR>
