return {
	-- LazyGit
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		keys = {
			{ "<Leader>gg", "<Cmd>LazyGit<CR>", { desc = "Open LazyGit" } },
		},
	},
}
