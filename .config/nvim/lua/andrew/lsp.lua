local nnoremap = require("andrew.keymap").nnoremap
local capabilities = require("andrew.cmp").capabilities

-- Go setup
require'lspconfig'.gopls.setup{
    capabilities = capabilities,
    on_attach = function() 
        -- 0 means whatever the current buffer is
        lspRemaps()
    end,
} 

function lspRemaps()
    nnoremap("K", vim.lsp.buf.hover, {buffer = 0}) 
    nnoremap("<leader>vd", vim.lsp.buf.definition, {buffer = 0}) 
    nnoremap("<leader>vi", vim.lsp.buf.implementation, {buffer = 0}) 
    nnoremap("<leader>vt", vim.lsp.buf.type_definition, {buffer = 0}) 
    nnoremap("<leader>vr", vim.lsp.buf.references, {buffer = 0}) 
    nnoremap("<leader>r", vim.lsp.buf.rename, {buffer = 0}) 
end

