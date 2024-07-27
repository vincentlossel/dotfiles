return {
	-- Indentation
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		config = function()
			local ibl = require "ibl"
			ibl.setup {}
		end,
	},
}
