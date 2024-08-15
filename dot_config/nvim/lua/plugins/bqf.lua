return {
	-- Better quickfix list
	{
		"kevinhwang91/nvim-bqf",
		deps = {
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			local bqf = require "bqf"
			bqf.setup {
				auto_enable = true,
			}
		end,
	},
}
