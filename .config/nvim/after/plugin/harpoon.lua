local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")

vim.keymap.set("n", "<leader>a", harpoon_mark.add_file)
vim.keymap.set("n", "<C-e>", harpoon_ui.toggle_quick_menu)
vim.keymap.set("n", "<C-e>", harpoon_ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>j", function()
    harpoon_ui.nav_file(1)
end)

vim.keymap.set("n", "<leader>k", function()
    harpoon_ui.nav_file(2)
end)

vim.keymap.set("n", "<leader>l", function()
    harpoon_ui.nav_file(3)
end)

vim.keymap.set("n", "<leader>;", function()
    harpoon_ui.nav_file(4)
end)
