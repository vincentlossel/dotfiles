return {
	-- Autoformat
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require "conform"

			conform.setup {
				notify_on_error = true,
				formatters_by_ft = {
					lua = { "stylua" },
					python = function(bufnr)
						if conform.get_formatter_info("ruff_format", bufnr).available then
							return { "ruff_format" }
						else
							return { "isort", "black" }
						end
					end,
					go = { "goimports", "gofmt" },
					javascript = { { "prettierd", "prettier" } },
					json = { "jq" },
					templ = { "goimports", "templ" },
					c = { "clang-format" },
					shell = { "shfmt" },
					sql = { "sqlfmt" },
					rust = { "rustfmt" },
					["*"] = { "codespell" },
					["_"] = { "trim_whitespace" },
				},
			}

			-- Format on write
			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function(args)
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
