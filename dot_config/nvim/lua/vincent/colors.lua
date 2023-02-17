local tokyonight_ok, tokyonight = pcall(require, "tokyonight")
if not tokyonight_ok then
    return
end

tokyonight.setup({
    style = "night",
    light_style = "day",
    transparent = true,
    terminal_colors = true,
    styles = {},
    sidebars = { "qf", "help" },
    day_brightness = 0.3,
    hide_inactive_statusline = false,
    dim_inactive = false,
    lualine_bold = false,
})

local ok, _ = pcall(vim.cmd, "colorscheme tokyonight-night")
if not ok then
    print("ERROR: colorscheme not found!")
    return
end
