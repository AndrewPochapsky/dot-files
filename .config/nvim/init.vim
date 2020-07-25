set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
tnoremap <Esc> <C-\><C-n>

" Making terminal work like in normal vim.
tnoremap <C-w><C-h> <C-\><C-n><C-w><C-h>
tnoremap <C-w><C-j> <C-\><C-n><C-w><C-j>
tnoremap <C-w><C-k> <C-\><C-n><C-w><C-k>
tnoremap <C-w><C-l> <C-\><C-n><C-w><C-l>

command! EditConfig e ~/.config/nvim/init.vim

autocmd WinEnter *
 \ if &buftype ==# 'terminal' |
 \  startinsert |
 \ endif

"let g:vim_be_good_floating = 0
