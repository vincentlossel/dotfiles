-- [[ Options ]]

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- The mode is already in the statusline
vim.opt.showmode = false

-- Sync clipboard
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true
vim.opt.tabstop = 4

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching
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
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

--
vim.opt.inccommand = "split"

-- ShaDa
vim.opt.shada = { "'10", "<0", "s10", "h" }

-- Formatting options
vim.opt.formatoptions:remove "o"

-- Text wrapping
vim.opt.wrap = true
vim.opt.linebreak = true

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 6
vim.opt.foldnestmax = 4

-- Writing
vim.opt.spell = false
vim.opt.dictionary = "spell"
