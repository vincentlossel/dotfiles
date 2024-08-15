return {
	-- Collection of various small independent plugins/modules
	{
		"echasnovski/mini.nvim",
		config = function()
			-- Extends a and i objects
			local mini_ai = require "mini.ai"
			mini_ai.setup {
				n_lines = 500,
			}

			-- Surround actions
			local mini_surround = require "mini.surround"
			mini_surround.setup()

			-- Autopairs
			local mini_pairs = require "mini.pairs"
			mini_pairs.setup()

			-- Files
			local mini_files = require "mini.files"
			mini_files.setup()
		end,
	},
}
