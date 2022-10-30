local Remap = require("vincent.remap")
local nnoremap = Remap.nnoremap

local status, telescope = pcall(require, "telescope")
if (not status) then
    return
end

nnoremap("<C-p>", ":Telescope<Return>")

nnoremap("<Leader>fs", function()
    require("telescope.builtin").grep_string({ search = vim.fn.input("Grep for > ")})
end)
nnoremap("<Leader>fg", function()
    require('telescope.builtin').git_files()
end)
nnoremap("<Leader>ff", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<Leader>fw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
nnoremap("<Leader>ft", function()
    require('telescope.builtin').buffers()
end)
nnoremap("<Leader>fh", function()
    require('telescope.builtin').help_tags()
end)
