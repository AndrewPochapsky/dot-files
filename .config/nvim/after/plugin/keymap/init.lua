local Keymap = require("andrew.keymap")
local nmap = Keymap.nmap
local nnoremap = Keymap.nnoremap
local vnoremap = Keymap.vnoremap
local xnoremap = Keymap.nnoremap


nnoremap("<leader>dj", vim.diagnostic.goto_next)
nnoremap("<leader>dk", vim.diagnostic.goto_prev)

-- Easier quickfix list navigation
nnoremap("]q", "<CMD>cnext<CR>zz")
nnoremap("[q", "<CMD>cprev<CR>zz")

-- Keep things centred
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")

-- Moving lines in visual mode
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

nmap("<C-n>", "<cmd>NERDTreeToggle<CR>")
-- Allows pasting and overriding without losing paste register
xnoremap("<leader>p", "\"_dP")
