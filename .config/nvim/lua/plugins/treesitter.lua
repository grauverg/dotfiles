return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				-- Список парсеров
				ensure_installed = { "python", "lua", "vim", "vimdoc", "query", "bash" },

				-- Умная подсветка
				highlight = {
					enable = true,
				},
				-- Умные отступы
				indent = {
					enable = true,
				},
			})
		end,
	},
}
