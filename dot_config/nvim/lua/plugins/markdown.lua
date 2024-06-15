return {
	-- Headlines
	{
		"lukas-reineke/headlines.nvim",
		after = "nvim-treesitter",
		config = function()
			require("headlines").setup()
		end,
	},
	-- Live Preview
	{
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup()
		end,
	},
	-- Obsidian-like Features
	{
		"epwalsh/obsidian.nvim",
		config = function()
			require("obsidian").setup({
				workspaces = {
					{
						name = "Personal",
						path = "~/Documents/Notes/Personal",
					},
					{
						name = "Work",
						path = "~/Documents/Notes/Work",
					},
				},
				-- TODO: Configure templates, picker (telescope), and journal
			})
		end,
	},
}
