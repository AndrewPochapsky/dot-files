local Keymap = require("andrew.keymap")
local nnoremap = Keymap.nnoremap
local telescope_builtin = require("telescope.builtin")

nnoremap("<leader>f", telescope_builtin.find_files)
nnoremap("<leader>en", function()
    telescope_builtin.find_files({ cwd = "~/.config/nvim" })
end)
nnoremap("<leader>dl", telescope_builtin.diagnostics)
nnoremap("<C-/>", function()
    telescope_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_ivy())
end)
