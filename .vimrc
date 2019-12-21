"Plug in stuff
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'

" javascript related
Plug 'mattn/emmet-vim'
Plug 'gregsexton/matchtag' "highlights end HTML tags
let g:ale_completion_enabled = 1
Plug 'dense-analysis/ale'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax'
let g:jsx_ext_required = 0
call plug#end()

"Basic things
set incsearch
set autoindent
set backspace=indent,eol,start
set hidden
set ruler
set wildmenu
set noequalalways

" for html files, 2 spaces
autocmd Filetype html,javascript setlocal ts=2 sw=2 

"Theme
syntax enable 

" NERDTree config
autocmd VimEnter * NERDTree
map <C-n> :NERDTreeToggle<CR>

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\}
