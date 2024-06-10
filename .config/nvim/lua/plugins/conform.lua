return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "pyright" },
				markdowm = { "prettier" },
				graphql = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				async = false,
				lsp_fallback = true,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>gf", function()
			require("conform").format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
