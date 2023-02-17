vim.g.mapleader = " "

vim.keymap.set("n", "x", "_x")

-- Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
vim.keymap.set("n", "dw", "vbd")

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
vim.keymap.set("n", "te", ":tabedit")

-- Split window
vim.keymap.set("n", "ss", ":split<Return><C-w>w")
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- Move window
vim.keymap.set("n", "<Space>", "<C-w>w")
vim.keymap.set("", "sh", "<C-w>h")
vim.keymap.set("", "sk", "<C-w>k")
vim.keymap.set("", "sj", "<C-w>j")
vim.keymap.set("", "sl", "<C-w>l")

-- Resize window
vim.keymap.set("n", "<C-w><left>", "<C-w><")
vim.keymap.set("n", "<C-w><right>", "<C-w>>")
vim.keymap.set("n", "<C-w><up>", "<C-w>+")
vim.keymap.set("n", "<C-w><down>", "<C-w>-")

-- Explorer
vim.keymap.set("n", "<Leader>pv", ":Ex<Return>")
vim.keymap.set("n", "<C-c>", "<Cmd>NvimTreeToggle<CR>", { noremap = true })
-- vim.keymap.set("n", "", "<Cmd>NvimTreeFocus<CR>", { noremap = true })
-- vim.keymap.set("n", "", "<Cmd>NvimTreeFindFile<CR>", { noremap = true })
-- vim.keymap.set("n", "", "<Cmd>NvimTreeCollapse<CR>", { noremap = true })

-- Neogen
vim.keymap.set("n", "<Leader>nc", "<Cmd>Neogen class<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>nf", "<Cmd>Neogen func<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>nt", "<Cmd>Neogen type<CR>", { noremap = true })
