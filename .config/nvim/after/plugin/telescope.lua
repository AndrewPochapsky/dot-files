local telescope_builtin = require("telescope.builtin")

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        file_ignore_patterns = { ".fasl" },
        prompt_position = "top",
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<esc>"] = actions.close,
            },
        },
    },
})
telescope.load_extension("fzf")

vim.keymap.set("n", "<leader>pf", function()
    telescope_builtin.find_files({ winblend = 5 })
end)
vim.keymap.set("n", "<leader>ps", function()
    telescope_builtin.grep_string({ winblend = 5, search = vim.fn.input("Grep for > ") })
end)
vim.keymap.set("n", "<leader>pw", function()
    telescope_builtin.grep_string({ winblend = 5, search = vim.fn.expand("<cword>") })
end)
vim.keymap.set("n", "<leader>en", function()
    telescope_builtin.find_files({ winblend = 5, cwd = "~/.config/nvim" })
end)
vim.keymap.set("n", "<leader>pd", function()
    telescope_builtin.diagnostics({ winblend = 5 })
end)
vim.keymap.set("n", "<leader>pq", function()
    telescope_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_ivy())
end)
