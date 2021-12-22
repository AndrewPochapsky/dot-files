call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

"LSP stuff
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()

lua require'lspconfig'.rls.setup{}


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

autocmd WinEnter *
 \ if &buftype ==# 'terminal' |
 \  startinsert |
 \ endif

" NERDTree config
map <C-n> :NERDTreeToggle<CR>

" allows scrolling through the suggestions menu
"inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
"inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>

nnoremap <leader>gln :cnext<CR>
nnoremap <leader>glp :cprev<CR>

nnoremap <leader>f :GFiles<CR>

"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gr <Plug>(coc-references)

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

"set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<C-j>'] = function(fallback)
              if cmp.visible() then
                    cmp.select_next_item()
              end
          end,
        ['<C-k>'] = function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              end
        end
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['rls'].setup {
    capabilities = capabilities
  }
EOF
