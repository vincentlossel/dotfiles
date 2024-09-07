return {
	-- LSP Configuration & Plugins
	{
		"neovim/nvim-lspconfig",
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
			local lspconfig = require "lspconfig"
			local mason = require "mason"
			local mason_lspconfig = require "mason-lspconfig"
			local mason_tool_installer = require "mason-tool-installer"

			-- Capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = true,
				lineFoldingOnly = true,
			}

			-- Inlay hints
			local tsserver_inlay_hints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
			}

			-- Servers
			local servers = {
				bashls = true,
				clangd = true,
				gopls = true,
				pyright = true,
				tsserver = {
					settings = {
						typescript = {
							inlayHints = tsserver_inlay_hints,
						},
						javascript = {
							inlayHints = tsserver_inlay_hints,
						},
					},
				},
				biome = true,
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							format = {
								enable = false,
							},
							completion = {
								autoRequire = true,
							},
							hint = {
								enable = true,
								arrayIndex = "Enable",
								setType = true,
							},
							telemetry = { enabled = false },
						},
					},
				},
				jsonls = true,
				yamlls = true,
				cssls = true,
				astro = true,
			}

			-- Formatters
			local formatters = {
				prettierd = true,
				stylelua = true,
			}

			-- Listing servers
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua",
				"codespell",
				"tailwindcss-language-server",
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

					-- Disable rust_analyzer to use `rustacean` instead
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
