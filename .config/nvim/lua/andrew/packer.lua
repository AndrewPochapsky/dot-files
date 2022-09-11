-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim") -- Package Manager
    use("nvim-lua/plenary.nvim") -- Async support

    use("folke/tokyonight.nvim") -- Colour Scheme
    --use("morhetz/gruvbox") -- Colour Scheme
    use("scrooloose/nerdtree")

    use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP

    use("hrsh7th/nvim-cmp") -- Completion Engine
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" }) -- Fuzzy finder
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- Make fuzzy finder faster
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })

    use("kyazdani42/nvim-web-devicons") -- Icons

    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })

    use("mhartington/formatter.nvim") -- Formatting engine
    use("theprimeagen/harpoon")
end)
