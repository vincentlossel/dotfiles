return {
	-- Autoformat
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup {
			notify_on_error = true,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters = {
				-- TODO: Fix this formatter configuration
				jq = {
					prepend_args = { "--tab", "--indent", "4" },
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = function(bufnr)
					if require("conform").get_formatter_infor("ruff_format", bufnr).available then
						return { "ruff_format" }
					else
						return { "isort", "black" }
					end
				end,
				go = { "goimports", "gofmt" },
				javascript = { { "prettierd", "prettier" } },
				json = { "jq" },
				["*"] = { "codespell" },
				["_"] = { "trim_whitespace" },

				-- TODO: SQL, C, Shell (shfmt), Django (djlint), Rust (rustfmt), Swift (swiftlint)
			},
		}
	end,
}
