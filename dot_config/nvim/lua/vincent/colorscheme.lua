vim.g.tokyonight_transprent = true
vim.g.tokyonight_transparent_sidebar = true

local status, _ = pcall(vim.cmd, "colorscheme tokyonight-night")

if not status then 
    print("Colorscheme not found!")
    return
end

