local tree_ok, tree = pcall(require, "nvim-tree")
if not tree_ok then
    return
end

tree.setup({
    auto_reload_on_write = true,
    open_on_setup = false,
    sort_by = "case_insensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
        git_clean = false,
        no_buffer = false,
        exclude = { "node_modules" }
    },
})
