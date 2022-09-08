local nmap = require("andrew.keymap").nmap
local nnoremap = require("andrew.keymap").nnoremap

nmap("<C-n>", "<cmd>NERDTreeToggle<CR>")

nnoremap("<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
nnoremap("<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
--nnoremap("<leader>dl", "<CMD>Telescope diagnostics<CR>, {buffer = 0})
