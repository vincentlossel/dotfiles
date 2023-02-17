local mark_ok, mark = pcall(require, "harpoon.mark")
local ui_ok, ui = pcall(require, "harpoon.ui")

if not mark_ok or not ui_ok then
    return
end

vim.keymap.set("n", "<Leader>h", ui.toggle_quick_menu, { noremap = true })
vim.keymap.set("n", "<Leader>ha", mark.add_file, { noremap = true })
vim.keymap.set("n", "<Leader>hd", mark.rm_file, { noremap = true })

for i = 1, 5 do
    vim.keymap.set("n", string.format("<Leader>h%s", i), function() ui.nav_file(i) end, { noremap = true })
end

require("harpoon").setup({
    global_settings = {
        save_on_toggle = true,
        save_on_change = true,
        enter_on_sendcmd = false,
        tmux_autoclose_windows = false,
        excluded_filetypes = { "harpoon" },
        mark_branch = false,
    }
})
