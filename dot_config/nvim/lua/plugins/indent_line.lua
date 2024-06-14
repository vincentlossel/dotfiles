return {
	-- Indentation
	"lukas-reineke/indent-blankline.nvim",
	event = "BufReadPre",
	config = function()
		require("ibl").setup {}
	end,
}
