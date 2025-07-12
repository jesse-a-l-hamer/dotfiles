return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  -- For `nvim-treesitter` users.
  priority = 49,
  dependencies = {
    "saghen/blink.cmp", -- For completion source
  },
  opts = {
    icon_provider = "mini",
  },
}
