return {
	-- Illuminate
	{
		"RRethy/vim-illuminate",
		config = function()
			local illuminate = require "illuminate"
			illuminate.configure {
				providers = {
					"lsp",
					"treesitter",
					"regex",
				},
				delay = 100,
			}
		end,
	},
}
