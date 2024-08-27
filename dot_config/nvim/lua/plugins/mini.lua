return {
	-- Collection of various small independent plugins/modules
	{
		"echasnovski/mini.nvim",
		config = function()
			-- Extends a and i objects
			local mini_ai = require "mini.ai"
			mini_ai.setup {
				n_lines = 500,
			}

			-- Surround actions
			local mini_surround = require "mini.surround"
			mini_surround.setup {}

			-- Autopairs
			local mini_pairs = require "mini.pairs"
			mini_pairs.setup {}

			-- Files
			local mini_files = require "mini.files"
			mini_files.setup {
				content = {
					filter = nil,
					prefix = nil,
					sort = nil,
				},
				options = {
					permanent_delete = true,
					use_as_default_explorer = false,
				},
				window = {
					max_number = math.huge,
					preview = false,
					width_focus = 50,
					width_nofocus = 15,
					width_preview = 25,
				},
			}

			-- Keymaps
			vim.keymap.set("n", "<Leader>E", "<Cmd>lua MiniFiles.open()<CR>", { desc = "" })
		end,
	},
}
