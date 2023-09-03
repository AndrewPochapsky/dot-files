local Keymap = require("andrew.keymap")
local nnoremap = Keymap.nnoremap
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")

nnoremap("<leader>a", harpoon_mark.add_file)
nnoremap("<C-e>", harpoon_ui.toggle_quick_menu)
nnoremap("<C-e>", harpoon_ui.toggle_quick_menu)

nnoremap("<leader>j", function()
    harpoon_ui.nav_file(1)
end)

nnoremap("<leader>k", function()
    harpoon_ui.nav_file(2)
end)

nnoremap("<leader>l", function()
    harpoon_ui.nav_file(3)
end)

nnoremap("<leader>;", function()
    harpoon_ui.nav_file(4)
end)
