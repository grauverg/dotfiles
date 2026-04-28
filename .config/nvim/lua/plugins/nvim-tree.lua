return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- 1. Сначала инициализация
			require("nvim-tree").setup({
				view = { width = 30 },
				renderer = {
					highlight_opened_files = "all",
				},
			})

			vim.keymap.set("n", "<C-t>", ":NvimTreeToggle<CR>")
			vim.keymap.set("n", "<C-f>", ":NvimTreeFocus<CR>")

			vim.api.nvim_create_autocmd("BufEnter", {
				group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
				pattern = "NvimTree_*",
				callback = function()
					local layout = vim.api.nvim_call_function("winlayout", {})
					if
						layout[1] == "leaf"
						and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype")
							== "NvimTree"
					then
						vim.cmd("confirm quit")
					end
				end,
			})
		end,
	},
}
