-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable some providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Enable 24-bit colors
vim.opt.termguicolors = true

-- Enable relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Disable showing the mode below the statusline
vim.opt.showmode = false

-- Sync clipboard
vim.opt.clipboard = "unnamed,unnamedplus"

-- Auto-indenting
vim.opt.smartindent = true
vim.opt.shiftwidth = 4

-- Complete options
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Enable break indent
vim.opt.breakindent = true

-- Tabs
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Display whitespace
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", lead = "·", nbsp = "␣" }

-- Preview substitutions live
vim.opt.inccommand = "split"

-- Enable cursor line
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- ShaDa
vim.opt.shada = { "'10", "<0", "s10", "h" }

-- Formatting options
vim.opt.formatoptions:remove "o"

-- Text wrapping
vim.opt.wrap = false
vim.opt.linebreak = false

-- Column line
-- vim.opt.colorcolumn = "80"

-- Fold settings
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 5
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Spell checkin
vim.opt.spell = false
vim.opt.dictionary = "spell"
