local nnoremap = require("andrew.keymap").nnoremap
local capabilities = require("andrew.cmp").capabilities

local function lspRemaps()
    nnoremap("K", vim.lsp.buf.hover, { buffer = 0 })
    nnoremap("<leader>vd", vim.lsp.buf.definition, { buffer = 0 })
    nnoremap("<leader>vi", vim.lsp.buf.implementation, { buffer = 0 })
    nnoremap("<leader>vt", vim.lsp.buf.type_definition, { buffer = 0 })
    nnoremap("<leader>vr", vim.lsp.buf.references, { buffer = 0 })
    nnoremap("<leader>r", vim.lsp.buf.rename, { buffer = 0 })
end

-- Go setup
require("lspconfig").gopls.setup({
    capabilities = capabilities,
    on_attach = function()
        lspRemaps()
    end,
})

-- Typescript setup
require("lspconfig").tsserver.setup({
    capabilities = capabilities,
    on_attach = function()
        lspRemaps()
    end,
})

-- Lua setup
require("lspconfig").sumneko_lua.setup({
    on_attach = function()
        lspRemaps()
    end,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                --path = vim.split(package.path, ";"),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})
