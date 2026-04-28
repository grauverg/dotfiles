return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui", -- Красивый интерфейс (окна со стеком, переменными)
			"nvim-neotest/nvim-nio", -- Нужно для работы UI
			"mfussenegger/nvim-dap-python", -- Специальный адаптер для Python
			"williamboman/mason.nvim", -- У нас уже есть, но нужен для установки debugpy
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()

			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
			)
			vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
			vim.fn.sign_define(
				"DapStopped",
				{ text = "➔", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" }
			)

			-- Цвета для кружков (под стиль Gruvbox)
			vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#fb4934" }) -- Красный
			vim.api.nvim_set_hl(0, "DapStopped", { fg = "#b8bb26", bg = "#3c3836" }) -- Зеленый (текущая строка)

			require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

			-- Автоматическое открытие окон дебага
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Горячие клавиши
			vim.keymap.set("n", "<F5>", function()
				dap.continue()
			end)
			vim.keymap.set("n", "<F10>", function()
				dap.step_over()
			end)
			vim.keymap.set("n", "<F11>", function()
				dap.step_into()
			end)
			vim.keymap.set("n", "<leader>db", function()
				dap.toggle_breakpoint()
			end)
		end,
	},
}
