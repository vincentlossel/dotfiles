return {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
                needFileStatus = {
                    ["codestyle-check"] = "Any",
                },
            },
            format = {
                enable = true,
                defaultConfig = {
                    ident_style = "space",
                    ident_size = "2",
                },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
}
