return {
	-- refactoring.nvim
	{
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			local refactoring = require "refactoring"
			refactoring.setup {}
		end,
	},
}
