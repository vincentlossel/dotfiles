local startup_ok, startup = pcall(require, "startup")
if not startup_ok then
    return
end

startup.setup({
    theme = "startify",
    options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 1, 2 },
    },
    mappings = {
        execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<C-o>",
        open_section = "<Tab>",
        open_help = "?",
    },
    colors = {
        background = "#1f2227",
        folded_section = "#56b6c2",
    },
    parts = { "section_1", "section_2" },
})
