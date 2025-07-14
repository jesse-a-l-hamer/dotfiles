return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  -- For `nvim-treesitter` users.
  priority = 49,
  dependencies = {
    "saghen/blink.cmp", -- For completion source
  },
  ---@module 'markview'
  ---@type markview.config
  opts = {
    preview = {
      icon_provider = "devicons",
      modes = { "i", "n", "no", "c" },
      hybrid_modes = { "i" },
    },
  },
}
