return {
	-- Color Scheme
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- Load the colorscheme here
		vim.cmd.colorscheme "kanagawa"

		-- Highlights
		vim.cmd.hi "Comment gui=none"

		-- Load colorscheme
		vim.cmd.colorscheme "kanagawa"
	end,
}
