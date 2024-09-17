-- Clear search highlight on pressing <Esc>
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>")

-- Center motions
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
vim.keymap.set("n", "sv", "<Cmd>vsplit<CR>", { desc = "[V]ertical [S]plit" })
vim.keymap.set("n", "sh", "<Cmd>split<CR>", { desc = "[H]orizontal [S]plit" })

-- Virtual Text
vim.keymap.set("n", "<Leader>ie", "<Cmd>lua vim.lsp.inlay_hint.enable(true)<CR>", { desc = "[E]nable [I]nlay hints" })
vim.keymap.set("n", "<Leader>id", "<Cmd>lua vim.lsp.inlay_hint.enable(false)<CR>", { desc = "[D]isable [I]nlay hints" })
