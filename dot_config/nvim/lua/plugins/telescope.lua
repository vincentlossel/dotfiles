return {
	-- Fuzzy Finder (files, lsp, etc)
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			-- Lua functions required
			{ "nvim-lua/plenary.nvim" },
			-- Telescope picker
			{ "nvim-telescope/telescope-ui-select.nvim" },
			-- Icons
			{ "nvim-tree/nvim-web-devicons" },
			-- Fuzzy finder
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable "make" == 1
				end,
			},
		},
		config = function()
			local telescope = require "telescope"
			local builtin = require "telescope.builtin"

			-- Load Telescope
			telescope.setup {
				defaults = {
					mappings = {
						i = { ["<C-Enter>"] = "to_fuzzy_refine" },
					},
				},
				pickers = {
					find_files = {
						hidden = true,
						file_ignore_patterns = {
							"node_modules/",
							"build/",
							"dist/",
							".git/",
							".next/",
							".*_templ.go", -- Templ Generated Files
							".DS_Store",
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			}

			-- Enable Telescope extensions
			pcall(telescope.load_extension, "fzf")
			pcall(telescope.load_extension, "ui-select")

			-- Keymaps
			vim.keymap.set("n", "<Leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<Leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<Leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<Leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<Leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<Leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<Leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<Leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<Leader>s.", builtin.oldfiles, { desc = "[S]earch Recent Files (\".\" for repeat)" })
			vim.keymap.set("n", "<Leader>sb", builtin.buffers, { desc = "[S]earch existing [B]buffers" })
			vim.keymap.set("n", "<Leader>td", "<Cmd>TodoTelescope<CR>", { desc = "Search Todo" })

			-- Current Buffer Fuzzy Search
			vim.keymap.set("n", "<Leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
					winblend = 10,
					previewer = false,
				})
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- Live Grep in open files
			vim.keymap.set("n", "<Leader>s/", function()
				builtin.live_grep {
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				}
			end, { desc = "[S]earch [/] in Open Files" })

			-- Search in nvim configuration
			vim.keymap.set("n", "<Leader>sn", function()
				builtin.find_files { cwd = vim.fn.stdpath "config" }
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},
}
