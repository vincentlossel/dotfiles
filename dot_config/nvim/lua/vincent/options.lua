vim.cmd("autocmd!")

vim.opt.scrolloff = 10
vim.wo.number = true
vim.opt.shell = "zsh"
vim.opt.updatetime = 50
vim.opt.title = true
vim.opt.nu = true
vim.opt.relativenumber = true

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
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

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
