return {
	-- Toggleterm
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local toggleterm = require "toggleterm"

			toggleterm.setup {}
		end,
	},
}
