require("andrew.set")
require("andrew.format")
require("andrew.lsp")
require("andrew.packer")
require("andrew.telescope")

--local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Remove trailing whitespace
autocmd("BufWritePre", {
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

-- Format on save
autocmd("BufWritePost", {
    pattern = "*",
    command = "FormatWrite",
})

autocmd("FileType", {
    pattern = { "html", "css", "java", "javascript", "typescript", "typescriptreact", "javascriptreact" },
    callback = function()
        vim.cmd("setlocal sts=2 ts=2 sw=2")
    end,
})
