local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
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
