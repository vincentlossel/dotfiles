local neogen_ok, neogen = pcall(require, "neogen")
if not neogen_ok then
    return
end

neogen.setup({
    enabled = true,
    snippet_engine = "luasnip",
    input_after_comment = true,
    languages = {
        go = {
            template = {
                annotation_convention = "godoc",
            },
        },
        lua = {
            template = {
                annotation_convention = "emmylua",
            },
        },
        python = {
            template = {
                annotation_convention = "google_docstrings",
            },
        },
        rust = {
            template = {
                annotation_convention = "rustdoc",
            },
        },
    },
})
