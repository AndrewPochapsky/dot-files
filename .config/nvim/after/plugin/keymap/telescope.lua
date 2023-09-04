local Keymap = require("andrew.keymap")
local nnoremap = Keymap.nnoremap
local telescope_builtin = require("telescope.builtin")

nnoremap("<leader>pf", function()
    telescope_builtin.find_files({ winblend = 5 })
end)
nnoremap("<leader>ps", function()
    telescope_builtin.grep_string({ winblend = 5, search = vim.fn.input("Grep for > ") })
end)
nnoremap("<leader>pw", function()
    telescope_builtin.grep_string({ winblend = 5, search = vim.fn.expand("<cword>") })
end)
nnoremap("<leader>en", function()
    telescope_builtin.find_files({ winblend = 5, cwd = "~/.config/nvim" })
end)
nnoremap("<leader>pd", function()
    telescope_builtin.diagnostics({ winblend = 5 })
end)
nnoremap("<leader>pq", function()
    telescope_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_ivy())
end)
