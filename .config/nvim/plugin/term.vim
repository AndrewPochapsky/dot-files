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
tmap <C-p> <Esc> <Esc> :call SwitchToTerminal() <CR>

autocmd WinEnter *
 \ if &buftype ==# 'terminal' |
 \  startinsert |
 \ endif

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
