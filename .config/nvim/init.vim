call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
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

Plug 'ThePrimeagen/vim-be-good'

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
set colorcolumn=120
set number
set relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Fuzzy find using :find
set path+=**
set wildignore+=*/min/*,*/vendor/*,*/node_modules/*,*/bower_components/*

let mapleader = " "

"Theme
syntax enable
colorscheme gruvbox
set background=dark

autocmd Filetype html,css,java,javascript,typescript,typescriptreact setlocal sts=2 ts=2 sw=2

" Remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" NERDTree config
map <C-n> :NERDTreeToggle<CR>

" allows scrolling through the suggestions menu
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

nnoremap <leader>f :GFiles<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" When you press <c-b> in term, it converts it into a file you can
" navigate.
tnoremap <c-b> <c-\><c-n>

tnoremap <Esc> <C-\><C-n>

" Making terminal work like in normal vim.
tnoremap <C-w><C-h> <C-\><C-n><C-w><C-h>
tnoremap <C-w><C-j> <C-\><C-n><C-w><C-j>
tnoremap <C-w><C-k> <C-\><C-n><C-w><C-k>
tnoremap <C-w><C-l> <C-\><C-n><C-w><C-l>

nnoremap <C-p> :call SwitchToTerminal() <CR>
tmap <C-p> <Esc> :call SwitchToTerminal() <CR>

let g:user_emmet_leader_key='<C-Z>'

let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_operators = 0

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
command! EditConfig e ~/.config/nvim/init.vim
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"autocmd WinEnter *
" \ if &buftype ==# 'terminal' |
" \  startinsert |
" \ endif

let s:has_terminal_tab = 0
function! SwitchToTerminal()
    if !s:has_terminal_tab
        :tabnew
        let s:has_terminal_tab = 1
        :term
    else
        norm gt
    endif
endfunction
