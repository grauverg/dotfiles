local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mapping
	vim.keymap.del("n", "<C-t>", { buffer = bufnr })
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local tree = require("nvim-tree")
		tree.setup({
			sort = { sorter = "case_sensitive" },
			view = { width = 30 },
			renderer = { group_empty = true },
			filters = { dotfiles = true },
			on_attach = my_on_attach,
		})
	end,
}
