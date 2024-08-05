return {
	-- LSP Configuration & Plugins
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Extensions manager
			{ "williamboman/mason.nvim" },
			-- Mason and LSPConfig
			{ "williamboman/mason-lspconfig.nvim" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			-- LSPConfig
			local lspconfig = require "lspconfig"
			local mason = require "mason"
			local mason_tool_installer = require "mason-tool-installer"
			local mason_lspconfig = require "mason-lspconfig"

			-- Create new capabilities to talk with CMPlsp
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- Swift > SourceKit
			lspconfig.sourcekit.setup {
				sourcekit = {
					capabilities = {
						workspace = {
							didChangeWatchedFiles = {
								dynamicRegistration = true,
							},
						},
					},
				},
			}

			local servers = {
				bashls = true,
				clangd = true,
				gopls = true,
				pyright = true,
				-- TODO: Disable formatting for `tsserver` and use `biome` instead
				tsserver = true,
				biome = true,
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				},
				jsonls = true,
				yamlls = true,
				cssls = true,
				astro = true,
			}

			-- Listing servers
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua",
			})

			local servers_to_install = vim.tbl_filter(function(key)
				local t = servers[key]
				if type(t) == "table" then
					return not t.manual_install
				else
					return t
				end
			end, vim.tbl_keys(servers))
			vim.list_extend(ensure_installed, servers_to_install)

			-- Mason
			mason.setup()
			mason_tool_installer.setup {
				ensure_installed = ensure_installed,
			}

			-- Setup servers and override explicitly set values
			mason_lspconfig.setup {
				handlers = {
					function(server_name)
						local server
						if type(servers[server_name]) == "boolean" then
							server = {}
						else
							server = servers[server_name] or {}
						end

						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						lspconfig[server_name].setup(server)
					end,
					-- Disable rust_analyzer to use rustacean
					["rust_analyzer"] = function() end,
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

					-- Jump to the definition of the word under your cursor.
					map("gd", builtin.lsp_definitions, "[G]oto [D]definition")

					-- Find references for the word under your cursor.
					map("gr", builtin.lsp_references, "[G]oto [R]eferences")

					-- Jump to the implementation of the word under your cursor.
					map("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")

					-- Jump to the type of the word under your cursor.
					map("<leader>D", builtin.lsp_type_definitions, "Type [D]definition")

					-- Fuzzy find all the symbols in your current document.
					map("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]symbols")

					-- Fuzzy find all the symbols in your current workspace
					map("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]symbols")

					-- Rename the variable under your cursor
					map("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					-- Opens a popup that displays documentation about the word under your cursor
					map("K", vim.lsp.buf.hover, "Hover Documentation")

					-- Go to Declaration
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
				virtual_text = false,
				-- LSPLines
				virtual_lines = true,
			}
		end,
	},
}
