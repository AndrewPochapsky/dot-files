"Plug in stuff
call plug#begin('~/.vim/plugged')

"Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jalvesaq/Nvim-R'
Plug 'wlangstroth/vim-racket'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" javascript related
Plug 'mattn/emmet-vim'
let g:ale_completion_enabled = 1
Plug 'dense-analysis/ale'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax'
let g:jsx_ext_required = 0
call plug#end()

"Basic things
set incsearch
set ignorecase
set hlsearch
set smartcase
set autoindent
set backspace=indent,eol,start
set hidden
set ruler
set wildmenu
set noequalalways
set number

" for html files, 2 spaces
autocmd Filetype html,javascript,racket,scheme,dart setlocal ts=2 sw=2
autocmd Filetype go setlocal ts=4 sw=4
"Theme
syntax enable

"TODO: this no longer works properly after adding coc.nvim
" NERDTree config
autocmd VimEnter * NERDTree
map <C-n> :NERDTreeToggle<CR>

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'python': ['black'],
\   'dart': ['dartfmt'],
\}

let g:lsc_auto_map = v:true

" Trigger configuration for utlisnips. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:user_emmet_leader_key='<C-Z>'

let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_operators = 0

" coc stuff
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Give more space for displaying messages.
set cmdheight=2

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

highlight CocErrorSign guifg=#c7000d
highlight Pmenu ctermbg=gray guibg=gray

inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"
