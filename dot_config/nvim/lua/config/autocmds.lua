-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("HighlightYanking", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- LSP Autocmds
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Enable LSP inlay hints if available",
	group = vim.api.nvim_create_augroup("UserLSPConfig", {}),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client.server_capabilities.inlayHintProvider then
			-- Enable inlay hints if available
			vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
		end
	end,
})

-- Don't auto-comment on new line
vim.api.nvim_create_autocmd("BufEnter", {
	command = [[set formatoptions-=cro]],
})

-- Show cursor line only in active buffer
local cursorGroup = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
	pattern = "*",
	command = "set cursorline",
	group = cursorGroup,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
	pattern = "*",
	command = "set nocursorline",
	group = cursorGroup,
})

-- Enable spell checking for certain files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = {
		"*.txt",
		"*.md",
		"*.tex",
	},
	callback = function()
		vim.opt.spell = true
		vim.opt.spelllang = "en,fr,de"
	end,
})

-- Resize splits when the terminal is resized
vim.api.nvim_command "autocmd VimResized * wincmd ="
