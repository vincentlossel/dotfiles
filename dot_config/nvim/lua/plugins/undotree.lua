return {
	-- Undotree
	{
		"jiaoshijie/undotree",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			local undotree = require "undotree"

			undotree.setup {
				float_diff = false,
				layout = "left_bottom",
				position = "left",
				window = {
					winbled = 0,
				},
			}

			-- Keymaps
			vim.keymap.set("n", "<Leader>u", "<Cmd>lua require('undotree').toggle()<CR>", { desc = "Toggle undotree" })
			-- vim.keymap.set("n", "<Leader>uo", "<Cmd>lua require('undotree').open()<CR>", { desc = "Open undotree" })
			-- vim.keymap.set("n", "<Leader>uc", "<Cmd>lua require('undotree').close()<CR>", { desc = "Close undotree" })
		end,
	},
}
