return {
  { -- Collection of various small independent plugins/modules
    "echasnovski/mini.nvim",
    config = function()
      require("mini.icons").setup()

      require("mini.ai").setup { n_lines = 500 }

      require("mini.surround").setup()
      vim.keymap.set({ "n", "x" }, "s", "<Nop>")
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
