return {
	-- Go.nvim
	{
		"ray-x/go.nvim",
		dependencies = {
			{ "ray-x/guihua.lua" },
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		ft = { "go", "gomod" },
		config = function()
			local go = require "go"
			go.setup {
				disable_defaults = false,
				verbose = false,
			}
		end,
	},
}
