vim.keymap.set("n", "<Leader>td", function()
	require("dap-go").debug_test()
end)
