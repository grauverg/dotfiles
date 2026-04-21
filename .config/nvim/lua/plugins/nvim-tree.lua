return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 },
        renderer = {
          highlight_opened_files = "all",
          -- Настройка, чтобы дерево тоже было прозрачным (как и сам nvim)
        },
      })
      -- Хоткей: Ctrl + n для открытия дерева
      vim.keymap.set('n', '<C-t>', ':NvimTreeToggle<CR>')
      vim.keymap.set('n', '<C-f>', ':NvimTreeFocus<CR>')
    end
  }
}
