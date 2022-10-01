require("andrew.set")
require("andrew.format")
require("andrew.lsp")
require("andrew.packer")
require("andrew.telescope")
require("andrew.debugger")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local group = augroup("andrew", { clear = true })

-- Remove trailing whitespace
autocmd("BufWritePre", {
    group = group,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

-- Format on save
autocmd("BufWritePost", {
    group = group,
    pattern = "*",
    command = "FormatWrite",
})

autocmd("FileType", {
    group = group,
    pattern = { "html", "css", "java", "javascript", "typescript", "typescriptreact", "javascriptreact" },
    callback = function()
        vim.cmd("setlocal sts=2 ts=2 sw=2")
    end,
})

-- Enter terminals right away
autocmd("WinEnter", {
    group = group,
    pattern = "zsh",
    callback = function()
        vim.cmd("startinsert")
    end,
})
