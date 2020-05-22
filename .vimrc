";Plug in stuff
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jalvesaq/Nvim-R'
Plug 'wlangstroth/vim-racket'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" javascript related
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax'
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
autocmd Filetype go,java setlocal ts=4 sw=4
"Theme
syntax enable
colorscheme gruvbox

" NERDTree config
"autocmd VimEnter * NERDTree
map <C-n> :NERDTreeToggle<CR>

" changes the suggestions menu to not look pink
"highlight Pmenu ctermbg=gray guibg=gray

" allows scrolling through the suggestions menu
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

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
let dart_format_on_save = 1

"Java config
let java_highlight_functions = 1
let java_highlight_all = 1


nnoremap <C-p> :GFiles<CR>

"coc config

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

