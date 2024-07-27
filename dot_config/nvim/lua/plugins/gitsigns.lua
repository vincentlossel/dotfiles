return {
	-- Git Signs
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup {
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			}

			vim.keymap.set("n", "<Leader>gp", "<Cmd>Gitsigns preview_hunk_inline<CR>", { desc = "[G]it [P]review Changes Inline" })
			vim.keymap.set("n", "<Leader>gb", "<Cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "[G]it [B]lame inline" })
		end,
	},
}
