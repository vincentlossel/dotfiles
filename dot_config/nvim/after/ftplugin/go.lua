vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

-- DAP
vim.keymap.set("n", "<Leader>td", function()
	require("dap-go").debug_test()
end)
