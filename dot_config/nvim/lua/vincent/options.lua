-- General
vim.opt.shell = "zsh"
vim.opt.title = true

-- Numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.wo.number = true

-- Encoding
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Inputs
vim.opt.mouse = "a"

-- Indentations
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.scrolloff = 8

-- Text
vim.opt.wrap = false

-- Yanking
vim.opt.clipboard = "unnamedplus"

-- Windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Status bar
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 2

-- Errors
vim.opt.errorbells = false

-- Providers (:checkhealth)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.python3_host_prog = "/opt/homebrew/bin/python3"

-- Backups
vim.opt.updatetime = 50
vim.opt.swapfile = false
vim.opt.backup = false

-- Netrw
-- vim.g.loaded_netwr = 1
-- vim.g.loaded_netrwPlugin = 1
vim.g.netrw_banner = 0
vim.g.netwr_browse_split = 0
vim.g.netwr_winsize = 25
