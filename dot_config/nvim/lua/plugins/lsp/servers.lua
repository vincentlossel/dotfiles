return {
	astro = {},
	codespell = {},
	cssls = {},
	bashls = {
		filetypes = {
			"sh",
			"zsh",
		},
	},
	clangd = {},
	gopls = {},
	pyright = {},
	["tailwind-language-server"] = {},
	ts_ls = {
		settings = {
			typescript = {
				inlayHints = {
					includeInlayEnumMemberValueHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayVariableTypeHintsWhenTypeMatchesName = true,
				},
			},
			javascript = {
				inlayHints = {
					includeInlayEnumMemberValueHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayVariableTypeHintsWhenTypeMatchesName = true,
				},
			},
		},
	},
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
	jsonls = {
		settings = {
			json = {
				schema = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	},
	yamlls = {},
}
