return {
	-- Spectre
	{
		"nvim-pack/nvim-spectre",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			local spectre = require "spectre"
			spectre.setup {
				color_devicons = true,
				open_cmd = "vnew",
				live_update = false,
				lnum_for_results = true,
			}

			-- Keymaps
			vim.keymap.set("n", "<Leader>S", spectre.toggle, { desc = "Toggle Spectre" })
			vim.keymap.set("n", "<Leader>Sw", spectre.open_visual, { desc = "[S]earch current [w]ord" })
			vim.keymap.set("v", "<Leader>Sw", spectre.open_visual, { desc = "[S]earch current [w]ord" })
			vim.keymap.set("n", "<Leader>Sp", spectre.open_file_search, { desc = "Open file search" })
		end,
	},
}
