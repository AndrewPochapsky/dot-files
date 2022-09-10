local nmap = require("andrew.keymap").nmap
local nnoremap = require("andrew.keymap").nnoremap

nmap("<C-n>", "<cmd>NERDTreeToggle<CR>")

nnoremap("<leader>dj", vim.diagnostic.goto_next)
nnoremap("<leader>dk", vim.diagnostic.goto_prev)

--nnoremap ]q :cnext<CR>zz
--nnoremap [q :cprev<CR>zz

nnoremap("]q", "<CMD>cnext<CR>zz")
nnoremap("[q", "<CMD>cprev<CR>zz")

-- TODO: Move to Telescope file and use builtin function
