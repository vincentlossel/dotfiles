return {
	-- Better QuickFix list
	{
		"kevinhwang91/nvim-bqf",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			local bqf = require "bqf"
			bqf.setup {
				auto_enable = true,
				auto_resize_height = true,
				show_title = false,
			}

			-- TODO: Add integrations with other features (diagnostics, TODOs, grep, fzf...)

			-- Keymaps
			-- TODO: Add keymaps
			-- vim.keymap.set("n", "", "", { desc = "" })
		end,
	},
}
