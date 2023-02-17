local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local UserGroup = augroup("Vincent", {})
local YankGroup = augroup("HighlightYank", {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
    group = YankGroup,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = UserGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})
