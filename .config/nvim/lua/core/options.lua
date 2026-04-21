-- OPTIONS
local opt = vim.opt

opt.number = true -- show line numbers
opt.relativenumber = true -- show relative line position

vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		opt.clipboard = "unnamedplus"
	end,
})

opt.ignorecase = true
opt.smartcase = true

opt.scrolloff = 10
opt.list = false -- show <tab> and trailing spaces
opt.confirm = true

opt.tabstop = 4
opt.softtabstop = 2
opt.shiftwidth = 2

-- optimisation
opt.lazyredraw = true
opt.updatetime = 250
