vim.g.background = "light"

local keymap = vim.keymap

vim.opt.swapfile = false

-- Navigate vim panes better
keymap.set("n", "<c-k>", ":wincmd k<CR>")
keymap.set("n", "<c-j>", ":wincmd j<CR>")
keymap.set("n", "<c-h>", ":wincmd h<CR>")
keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.cmd([[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]])

keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true
