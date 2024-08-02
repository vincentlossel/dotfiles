-- [[ Basic Keymaps ]]

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>")

-- Basics
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Shortcuts
vim.keymap.set("n", "QQ", "<Cmd>q!<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "WW", "<Cmd>w!<CR>", { desc = "Save current buffer" })

-- Split window
vim.keymap.set("n", "sv", "<Cmd>vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "sh", "<Cmd>split<CR>", { desc = "Horizontal split" })

-- TODO: Inlay hints
