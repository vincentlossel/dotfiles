return {
	-- Debug Adapter Protocol (DAP)
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "rcarriga/nvim-dap-ui" },
			{ "theHamsta/nvim-dap-virtual-text" },
			{ "nvim-neotest/nvim-nio" },
			-- Go DAP
			{ "leoluz/nvim-dap-go" },
		},
		config = function()
			local dap = require "dap"
			local ui = require "dapui"

			ui.setup {}

			require("nvim-dap-virtual-text").setup {
				-- Attempt to hide secrets
				display_callback = function(variable)
					local name = string.lower(variable.name)
					local value = string.lower(variable.value)

					if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
						return "*****"
					end

					if #variable.value > 15 then
						return " " .. string.sub(variable.value, 1, 15) .. "... "
					end

					return " " .. variable.value
				end,
			}

			-- Keymaps
			vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
			vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

			-- Eval under cursor
			vim.keymap.set("n", "<space>?", function()
				ui.eval(nil, {
					enter = true,
				})
			end)

			-- Keymaps
			vim.keymap.set("n", "<F1>", dap.continue)
			vim.keymap.set("n", "<F2>", dap.step_into)
			vim.keymap.set("n", "<F3>", dap.step_over)
			vim.keymap.set("n", "<F4>", dap.step_out)
			vim.keymap.set("n", "<F5>", dap.step_back)
			vim.keymap.set("n", "<F13>", dap.restart)

			-- UI
			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},
}
