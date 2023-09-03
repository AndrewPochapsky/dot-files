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

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        lspRemaps()
    end,
})

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

configs.solidity = {
    default_config = {
        cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
        filetypes = { "solidity" },
        root_dir = lspconfig.util.find_git_ancestor,
        single_file_support = true,
    },
}

lspconfig.solidity.setup({})

-- Go setup
lspconfig.gopls.setup({
    capabilities = capabilities,
})

-- Typescript setup
lspconfig.tsserver.setup({
    capabilities = capabilities,
})

--Rust setup
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                allFeatures = true,
                overrideCommand = {
                    "cargo",
                    "clippy",
                    "--workspace",
                    "--message-format=json",
                    "--all-targets",
                    "--all-features",
                },
            },
        },
    },
})

-- Lua setup
lspconfig.lua_ls.setup({
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

vim.o.updatetime = 250
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
