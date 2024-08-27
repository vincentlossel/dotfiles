return {
	-- Obsidian
	{
		"epwalsh/obsidian.nvim",
		lazy = true,
		ft = "markdown",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			local obsidian = require "obsidian"
			obsidian.setup {
				workspaces = {
					{
						name = "Notes",
						path = "~/Documents/Notes",
					},
				},
				completion = {
					nvim_cmp = true,
					min_chars = 3,
				},
				templates = {
					folder = "Templates",
					date_format = "%Y-%m-%d",
					time_format = "%H:%M",
					substitutions = {},
				},
				picker = {
					name = "telescope.nvim",
				},
				ui = {
					enable = false,
				},
				preferred_link_style = "wiki",
				disable_frontmatter = true,
			}
		end,
	},
}
