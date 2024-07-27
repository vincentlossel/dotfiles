return {
	-- Zellij.vim
	{
		"https://git.sr.ht/~swaits/zellij-nav.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			local zellij = require "zellij-nav"
			zellij.setup {}

			-- Keymaps
			vim.keymap.set("n", "<C-h>", "<Cmd>ZellijNavigateLeft<CR>", { silent = true, desc = "" })
			vim.keymap.set("n", "<C-j>", "<Cmd>ZellijNavigateDown<CR>", { silent = true, desc = "" })
			vim.keymap.set("n", "<C-k>", "<Cmd>ZellijNavigateUp<CR>", { silent = true, desc = "" })
			vim.keymap.set("n", "<C-l>", "<Cmd>ZellijNavigateRight<CR>", { silent = true, desc = "" })
		end,
	},
}
