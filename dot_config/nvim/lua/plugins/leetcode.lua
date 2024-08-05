return {
	-- Leetcode
	{
		"kawre/leetcode.nvim",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "MunifTanjim/nui.nvim" },
		},
		config = function()
			local leetcode = require "leetcode"
			leetcode.setup {
				lang = "go",
			}
		end,
	},
}
