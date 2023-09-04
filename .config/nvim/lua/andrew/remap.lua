vim.keymap.set("n", "<leader>qj", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>qk", vim.diagnostic.goto_prev)

-- Easier quickfix list navigation
vim.keymap.set("n", "]q", "<CMD>cnext<CR>zz")
vim.keymap.set("n", "[q", "<CMD>cprev<CR>zz")

-- Keep things centred
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")

-- Moving lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>")
-- Allows pasting and overriding without losing paste register
vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("t", "<C-b>", "<C-\\><C-n>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Making terminal work like in normal vim.
vim.keymap.set("t", "<C-w><C-h>", "<C-\\><C-n><C-w><C-h>")
vim.keymap.set("t", "<C-w><C-j>", "<C-\\><C-n><C-w><C-j>")
vim.keymap.set("t", "<C-w><C-k>", "<C-\\><C-n><C-w><C-k>")
vim.keymap.set("t", "<C-w><C-l>", "<C-\\><C-n><C-w><C-l>")
