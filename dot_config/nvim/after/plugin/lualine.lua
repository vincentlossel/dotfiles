local status, lualine = pcall(require, "lualine")
if not status then
    return
end

-- Theme
local lualine_tokyonight = require("lualine.themes.tokyonight")

lualine.setup({
    options = {
        theme = lualine_tokyonight
    }
})

