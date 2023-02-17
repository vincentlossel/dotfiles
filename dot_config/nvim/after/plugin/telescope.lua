local telescope_ok, telescope = pcall(require, "telescope")
local builtin_ok, builtin = pcall(require, "telescope.builtin")
if not telescope_ok or not builtin_ok then
    return
end

-- Keymaps
vim.keymap.set("", "<C-p>", "<Cmd>Telescope<CR>")
vim.keymap.set("", "<Leader>gs", builtin.git_files, {})
vim.keymap.set("", "<Leader>ff", builtin.find_files, {})
vim.keymap.set("", "<Leader>fg", builtin.live_grep, {})
vim.keymap.set("", "<Leader>fb", builtin.buffers, {})
vim.keymap.set("", "<Leader>fh", builtin.help_tags, {})
vim.keymap.set("", "<Leader>fk", builtin.keymaps, {})

-- Setup
telescope.setup({
    defaults = {
        path_display = { "smart" },
        layout_config = {
            horizontal = {
                preview_cutoff = 100,
                preview_widtg = 0.6,
            },
        },
    },
    pickers = {
        find_files = {
            theme = "dropdown",
        },
        live_grep = {
            theme = "dropdown",
        },
    },
    extensions = {
        "harpoon",
        fzf = {
            fuzzy = true,
            override_generice_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
})

-- Extensions
telescope.load_extension("dap")
telescope.load_extension("fzf")
