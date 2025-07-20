return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  ---@module 'noice'
  opts = { ---@type NoiceConfig
    lsp = {
      -- handled by lua.util.lsp_hover; uses markview to render hover docs
      hover = { enabled = false },
      -- handled by blink.cmp
      signature = { enabled = false },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
    },
  },
}
