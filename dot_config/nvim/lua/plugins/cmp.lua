return {
	-- Autocompletion
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			-- Snippets
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
		},
		{
			-- Snippets
			"saadparwaiz1/cmp_luasnip",
		},
		{
			-- LSP completion
			"hrsh7th/cmp-nvim-lsp",
		},
		{
			-- Path completion
			"hrsh7th/cmp-path",
		},
		{
			-- Buffer completion
			"hrsh7th/cmp-buffer",
		},
		{
			-- Icons in LSP suggestions
			"onsails/lspkind.nvim",
		},
	},
	config = function()
		local cmp = require "cmp"
		local luasnip = require "luasnip"
		local lspkind = require "lspkind"

		luasnip.config.setup {}
		lspkind.init {}

		cmp.setup {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			mapping = cmp.mapping.preset.insert {
				-- Select the [n]ext item
				["<C-n>"] = cmp.mapping.select_next_item(),
				-- Select the [p]revious item
				["<C-p>"] = cmp.mapping.select_prev_item(),

				-- Scroll the documentation window [b]ack / [f]orward
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),

				-- Accept ([y]es) the completion.
				["<C-y>"] = cmp.mapping.confirm { select = true },

				-- Traditional keymaps, just in case
				["<CR>"] = cmp.mapping.confirm { select = true },
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),

				-- Manually trigger a completion
				["<C-Space>"] = cmp.mapping.complete {},

				-- Move around the snippet expansion
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
			},
		}
	end,
}
