local npairs = require("nvim-autopairs")
--require("nvim-autopairs").get_rule("(")[1].not_filetypes = { "lisp" }

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local group = augroup("autopairs", { clear = true })

autocmd("FileType", {
    group = group,
    pattern = { "lisp" },
    callback = function()
        npairs.disable()
    end,
})
