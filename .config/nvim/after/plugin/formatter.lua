require("formatter").setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        javascript = {
            -- prettierd
            function()
                return {
                    exe = "prettierd",
                    args = { vim.api.nvim_buf_get_name(0) },
                    stdin = true,
                }
            end,
        },
        typescript = {
            -- prettierd
            function()
                return {
                    exe = "prettierd",
                    args = { vim.api.nvim_buf_get_name(0) },
                    stdin = true,
                }
            end,
        },
        lua = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require("formatter.filetypes.lua").stylua,
        },
        rust = {
            require("formatter.filetypes.rust").rustfmt,
        },
        haskell = {
            require("formatter.filetypes.haskell").stylish_haskell,
        },
        -- other formatters ...
    },
})
