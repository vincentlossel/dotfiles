return {
	-- Barbecue
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			{ "SmiteshP/nvim-navic" },
		},
		config = function()
			local barbecue = require "barbecue"
			barbecue.setup {}
		end,
	},
}
