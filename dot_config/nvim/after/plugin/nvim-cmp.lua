local cmp_status, cmp = pcall(require, "cmp")
if not status then
    print("cmp not imported")
    return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not status then
    print("luasnip not imported")
    return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not status then
    print("lspkind not imported")
    return
end

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    -- Snippets
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    -- Sources for autocompletion
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    }),
})
