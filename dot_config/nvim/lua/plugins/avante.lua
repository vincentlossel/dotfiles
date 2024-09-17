return {
	-- Avante.nvim
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		build = "make",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "stevearc/dressing.nvim" },
			{ "MunifTanjim/nui.nvim" },
		},
		config = function()
			local avante = require "avante"
			avante.setup {
				provider = "claude",
				auto_suggestion_provider = "claude",
				claude = {
					endpoint = "https://api.anthropic.com",
					model = "claude-3-5-sonnet-20240620",
					temperature = 0,
					max_tokens = 4096,
				},
				behaviour = {
					auto_suggestion = false,
					auto_set_highlight_group = true,
					auto_set_keymaps = true,
					auto_apply_diff_after_generation = false,
					support_paste_from_clipboard = false,
				},
				windows = {
					position = "right",
					wrap = true,
					width = 30,
					sidebar_header = {
						align = "center",
						rounded = "true",
					},
				},
			}
		end,
	},
}
