return {
  -- FZF Lua
  {
    "ibhagwan/fzf-lua",
    config = function()
      require('fzf-lua').setup { fzf_colors = true }
    end
  },

  
  -- Quicker
  {
    "stevearc/quicker.nvim",
    config = function()
      require('quicker').setup {}
    end
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup {}
    end
  },
}
