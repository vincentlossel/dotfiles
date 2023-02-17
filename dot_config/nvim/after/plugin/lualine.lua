local lualine_ok, lualine = pcall(require, "lualine")
local tokyonight_ok, lualine_tokyonight = pcall(require, "lualine.themes.tokyonight")
if not lualine_ok or not tokyonight_ok then
    print("ERROR: lualine configuration not loaded!")
    return
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = lualine_tokyonight,
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})

