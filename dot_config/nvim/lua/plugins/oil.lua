return {
	-- Oil
	{
		"stevearc/oil.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
		config = function()
			local oil = require "oil"
			oil.setup {
				default_file_explorer = true,
				skip_confirm_for_simple_edits = true,
				columns = {
					"icon",
					"permissions",
				},
				view_options = {
					-- Sort
					natural_order = true,
					case_insensitive = false,
					sort = {
						{ "type", "asc" },
						{ "name", "asc" },
					},
					-- Hidden files
					show_hidden = true,
					is_hidden_file = function(name, _)
						return vim.startswith(name, ".")
					end,
					is_always_hidden = function(name, _)
						return name == ".." or name == ".git" or name == ".DS_Store" or string.match(name, "_templ.go")
					end,
				},
				win_options = {
					wrap = true,
					signcolumn = "no",
					conceallevel = 3,
				},
				float = {
					padding = 2,
					max_width = 0,
					max_height = 0,
					border = "rounded",
					win_options = {
						winblend = 0,
					},
					preview_split = "auto",
				},
			}

			-- Open parent directory in current window
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

			-- Open parent directory in floating window
			-- vim.keymap.set("n", "<Leader>-", oil.toggle_float, { desc = "Open parent directory in a floating window" })
		end,
	},
}
