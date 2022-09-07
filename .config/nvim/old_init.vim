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

Plug 'tpope/vim-fugitive'

Plug 'ThePrimeagen/vim-be-good'

call plug#end()

" Fuzzy find using :find
set path+=**
set wildignore+=*/min/*,*/vendor/*,*/node_modules/*,*/bower_components/*,*/target/*,*/artifacts/*

let mapleader = " "

"Theme
syntax enable
colorscheme gruvbox
set background=dark

autocmd Filetype html,css,java,javascript,typescript,typescriptreact,javascriptreact setlocal sts=2 ts=2 sw=2

" Remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" NERDTree config
map <C-n> :NERDTreeToggle<CR>

" allows scrolling through the suggestions menu
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

nnoremap ]q :cnext<CR>zz
nnoremap [q :cprev<CR>zz

nnoremap <leader>f :GFiles<CR>

nmap <leader>vd <Plug>(coc-definition)
nmap <leader>vr <Plug>(coc-references)

"Keep things centred
noremap n nzzzv
noremap N Nzzzv
noremap J mzJ`z

"Moving lines in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Jump list mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_operators = 0

"Java config
let java_highlight_functions = 1
let java_highlight_all = 1

command! EditConfig e ~/.config/nvim/init.vim
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=1 S :call Search(<q-args>)

function! Search(pattern)
    execute 'vimgrep /' . a:pattern . '/g **/*'
    copen
endfunction
