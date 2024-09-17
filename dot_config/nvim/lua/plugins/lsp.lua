return {
	-- LSP Configuration & Plugins
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			-- Extensions manager
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
			-- UI
			{ "j-hui/fidget.nvim", opts = {} },
			-- Rustacean
			{ "mrcjkb/rustaceanvim", lazy = false },
		},
		config = function()
			local servers = require "plugins.lsp.servers"
			local formatters = require "plugins.lsp.formatters"
			local all_servers = vim.tbl_deep_extend("force", {}, servers, formatters)

			-- Mason
			local mason = require "mason"
			local mason_lspconfig = require "mason-lspconfig"
			local mason_tool_installer = require "mason-tool-installer"

			mason.setup()
			mason_tool_installer.setup {
				ensure_installed = vim.tbl_keys(all_servers),
			}

			-- Capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = true,
				lineFoldingOnly = true,
			}

			-- LSP
			local lspconfig = require "lspconfig"

			mason_lspconfig.setup_handlers {
				function(server_name)
					lspconfig[server_name].setup {
						capabilities = capabilities,
						settings = all_servers[server_name].settings,
						filetypes = (all_servers[server_name] or {}).filetypes,
					}
				end,
			}

			-- Diagnostics
			vim.diagnostic.config {
				title = false,
				underline = true,
				virtual_text = true,
				signs = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					source = "if_many",
					style = "minimal",
				},
			}

			-- Autocmds
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp", { clear = true }),
				callback = function(event)
					-- Helper: mapping function
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					local builtin = require "telescope.builtin"

					-- Keymaps
					map("gd", builtin.lsp_definitions, "[G]oto [D]definition")
					map("gr", builtin.lsp_references, "[G]oto [R]eferences")
					map("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
					map("<Leader>D", builtin.lsp_type_definitions, "Type [D]definition")
					map("<Leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]symbols")
					map("<Leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]symbols")
					map("<Leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<Leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				end,
			})
		end,
	},
	-- LSP Lines: Diagnostics
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			local lsplines = require "lsp_lines"

			lsplines.setup {}

			vim.diagnostic.config {
				-- Default diagnostics
				virtual_text = true,
				-- LSPLines
				virtual_lines = false,
			}
		end,
	},
}
