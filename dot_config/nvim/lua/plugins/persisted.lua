return {
	-- Persisted.nvim
	{
		"olimorris/persisted.nvim",
		lazy = false,
		config = function()
			local persisted = require "persisted"
			persisted.setup {}
		end,
	},
}
