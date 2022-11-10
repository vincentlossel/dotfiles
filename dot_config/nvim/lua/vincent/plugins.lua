local status, packer = pcall(require, "packer")
if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function()

    -- Basics
    use("wbthomason/packer.nvim") -- Package manager
    use("sbdchd/neoformat") -- Code formatter

    -- Windows and panes
    use("christoomey/vim-tmux-navigator") -- Easy navigation between nvim and tmux

    -- Tools
    use("nvim-lua/plenary.nvim") -- Lua functions
    use("nvim-lua/popup.nvim") -- Popup API from Vim
    use("nvim-telescope/telescope.nvim") -- The good stuff
    use("tpope/vim-surround") -- Mappings of surroundings
    use("tpope/vim-sensible") -- Universal set of defaults 
    use("MunifTanjim/nui.nvim") -- UI component library for nvim

    -- Git
    use("tpope/vim-fugitive") -- Git wrapper
        
    -- LSP stuff
    use("neovim/nvim-lspconfig") -- LSP config for nvim
    use("onsails/lspkind-nvim") -- Adding pictograms to nvim built-in LSP
    use("nvim-lua/lsp_extensions.nvim") -- 
    use("simrat39/symbols-outline.nvim") -- Tree view for symbols in nvim
    use("glepnir/lspsaga.nvim") -- Performant UI for LSP
    use("windwp/nvim-autopairs") -- 
       
    -- Statusline
    use("nvim-lualine/lualine.nvim") -- Status line 

    -- Autocompletions
    use("hrsh7th/nvim-cmp") -- Completion 
    use("hrsh7th/cmp-nvim-lsp") -- 
    use("hrsh7th/cmp-buffer") -- 
    use("hrsh7th/cmp-path") -- 
    use("saadparwaiz1/cmp_luasnip") --
    
    -- Snippets
    use("L3MON4D3/LuaSnip") -- Snippet engine in Lua
    use("rafamadriz/friendly-snippets") -- Collection of snippets

    -- Debugger
    use("mfussenegger/nvim-dap") -- DAP 
    use("rcarriga/nvim-dap-ui") -- UI for DAP
    use("theHamsta/nvim-dap-virtual-text") -- Inline text for DAP

    -- Colorscheme
    use("folke/tokyonight.nvim") -- TOKYOOOOOOO

    -- Icons
    use("kyazdani42/nvim-web-devicons") -- Icons

    -- Code hightlights
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" }) -- Highlighter
    use("nvim-treesitter/playground") -- 
    use("romgrk/nvim-treesitter-context") -- Code context

end)

