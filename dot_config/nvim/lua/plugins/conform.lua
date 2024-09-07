return {
	-- Autoformat
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		config = function()
			local conform = require "conform"

			-- If we have Ruff, we use it
			local getPythonFormatter = function(bufnr)
				if conform.get_formatter_info("ruff_format", bufnr).available then
					return { "ruff_format" }
				else
					return { "isort", "black" }
				end
			end

			-- Conform
			conform.setup {
				notify_on_error = true,
				default_format_opts = {
					async = true,
					timeout_ms = 500,
					lsp_format = "fallback",
				},
				formatters_by_ft = {
					javascript = { "biome", "prettierd", "prettier" },
					javascriptreact = { "biome", "prettierd", "prettier" },
					typescript = { "biome", "prettierd", "prettier" },
					typescriptreact = { "biome", "prettierd", "prettier" },
					svelte = { "prettierd", "prettier" },
					python = getPythonFormatter(),
					json = { "jq" },
					rust = { "rustfmt" },
					shell = { "shfmt" },
					templ = { "templ", "goimports", "gofmt" },
					lua = { "stylua" },
					sql = { "sqlfmt" },
					go = { "goimports", "gofmt" },
					c = { "clang-format" },
					["*"] = { "codespell" },
					["_"] = { "trim_whitespace" },
				},
				format_on_save = {
					quiet = true,
					timeout_sec = 500,
					lsp_fallback = true,
				},
			}

			-- Disable/Enable format on write
			vim.api.nvim_create_user_command("FormatDisable", function(args)
				if args.bang then
					-- FormatDisable! will disable formatting just for this buffer
					vim.b.disable_autoformat = true
				else
					vim.g.disable_autoformat = true
				end
			end, {
				desc = "Disable autoformat-on-save",
				bang = true,
			})

			vim.api.nvim_create_user_command("FormatEnable", function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
			end, {
				desc = "Re-enable autoformat-on-save",
			})

			-- Format on write
			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function(args)
					if vim.g.disable_autoformat or vim.b.disable_autoformat then
						return
					end

					conform.format {
						bufnr = args.buf,
						lsp_fallback = true,
						quiet = true,
					}
				end,
			})
		end,
	},
}
