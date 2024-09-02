return {
	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			-- Completions
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			-- Snippets
			{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "rafamadriz/friendly-snippets" },
			-- Icons in LSP suggestions
			{ "onsails/lspkind.nvim" },
			-- Autopairs
			{ "windwp/nvim-ts-autotag" },
			{ "windwp/nvim-autopairs" },
		},
		config = function()
			local cmp = require "cmp"
			local cmp_autopairs = require "nvim-autopairs"
			local luasnip = require "luasnip"
			local lspkind = require "lspkind"

			cmp_autopairs.setup {}
			luasnip.config.setup {}

			-- Integrate nvim-autopairs with cmp
			cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())

			-- CMP Setup
			cmp.setup {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				formatting = {
					-- LSPKind
					expandable_indicator = true,
					format = lspkind.cmp_format {
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
						show_labelDetails = true,
						menu = {
							nvim_lsp = "[LSP]",
							buffer = "[Buffer]",
							path = "[PATH]",
							luasnip = "[LuaSnip]",
						},
					},
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
					{ name = "nvim_lsp", group_index = 1 },
					{ name = "buffer", max_item_count = 5, group_index = 2 },
					{ name = "path", max_item_count = 3, groupd_index = 3 },
					{ name = "luasnip", max_item_count = 3, group_index = 5 },
					{ name = "nvim-lsp-signature-help" },
				},
				experimental = {
					ghost_text = true,
				},
			}
		end,
	},
}
