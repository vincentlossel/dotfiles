return {
	-- Comment
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local comments = require "todo-comments"
			comments.setup {
				signs = true,
				sign_priority = 8,
			}
		end,
	},
}
