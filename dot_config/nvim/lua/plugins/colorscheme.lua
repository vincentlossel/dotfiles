return {
	-- Catpuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		config = function()
			require("catppuccin").setup {
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
			}

			-- Highlights
			vim.cmd.hi "Comment gui=none"

			-- Load colorscheme
			vim.cmd.colorscheme "catppuccin-mocha"
		end,
	},
}
