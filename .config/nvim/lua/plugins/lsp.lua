return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "pyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.enable("pyright")

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = { vim.env.VIMRUNTIME },
						},
						telemetry = { enable = false },
					},
				},
				root_dir = function(fname)
					local util = require("lspconfig.util")
					return util.root_pattern(".git", "init.lua", "init.vim")(fname) or vim.fn.expand("~/.config/nvim")
				end,
			})

			-- Не забудь включить его
			vim.lsp.enable("lua_ls")

			-- LSP hotkeys
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		end,
	},
}
