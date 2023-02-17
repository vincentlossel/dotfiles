local lsp_ok, lsp = pcall(require, "lsp-zero")
if not lsp_ok then
    return
end

local keymap = vim.keymap

lsp.preset("recommended")

lsp.ensure_installed({
    "eslint",
    "gopls",
    "tsserver",
    "sumneko_lua",
    "rust_analyzer",
    "tsserver",
})

-- Fixing an error with vim as global variable
lsp.configure("sumneko_lua", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})

local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
    return
end

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- Disabling Tabs for GitHub Copilot
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I",
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false, silent = true, }

    keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    keymap.set("n", "K", vim.lsp.buf.hover, opts)
    keymap.set("n", "<Leader>f", vim.lsp.buf.format, opts)
    keymap.set("n", "<Leader>vws", vim.lsp.buf.workspace_symbol, opts)
    keymap.set("n", "<Leader>vd", vim.diagnostic.open_float, opts)
    keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    keymap.set("n", "<Leader>vca", vim.lsp.buf.code_action, opts)
    keymap.set("n", "<Leader>vrr", vim.lsp.buf.references, opts)
    keymap.set("n", "<Leader>vrn", vim.lsp.buf.rename, opts)
    keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

    -- Disable ESLint
    if client.name == "eslint" then
        vim.cmd.LspStop("eslint")
        return
    end

    -- Format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end
    })

end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
