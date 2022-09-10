local nnoremap = require("andrew.keymap").nnoremap
local telescope_builtin = require('telescope.builtin')
local telescope = require('telescope')
local actions = require("telescope.actions")

telescope.setup {
    defaults = {
        prompt_position="top",
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<esc>"] = actions.close
            }
        }
    }
}
telescope.load_extension('fzf')

-- Telescope specific remaps
nnoremap("<leader>f", telescope_builtin.find_files)
nnoremap("<leader>en", function() telescope_builtin.find_files({cwd="~/.config/nvim"}) end)
nnoremap("<leader>dl", telescope_builtin.diagnostics)
--nnoremap("<C-/>", function() telescope_builtin.current_buffer_fuzzy_find({sorting_strategy="ascending", layout_config = {prompt_position = "top"}}) end)
nnoremap("<C-/>", function() telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_ivy()) end)
