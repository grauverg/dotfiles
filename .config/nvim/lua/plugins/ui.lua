return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- Важно загрузить тему первой
    config = function()
      require('gruvbox').setup({
        terminal_colors = true,
        transparent_mode = true,
      })
      vim.o.background = "dark"
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
}

