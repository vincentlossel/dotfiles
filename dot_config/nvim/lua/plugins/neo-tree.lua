return {
	-- Neo-Tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-web-devicons" },
			{ "MunifTanjim/nui.nvim" },
		},
		config = function()
			local neotree = require "neo-tree"
			neotree.setup {
				filesystem = {
					hide_dotfiles = true,
					hide_hidden = true,
					hide_by_name = {
						"node_modules",
						".git",
					},
					hide_by_pattern = {},
					always_show = {
						".gitignore",
						".env",
					},
					always_show_by_pattern = {},
					never_show = {
						".DS_File",
						"thumbs.db",
					},
				},
				follow_current_file = {
					enabled = true,
					leave_dirs_open = true,
				},
			}
		end,
	},
}
