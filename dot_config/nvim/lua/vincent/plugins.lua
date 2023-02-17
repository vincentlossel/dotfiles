local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
    print("ERROR: packer not found!")
    return
end

-- Reloading plugins.lua on change
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup stop
]])

-- Packer
vim.cmd [[packadd packer.nvim]]

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end
    }
})

packer.startup(function(use)

    -- Basics
    use("wbthomason/packer.nvim")
    use("tpope/vim-sensible")

    -- Tools
    use("tpope/vim-surround")
    use("ThePrimeagen/harpoon")
    use("mbbill/undotree")
    use("preservim/tagbar")
    use("numToStr/Comment.nvim")
    -- use("github/copilot.vim")

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
        }
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make"
    }
    use("nvim-telescope/telescope-dap.nvim")

    -- Git
    use("tpope/vim-fugitive")
    use("lewis6991/gitsigns.nvim")

    -- LSP stuff
    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "saadparwaiz1/cmp_luasnip" },

            -- Autopairs
            { "windwp/nvim-autopairs" },

            -- GREP
            { "BurntSushi/ripgrep" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },

            -- UI
            { "onsails/lspkind-nvim" },
        }
    }

    -- File explorer
    use("kyazdani42/nvim-tree.lua")
    use("kyazdani42/nvim-web-devicons")

    -- Statusline
    use("nvim-lualine/lualine.nvim")

    -- Bufferline
    use("akinsho/bufferline.nvim")

    -- Debugger
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")
    use("leoluz/nvim-dap-go")
    use("mfussenegger/nvim-dap-python")

    -- DB
    -- use("tpope/vim-dadbod")
    -- use("kristijanhusak/vim-dadbod-ui")

    -- Colorscheme
    use("folke/tokyonight.nvim")

    -- Code hightlights
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")
    use("folke/todo-comments.nvim")

    -- Docstrings
    use("danymat/neogen")

    -- Dashboard
    use("startup-nvim/startup.nvim")

end)
