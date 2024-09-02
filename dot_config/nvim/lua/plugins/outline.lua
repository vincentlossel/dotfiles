return {
	-- Outline.nvim
	{
		"hedyhli/outline.nvim",
		lazy = true,
		config = function()
			local outline = require "outline"
			outline.setup {
				position = "right",
			}

			-- Keymaps
			vim.keymap.set("n", "<Leader>o", "<Cmd>Outline!<CR>", { desc = "" })
		end,
	},
}
