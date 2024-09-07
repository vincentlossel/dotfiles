return {
	-- Obsidian-like Features
	{
		"epwalsh/obsidian.nvim",
		lazy = true,
		ft = "markdown",
		config = function()
			local obsidian = require "obsidian"
			obsidian.setup {
				workspaces = {
					{
						name = "Notes",
						path = "~/Documents/Notes",
					},
				},
				disable_frontmatter = true,
				preferred_link_style = "markdown",
				completion = {
					nvim_cmp = true,
					min_chars = 5,
				},
				templates = {
					folder = "Templates",
				},
				ui = {
					enable = false,
					update_debounce = 200,
					max_file_length = 5000,
					checkboxes = {
						[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
						["x"] = { char = "", hl_group = "ObsidianDone" },
						[">"] = { char = "", hl_group = "ObsidianRightArrow" },
						["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
						["!"] = { char = "", hl_group = "ObsidianImportant" },
					},
					bullets = { char = "•", hl_group = "ObsidianBullet" },
					external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
					reference_text = { hl_group = "ObsidianRefText" },
					highlight_text = { hl_group = "ObsidianHighlightText" },
					tags = { hl_group = "ObsidianTag" },
					block_ids = { hl_group = "ObsidianBlockID" },
					hl_groups = {
						ObsidianTodo = { bold = true, fg = "#f78c6c" },
						ObsidianDone = { bold = true, fg = "#89ddff" },
						ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
						ObsidianTilde = { bold = true, fg = "#ff5370" },
						ObsidianImportant = { bold = true, fg = "#d73128" },
						ObsidianBullet = { bold = true, fg = "#89ddff" },
						ObsidianRefText = { underline = true, fg = "#c792ea" },
						ObsidianExtLinkIcon = { fg = "#c792ea" },
						ObsidianTag = { italic = true, fg = "#89ddff" },
						ObsidianBlockID = { italic = true, fg = "#89ddff" },
						ObsidianHighlightText = { bg = "#75662e" },
					},
				},
			}
		end,
	},
	-- Markdown.nvim
	{
		"tadmccorkle/markdown.nvim",
		ft = "markdown",
		config = function()
			local markdown = require "markdown"
			markdown.setup {
				link = {
					paste = {
						enable = true,
					},
				},
				toc = {
					markers = { "-" },
				},
			}
		end,
	},
}
