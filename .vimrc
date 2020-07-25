";Plug in stuff
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jalvesaq/Nvim-R'
Plug 'wlangstroth/vim-racket'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" javascript related
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax'

" Only nvim plugins
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
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
set noswapfile
set noequalalways
set colorcolumn=80
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set tabstop=4
set shiftwidth=4
set path+=**
set wildignore+=*/min/*,*/vendor/*,*/node_modules/*,*/bower_components/*

"Theme
syntax enable
colorscheme gruvbox

set background=dark
" for html files, 2 spaces
autocmd Filetype html,css,javascript,typescript,typescriptreact,racket,scheme,dart setlocal ts=2 sw=2
autocmd Filetype go,java setlocal ts=4 sw=4

" Remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" NERDTree config
"autocmd VimEnter * NERDTree
map <C-n> :NERDTreeToggle<CR>

" allows scrolling through the suggestions menu
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

nnoremap <C-p> :GFiles<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" When you press <c-b> in term, it converts it into a file you can
" navigate.
tnoremap <c-b> <c-\><c-n>
let g:user_emmet_leader_key='<C-Z>'

let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_operators = 0
let dart_format_on_save = 1

"Java config
let java_highlight_functions = 1
let java_highlight_all = 1


"coc config

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes


