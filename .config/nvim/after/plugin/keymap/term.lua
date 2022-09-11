local Keymap = require("andrew.keymap")
local tnoremap = Keymap.tnoremap
local nnoremap = Keymap.nnoremap
local tmap = Keymap.tmap

tnoremap("<C-b>", "<C-\\><C-n>")
tnoremap("<Esc>", "<C-\\><C-n>")

-- Making terminal work like in normal vim.
tnoremap("<C-w><C-h>", "<C-\\><C-n><C-w><C-h>")
tnoremap("<C-w><C-j>", "<C-\\><C-n><C-w><C-j>")
tnoremap("<C-w><C-k>", "<C-\\><C-n><C-w><C-k>")
tnoremap("<C-w><C-l>", "<C-\\><C-n><C-w><C-l>")

nnoremap("<C-p>", require("andrew.term").switchToTerm)
tmap("<C-p>", "<CMD>tabfirst<CR>")
