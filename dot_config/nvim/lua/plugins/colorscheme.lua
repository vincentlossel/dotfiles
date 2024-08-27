return {
	-- Catpuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		config = function()
			local catppuccin = require "catppuccin"
			catppuccin.setup {
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = false,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
				},
				color_overrides = {
					mocha = {
						base = "#11111a",
						mantle = "#11111a",
						crust = "#11111a",
					},
				},
			}

			-- Highlights
			vim.cmd.hi "Comment gui=none"

			-- Load colorscheme
			vim.cmd.colorscheme "catppuccin-mocha"
		end,
	},
}
