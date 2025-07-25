---@module 'lazy'
return { ---@type LazyPluginSpec
  "sindrets/winshift.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>mm",
      "<cmd>WinShift<cr>",
    },
    {
      "<leader>ms",
      "<cmd>WinShift swap<cr>",
    },
    {
      "<leader>mj",
      "<cmd>WinShift down<cr>",
    },
    {
      "<leader>ml",
      "<cmd>WinShift right<cr>",
    },
    {
      "<leader>mh",
      "<cmd>WinShift left<cr>",
    },
    {
      "<leader>mk",
      "<cmd>WinShift up<cr>",
    },
  },
  opts = {},
}
