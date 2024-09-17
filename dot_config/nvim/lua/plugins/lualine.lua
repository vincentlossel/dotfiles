return {
	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
		config = function()
			local function truncate_branch_name(branch)
				if not branch or branch == "" then
					return ""
				end

				return branch
			end

			local function harpoon_section()
				local harpoon = require "harpoon"
				local current_file = vim.api.nvim_buf_get_name(0):gsub(vim.fn.getcwd() .. "/", "")
				local marks = harpoon:list().items
				local total_marks = #marks

				if total_marks == 0 then
					return ""
				end

				local mark_idx = nil
				for idx, item in pairs(marks) do
					if item.value == current_file then
						mark_idx = idx
					end
				end

				local current_mark = "-"
				if mark_idx ~= nil then
					current_mark = tostring(mark_idx)
				end

				return string.format("󱡅 %s/%d", current_mark, total_marks)
			end

			local lualine = require "lualine"
			lualine.setup {
				options = {
					icons_enabled = true,
					theme = "catppuccin",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						{ "branch", fmt = truncate_branch_name },
						harpoon_section,
						"diff",
						"diagnostics",
					},
					lualine_c = {
						{ "filename", path = 1 },
					},
					lualine_x = { "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			}
		end,
	},
}
