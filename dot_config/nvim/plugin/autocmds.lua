-- [[ Basic Autocommands ]]

-- Highlight when yanking text
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
			vim.lsp.inlay_hint.enable(true, args.buf)
		end
	end,
})
