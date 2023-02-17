local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
    return
end

local lspkind = require("lspkind")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({

    }),
    sources = cmp.config.sources({
        {
            name = "nvim_lsp",
            entry_filter = function(entry)
                return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
            end,
        },
        {
            name = "luasnip",
        },
    }),
    formatting = {
        format = function(entry, vim_item)
            if vim.tbl_contains({ "path" }, entry.source.name) then
                local icon, hl_group = require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
                if icon then
                    vim_item.kind = icon
                    vim_item.kind_hl_group = hl_group

                    return vim_item
                end
            end

            return lspkind.cmp_format({ with_text = true })(entry, vim_item)
        end,
    }
})
